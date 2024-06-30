import operator_add

proc add*(a: bool, b: (bool or int)): int =
  return a + b

proc add*(a: bool, b: float): float =
  return a + b

proc add*(a: bool, b: string): string =
  return a + b

proc add*(a: int, b: (bool or int)): int =
  return a + b

proc add*(a: int, b: float): float =
  return a + b

proc add*(a: int, b: string): string =
  return a + b

proc add*(a: float, b: (bool or int or float)): float =
  return a + b

proc add*(a: float, b: string): string =
  return a + b

proc add*(a: string, b: (bool or int or float or string)): string =
  return a + b

proc add*[T, U](a: seq[T], b: U): seq[untyped] =
  return a + b

proc add*[T, U](a: T, b: seq[U]): seq[untyped] =
  return a + b

proc add*[T, U](a: seq[T], b: seq[U]): seq[untyped] =
  return a + b
