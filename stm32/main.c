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


void
pulse_pin_test(void)
{
  GPIO_InitTypeDef GPIO_InitStructure;

  /* GPIOG clock enable */
  RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOG, ENABLE);

  /* GPIOG Configuration: Output pulse on PG0. */
  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL ;
  GPIO_Init(GPIOG, &GPIO_InitStructure);

  for (;;) {
    GPIO_SetBits(GPIOG, GPIO_Pin_0);
    led_on();
    delay(MCU_HZ/3/4);
    GPIO_ResetBits(GPIOG, GPIO_Pin_0);
    led_off();
    delay(MCU_HZ/3/4);
  }
}


int main(void)
{
  delay(2000000);
  setup_serial();
  setup_led();
  serial_puts(USART2, "Initialising...\r\n");
  delay(2000000);

  serial_puts(USART2, "Hello world, ready to blink!\r\n");

  //mem_test();
  pulse_pin_test();

  return 0;
}
