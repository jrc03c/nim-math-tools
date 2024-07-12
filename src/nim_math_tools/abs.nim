import apply
import inner_type

export apply
export inner_type

proc abs*(x: bool): float =
  if x:
    return 1.0

  return 0

proc abs*[T](x: seq[T]): seq[untyped] =
  type t = inner_type(x)

  when t is bool:
    return apply(x, proc(v: bool): float = abs(v))

  else:
    return apply(x, proc(v: t): t = abs(v))
