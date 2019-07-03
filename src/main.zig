
const cm3 = @cImport({
  @cDefine("STM32F4", "1");
  @cInclude("libopencm3/stm32/memorymap.h");
  @cInclude("libopencm3/stm32/rcc.h");
  @cInclude("libopencm3/stm32/gpio.h");
});

export fn main() u8 {
    cm3.gpio_set(cm3.GPIOB, cm3.GPIO12);
    return 22;
}
