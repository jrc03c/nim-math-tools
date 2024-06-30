import operator_sub

proc sub*(a: bool, b: (bool or int)): int =
  return a - b

proc sub*(a: bool, b: float): float =
  return a - b

proc sub*(a: bool, b: string): string =
  return a - b

proc sub*(a: int, b: (bool or int)): int =
  return a - b

proc sub*(a: int, b: float): float =
  return a - b

proc sub*(a: int, b: string): string =
  return a - b

proc sub*(a: float, b: (bool or int or float)): float =
  return a - b

proc sub*(a: float, b: string): string =
  return a - b

proc sub*(a: string, b: (bool or int or float or string)): string =
  return a - b

proc sub*[T, U](a: seq[T], b: U): seq[untyped] =
  return a - b

proc sub*[T, U](a: T, b: seq[U]): seq[untyped] =
  return a - b

proc sub*[T, U](a: seq[T], b: seq[U]): seq[untyped] =
  return a - b
