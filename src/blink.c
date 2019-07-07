#include "blink.h"
#define STM32F4

#include <libopencm3/stm32/gpio.h>

void anotherfunc() {
  gpio_set(GPIOD, GPIO13);
}


static int blink_state = -1;
int toggle_blink() {
  switch(blink_state) {
    case 0:
      gpio_set(GPIOD, GPIO12);
      blink_state = 1;
      break;
    case 1:
      gpio_clear(GPIOD, GPIO12);
    default:
      blink_state = 0;
      break;
  }
  return blink_state;
}
