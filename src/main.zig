
const c = @cImport({
  @cInclude("blink.h");
});

export fn main() c_int {
    return fff();
}

fn fff() c_int {
  c.anotherfunc();
  return c.toggle_blink();
}
