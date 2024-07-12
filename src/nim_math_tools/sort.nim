import drop_nan
import std/algorithm

proc default_sort_cmp*[T](a: T, b: T): int =
  if a < b:
    return -1

  if b < a:
    return 1

  return 0

proc sort*[T](
  x: seq[T],
  fn: proc(a: T, b: T): int
): seq[untyped] =
  when T is float:
    let n = len(x)
    var s = sorted(drop_nan(x), fn)

    while len(s) < n:
      s.add(NaN)

    return s

  else:
    return sorted(x, fn)

proc sort*[T](x: seq[T]): seq[untyped] =
  return sort(x, default_sort_cmp)
