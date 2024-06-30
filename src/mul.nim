import operator_mul

proc mul*(a: bool, b: bool): int =
  return a * b

proc mul*(a: int, b: bool): int =
  return a * b

proc mul*(a: bool, b: int): int =
  return a * b

proc mul*(a: float, b: bool): float =
  return a * b

proc mul*(a: bool, b: float): float =
  return a * b

proc mul*(a: int, b: int): int =
  return a * b

proc mul*(a: float, b: int): float =
  return a * b

proc mul*(a: int, b: float): float =
  return a * b

proc mul*(a: float, b: float): float =
  return a * b

proc mul*(a: string, b: bool): string =
  return a * b

proc mul*(a: bool, b: string): string =
  return a * b

proc mul*(a: string, b: int): string =
  return a * b

proc mul*(a: int, b: string): string =
  return a * b

proc mul*(a: string, b: float): string =
  return a * b

proc mul*(a: float, b: string): string =
  return a * b

proc mul*[T, U](a: seq[T], b: U): seq[untyped] =
  return a * b

proc mul*[T, U](a: T, b: seq[U]): seq[untyped] =
  return a * b

proc mul*[T, U](a: seq[T], b: seq[U]): seq[untyped] =
  return a * b
