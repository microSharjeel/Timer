#include "stdlib.h"
#include <stdio.h>
#include "system.h"
#include "periphs.h"
#include "iob-uart.h"
#include "printf.h"
#include "timer.h"

int main()
{
  unsigned long long cycles;
  uart_init(UART_BASE, FREQ/BAUD);  
  timer_init(TIMER_BASE);
  printf("\nHello world Sharjeel!\n");
  cycles=timer_get_count();
  unsigned int timer_val_sec = timer_time_sec();
  unsigned int timer_val_usec = timer_time_usec();
  printf("\nExecution time: %llu clock cycles\n",cycles );
  printf("\nExecution time: %d in secs and %d in usec @ Freq:%dMHz\n", timer_val_sec,timer_val_usec,(int )FREQ/1000000);
  timer_disable();
  uart_finish();


}
