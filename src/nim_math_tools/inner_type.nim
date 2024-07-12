import std/typetraits

template inner_type*(x: typed): untyped =
  when typeof(x) is seq:
    when element_type(x) is seq:
      inner_type(x[0])

    else:
      element_type(x)

  else:
    typeof(x)
