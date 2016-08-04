/*
 * This program turns on the 4 leds of the stm32f4 discovery board
 * one after another.
 * It defines shortcut definitions for the led pins and
 * stores the order of the leds in an array which is being
 * iterated in a loop.
 *
 * This program is free human culture like poetry, mathematics
 * and science. You may use it as such.
 */

#include <math.h>

#include <stm32f4_discovery.h>


#define MCU_HZ 168000000
#define SRAM_SIZE ((uint32_t)(2*1024*1024))

/* This is apparently needed for libc/libm (eg. powf()). */
int __errno;


static void delay(uint32_t nCount)
{
  while(nCount--)
    __asm volatile(""); // do nothing, should give 3 cycles/loop iteration.
}


static void setup_serial(void)
{
  GPIO_InitTypeDef GPIO_InitStructure;
  USART_InitTypeDef USART_InitStructure;

  /* enable peripheral clock for USART2 */
  RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART2, ENABLE);

  /* GPIOA clock enable */
  RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);

  /* GPIOA Configuration:  USART2 TX on PA2 */
  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_2;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP ;
  GPIO_Init(GPIOA, &GPIO_InitStructure);

  /* Connect USART2 pins to AF2 */
  // TX = PA2
  GPIO_PinAFConfig(GPIOA, GPIO_PinSource2, GPIO_AF_USART2);

  USART_InitStructure.USART_BaudRate = 115200;
  USART_InitStructure.USART_WordLength = USART_WordLength_8b;
  USART_InitStructure.USART_StopBits = USART_StopBits_1;
  USART_InitStructure.USART_Parity = USART_Parity_No;
  USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
  USART_InitStructure.USART_Mode = USART_Mode_Tx;
  USART_Init(USART2, &USART_InitStructure);

  USART_Cmd(USART2, ENABLE); // enable USART2
}


static void
setup_led(void)
{
  GPIO_InitTypeDef GPIO_InitStructure;

  RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOG, ENABLE);
  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_15;
  GPIO_InitStructure.GPIO_Mode  = GPIO_Mode_OUT;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_PuPd  = GPIO_PuPd_NOPULL;
  GPIO_Init(GPIOG, &GPIO_InitStructure);
}


static void
led_on(void)
{
  GPIO_SetBits(GPIOG, GPIO_Pin_15);
}


static void
led_off(void)
{
  GPIO_ResetBits(GPIOG, GPIO_Pin_15);
}


static void
serial_putchar(USART_TypeDef* USARTx, uint32_t c)
{
  while(!(USARTx->SR & USART_FLAG_TC));
  USART_SendData(USARTx, c);
}


static void
serial_puts(USART_TypeDef *usart, const char *s)
{
  while (*s)
    serial_putchar(usart, (uint8_t)*s++);
}


static void
serial_output_hexdig(USART_TypeDef* USARTx, uint32_t dig)
{
  serial_putchar(USARTx, (dig >= 10 ? 'A' - 10 + dig : '0' + dig));
}


__attribute__ ((unused))
static void
serial_output_hexbyte(USART_TypeDef* USARTx, uint8_t byte)
{
  serial_output_hexdig(USARTx, byte >> 4);
  serial_output_hexdig(USARTx, byte & 0xf);
}


__attribute__ ((unused))
static void
serial_output_hex(USART_TypeDef* USARTx, uint32_t v)
{
  serial_putchar(USARTx, '0');
  serial_putchar(USARTx, 'x');
  serial_output_hexbyte(USARTx, v >> 24);
  serial_output_hexbyte(USARTx, (v >> 16) & 0xff);
  serial_output_hexbyte(USARTx, (v >> 8) & 0xff);
  serial_output_hexbyte(USARTx, v & 0xff);
}


__attribute__ ((unused))
static void
println_uint32(USART_TypeDef* usart, uint32_t val)
{
  char buf[13];
  char *p = buf;
  uint32_t l, d;

  l = 1000000000UL;
  while (l > val && l > 1)
    l /= 10;

  do
  {
    d = val / l;
    *p++ = '0' + d;
    val -= d*l;
    l /= 10;
  } while (l > 0);

  *p++ = '\r';
  *p++ = '\n';
  *p = '\0';
  serial_puts(usart, buf);
}


__attribute__ ((unused))
static void
println_int32(USART_TypeDef* usart, int32_t val)
{
  if (val < 0)
  {
    serial_putchar(usart, '-');
    println_uint32(usart, (uint32_t)0 - (uint32_t)val);
  }
  else
    println_uint32(usart, val);
}


static void
float_to_str(char *buf, float f, uint32_t dig_before, uint32_t dig_after)
{
  float a;
  uint32_t d;
  uint8_t leading_zero;

  if (f == 0.0f)
  {
    buf[0] = '0';
    buf[1] = '\0';
    return;
  }
  if (f < 0)
  {
    *buf++ = '-';
    f = -f;
  }
  a =  powf(10.0f, (float)dig_before);
  if (f >= a)
  {
    buf[0] = '#';
    buf[1] = '\0';
    return;
  }
  leading_zero = 1;
  while (dig_before)
  {
    a /= 10.0f;
    d = (uint32_t)(f / a);
    if (leading_zero && d == 0 && a >= 10.0f)
      *buf++ = ' ';
    else
    {
      leading_zero = 0;
      *buf++ = '0' + d;
      f -= d*a;
    }
    --dig_before;
  }
  if (!dig_after)
  {
    *buf++ = '\0';
    return;
  }
  *buf++ = '.';
  do
  {
    f *= 10.0f;
    d = (uint32_t)f;
    *buf++ = '0' + d;
    f -= (float)d;
    --dig_after;
  } while (dig_after);
  *buf++ = '\0';
}


__attribute__ ((unused))
static void
println_float(USART_TypeDef* usart, float f,
              uint32_t dig_before, uint32_t dig_after)
{
  char buf[21];
  char *p = buf;

  float_to_str(p, f, dig_before, dig_after);
  while (*p)
    ++p;
  *p++ = '\r';
  *p++ = '\n';
  *p = '\0';
  serial_puts(usart, buf);
}


static void
fill_mem_inc(uint16_t start, uint32_t block)
{
  uint16_t *mem = (uint16_t *)(uint32_t)0x60000000;
  uint32_t i, j;
  uint16_t v = start;

  for (i = 0; i < SRAM_SIZE; i += block)
  {
    for (j = 0; j < block; j += 2)
    {
      mem[(i+j)/2] = v;
    }
    ++v;
  }
}


static uint32_t
check_mem_inc(uint16_t start, uint32_t block)
{
  uint16_t *mem = (uint16_t *)(uint32_t)0x60000000;
  uint32_t i, j;
  uint32_t err = 0;
  uint16_t v = start;

  for (i = 0; i < SRAM_SIZE; i += block)
  {
    for (j = 0; j < block; j += 2)
    {
      uint16_t d = mem[(i+j)/2];
      if (d != v)
      {
        ++err;
        if (err <= 5)
        {
          serial_puts(USART2, "[0x");
          serial_output_hexbyte(USART2, d >> 8);
          serial_output_hexbyte(USART2, d & 0xff);
          serial_puts(USART2, "!=0x");
          serial_output_hexbyte(USART2, v >> 8);
          serial_output_hexbyte(USART2, v & 0xff);
          serial_puts(USART2, "]");
        }
      }
    }
    ++v;
  }
  return err;
}


static void
check_block(uint16_t start, uint32_t block)
{
  uint32_t err;

  serial_puts(USART2, "write block start=0x");
  serial_output_hexbyte(USART2, start >> 8);
  serial_output_hexbyte(USART2, start & 0xff);
  serial_puts(USART2, " size=");
  println_uint32(USART2, block);
  led_on();
  fill_mem_inc(start, block);

  serial_puts(USART2, "Read back ...");
  led_off();
  err = check_mem_inc(start, block);
  serial_puts(USART2, " errors=");
  println_uint32(USART2, err);
}


void
mem_test(void)
{
  uint16_t word;

  word = 1;
  while (1)
  {
    check_block(word, 2);
    check_block(word, 4);
    check_block(word, 32);
    check_block(word, 4096);
    check_block(word, 0x10000);

    word += 18637;
  }
}


__attribute__((unused))
static void
write_fpga(uint32_t offset, uint16_t val)
{
  /* 0x64000000 is the start of bank1 SRAM2. */
  volatile uint16_t *fpga = (volatile uint16_t *)(uint32_t)0x64000000;

  *(fpga+(offset>>1)) = val;
}


__attribute__((unused))
static uint16_t
read_fpga(uint32_t offset)
{
  /* 0x64000000 is the start of bank1 SRAM2. */
  volatile uint16_t *fpga = (volatile uint16_t *)(uint32_t)0x64000000;

  return *(fpga+(offset>>1));
}


__attribute__((unused))
static void
pulse_pin_test(void)
{
  GPIO_InitTypeDef GPIO_InitStructure;
  uint16_t val1, val2;

  /* GPIOF clock enable */
  RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOF, ENABLE);

  /* GPIOF Configuration: Output pulse on PF11. */
  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_11;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL ;
  GPIO_Init(GPIOF, &GPIO_InitStructure);

  val1 = 0;
  val2 = 0;
  for (;;) {
    write_fpga(0, val1++);
    GPIO_SetBits(GPIOF, GPIO_Pin_11);
    led_on();
    delay(MCU_HZ/3/4);
    write_fpga(0, val1++);
    write_fpga(2, val2++);
    GPIO_ResetBits(GPIOF, GPIO_Pin_11);
    led_off();
    delay(MCU_HZ/3/4);
  }
}


__attribute__((unused))
static void
fpga_test(void)
{
  led_on();
  write_fpga(0, 0b111);
  write_fpga(2, 0b111);
  serial_puts(USART2, "Read back: ");
  serial_output_hex(USART2, read_fpga(0));
  serial_puts(USART2, " ");
  serial_output_hex(USART2, read_fpga(2));
  serial_puts(USART2, "\n");

  delay(MCU_HZ/3);
  led_off();
  write_fpga(0, 0b000);
  write_fpga(2, 0b000);
  serial_puts(USART2, "Read back: ");
  serial_output_hex(USART2, read_fpga(0));
  serial_puts(USART2, " ");
  serial_output_hex(USART2, read_fpga(2));
  serial_puts(USART2, "\n");

  delay(MCU_HZ/3);
  led_on();
  write_fpga(0, 0b101);
  write_fpga(2, 0b010);
  serial_puts(USART2, "Read back: ");
  serial_output_hex(USART2, read_fpga(0));
  serial_puts(USART2, " ");
  serial_output_hex(USART2, read_fpga(2));
  serial_puts(USART2, "\n");

  delay(MCU_HZ/3);
  led_off();
  write_fpga(0, 0b010);
  write_fpga(2, 0b101);
  serial_puts(USART2, "Read back: ");
  serial_output_hex(USART2, read_fpga(0));
  serial_puts(USART2, " ");
  serial_output_hex(USART2, read_fpga(2));
  serial_puts(USART2, "\n");

  delay(MCU_HZ/3);
  led_on();
  write_fpga(0, 0b110);
  write_fpga(2, 0b011);
  serial_puts(USART2, "Read back: ");
  serial_output_hex(USART2, read_fpga(0));
  serial_puts(USART2, " ");
  serial_output_hex(USART2, read_fpga(2));
  serial_puts(USART2, "\n");

  delay(MCU_HZ/3);
  led_off();
  write_fpga(0, 0b111);
  write_fpga(2, 0b111);
  serial_puts(USART2, "Read back: ");
  serial_output_hex(USART2, read_fpga(0));
  serial_puts(USART2, " ");
  serial_output_hex(USART2, read_fpga(2));
  serial_puts(USART2, "\n");

  for (;;)
    ;
}


static void
fsmc_manual_init(void)
{
  FSMC_NORSRAMInitTypeDef fsmc_init;
  FSMC_NORSRAMTimingInitTypeDef timing, alttiming;
  GPIO_InitTypeDef GPIO_InitStructure;

  /* GPIOD, E, F, and G clock enable */
  RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOD, ENABLE);
  RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOE, ENABLE);
  RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOF, ENABLE);
  RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOG, ENABLE);

  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0|GPIO_Pin_1|GPIO_Pin_4|GPIO_Pin_5|
    GPIO_Pin_7|GPIO_Pin_8|GPIO_Pin_9|GPIO_Pin_10|GPIO_Pin_11|
    GPIO_Pin_12|GPIO_Pin_13|GPIO_Pin_14|GPIO_Pin_15;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
  GPIO_Init(GPIOD, &GPIO_InitStructure);
  GPIO_PinAFConfig(GPIOD, GPIO_PinSource0, GPIO_AF_FSMC);
  GPIO_PinAFConfig(GPIOD, GPIO_PinSource1, GPIO_AF_FSMC);
  GPIO_PinAFConfig(GPIOD, GPIO_PinSource4, GPIO_AF_FSMC);
  GPIO_PinAFConfig(GPIOD, GPIO_PinSource5, GPIO_AF_FSMC);
  GPIO_PinAFConfig(GPIOD, GPIO_PinSource7, GPIO_AF_FSMC);
  GPIO_PinAFConfig(GPIOD, GPIO_PinSource8, GPIO_AF_FSMC);
  GPIO_PinAFConfig(GPIOD, GPIO_PinSource9, GPIO_AF_FSMC);
  GPIO_PinAFConfig(GPIOD, GPIO_PinSource10, GPIO_AF_FSMC);
  GPIO_PinAFConfig(GPIOD, GPIO_PinSource11, GPIO_AF_FSMC);
  GPIO_PinAFConfig(GPIOD, GPIO_PinSource12, GPIO_AF_FSMC);
  GPIO_PinAFConfig(GPIOD, GPIO_PinSource13, GPIO_AF_FSMC);
  GPIO_PinAFConfig(GPIOD, GPIO_PinSource14, GPIO_AF_FSMC);
  GPIO_PinAFConfig(GPIOD, GPIO_PinSource15, GPIO_AF_FSMC);

  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0|GPIO_Pin_1|GPIO_Pin_3|GPIO_Pin_4|
    GPIO_Pin_7|GPIO_Pin_8|GPIO_Pin_9|GPIO_Pin_10|GPIO_Pin_11|
    GPIO_Pin_12|GPIO_Pin_13|GPIO_Pin_14|GPIO_Pin_15;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
  GPIO_Init(GPIOE, &GPIO_InitStructure);
  GPIO_PinAFConfig(GPIOE, GPIO_PinSource0, GPIO_AF_FSMC);
  GPIO_PinAFConfig(GPIOE, GPIO_PinSource1, GPIO_AF_FSMC);
  GPIO_PinAFConfig(GPIOE, GPIO_PinSource3, GPIO_AF_FSMC);
  GPIO_PinAFConfig(GPIOE, GPIO_PinSource4, GPIO_AF_FSMC);
  GPIO_PinAFConfig(GPIOE, GPIO_PinSource7, GPIO_AF_FSMC);
  GPIO_PinAFConfig(GPIOE, GPIO_PinSource8, GPIO_AF_FSMC);
  GPIO_PinAFConfig(GPIOE, GPIO_PinSource9, GPIO_AF_FSMC);
  GPIO_PinAFConfig(GPIOE, GPIO_PinSource10, GPIO_AF_FSMC);
  GPIO_PinAFConfig(GPIOE, GPIO_PinSource11, GPIO_AF_FSMC);
  GPIO_PinAFConfig(GPIOE, GPIO_PinSource12, GPIO_AF_FSMC);
  GPIO_PinAFConfig(GPIOE, GPIO_PinSource13, GPIO_AF_FSMC);
  GPIO_PinAFConfig(GPIOE, GPIO_PinSource14, GPIO_AF_FSMC);
  GPIO_PinAFConfig(GPIOE, GPIO_PinSource15, GPIO_AF_FSMC);

  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0|GPIO_Pin_1|GPIO_Pin_2|GPIO_Pin_3|
    GPIO_Pin_4|GPIO_Pin_5|GPIO_Pin_12|GPIO_Pin_13|GPIO_Pin_14|GPIO_Pin_15;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
  GPIO_Init(GPIOF, &GPIO_InitStructure);
  GPIO_PinAFConfig(GPIOF, GPIO_PinSource0, GPIO_AF_FSMC);
  GPIO_PinAFConfig(GPIOF, GPIO_PinSource1, GPIO_AF_FSMC);
  GPIO_PinAFConfig(GPIOF, GPIO_PinSource2, GPIO_AF_FSMC);
  GPIO_PinAFConfig(GPIOF, GPIO_PinSource3, GPIO_AF_FSMC);
  GPIO_PinAFConfig(GPIOF, GPIO_PinSource4, GPIO_AF_FSMC);
  GPIO_PinAFConfig(GPIOF, GPIO_PinSource5, GPIO_AF_FSMC);
  GPIO_PinAFConfig(GPIOF, GPIO_PinSource12, GPIO_AF_FSMC);
  GPIO_PinAFConfig(GPIOF, GPIO_PinSource13, GPIO_AF_FSMC);
  GPIO_PinAFConfig(GPIOF, GPIO_PinSource14, GPIO_AF_FSMC);
  GPIO_PinAFConfig(GPIOF, GPIO_PinSource15, GPIO_AF_FSMC);

  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0|GPIO_Pin_1|GPIO_Pin_2|GPIO_Pin_3|
    GPIO_Pin_4|GPIO_Pin_5|GPIO_Pin_9;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
  GPIO_Init(GPIOG, &GPIO_InitStructure);
  GPIO_PinAFConfig(GPIOG, GPIO_PinSource0, GPIO_AF_FSMC);
  GPIO_PinAFConfig(GPIOG, GPIO_PinSource1, GPIO_AF_FSMC);
  GPIO_PinAFConfig(GPIOG, GPIO_PinSource2, GPIO_AF_FSMC);
  GPIO_PinAFConfig(GPIOG, GPIO_PinSource3, GPIO_AF_FSMC);
  GPIO_PinAFConfig(GPIOG, GPIO_PinSource4, GPIO_AF_FSMC);
  GPIO_PinAFConfig(GPIOG, GPIO_PinSource5, GPIO_AF_FSMC);
  GPIO_PinAFConfig(GPIOG, GPIO_PinSource9, GPIO_AF_FSMC);

  RCC_AHB3PeriphClockCmd(RCC_AHB3Periph_FSMC, ENABLE);
  FSMC_NORSRAMDeInit(FSMC_Bank1_NORSRAM1);
  FSMC_NORSRAMCmd(FSMC_Bank1_NORSRAM1, DISABLE);
  FSMC_NORSRAMDeInit(FSMC_Bank1_NORSRAM2);

  fsmc_init.FSMC_Bank = FSMC_Bank1_NORSRAM1;
  fsmc_init.FSMC_DataAddressMux = FSMC_DataAddressMux_Disable;
  fsmc_init.FSMC_MemoryType = FSMC_MemoryType_SRAM;
  fsmc_init.FSMC_MemoryDataWidth = FSMC_MemoryDataWidth_16b;
  fsmc_init.FSMC_BurstAccessMode = FSMC_BurstAccessMode_Disable;
  fsmc_init.FSMC_AsynchronousWait = FSMC_AsynchronousWait_Disable;
  fsmc_init.FSMC_WaitSignalPolarity = FSMC_WaitSignalPolarity_Low;
  fsmc_init.FSMC_WrapMode = FSMC_WrapMode_Disable;
  fsmc_init.FSMC_WaitSignalActive = FSMC_WaitSignalActive_BeforeWaitState;
  fsmc_init.FSMC_WriteOperation = FSMC_WriteOperation_Enable;
  fsmc_init.FSMC_WaitSignal = FSMC_WaitSignal_Disable;
  fsmc_init.FSMC_ExtendedMode = FSMC_ExtendedMode_Enable;
  fsmc_init.FSMC_WriteBurst = FSMC_WriteBurst_Disable;
  fsmc_init.FSMC_ReadWriteTimingStruct = &timing;
  fsmc_init.FSMC_WriteTimingStruct = &alttiming;

  timing.FSMC_AddressSetupTime = 0;
  timing.FSMC_AddressHoldTime = 0xf;
  timing.FSMC_DataSetupTime = 9;
  timing.FSMC_BusTurnAroundDuration = 0;
  timing.FSMC_CLKDivision = 0xf;
  timing.FSMC_DataLatency = 0xf;
  timing.FSMC_AccessMode = FSMC_AccessMode_A;

  alttiming.FSMC_AddressSetupTime = 3;
  alttiming.FSMC_AddressHoldTime = 0xf;
  alttiming.FSMC_DataSetupTime = 6;
  alttiming.FSMC_BusTurnAroundDuration = 1;
  alttiming.FSMC_CLKDivision = 0xf;
  alttiming.FSMC_DataLatency = 0xf;
  alttiming.FSMC_AccessMode = FSMC_AccessMode_A;

  FSMC_NORSRAMInit(&fsmc_init);
  fsmc_init.FSMC_Bank = FSMC_Bank1_NORSRAM2;
  FSMC_NORSRAMInit(&fsmc_init);

  FSMC_NORSRAMCmd(FSMC_Bank1_NORSRAM1, ENABLE);
  FSMC_NORSRAMCmd(FSMC_Bank1_NORSRAM2, ENABLE);
}


int main(void)
{
  delay(2000000);
  setup_serial();
  setup_led();
  serial_puts(USART2, "Initialising...\r\n");
  delay(2000000);
  fsmc_manual_init();

  serial_puts(USART2, "Hello world, ready to blink!\r\n");

  //mem_test();
  //pulse_pin_test();
  fpga_test();

  return 0;
}
