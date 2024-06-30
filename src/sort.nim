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
  return sorted(x, fn)

proc sort*[T](x: seq[T]): seq[untyped] =
  return sort(x, default_sort_cmp)
