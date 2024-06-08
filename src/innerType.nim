import std/typetraits

template innerType*(x: typed): untyped =
  when typeof(x) is seq:
    when elementType(x) is seq:
      innerType(x[0])

    else:
      elementType(x)

  else:
    typeof(x)
