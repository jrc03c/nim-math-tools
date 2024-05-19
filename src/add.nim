import operatorAdd

proc add*(a: bool, b: bool): int =
  return a + b

proc add*(a: int, b: bool): int =
  return a + b

proc add*(a: bool, b: int): int =
  return a + b

proc add*(a: float, b: bool): float =
  return a + b

proc add*(a: bool, b: float): float =
  return a + b

proc add*(a: int, b: int): int =
  return a + b

proc add*(a: float, b: int): float =
  return a + b

proc add*(a: int, b: float): float =
  return a + b

proc add*(a: float, b: float): float =
  return a + b

proc add*(a: string, b: string): string =
  return a & b

proc add*(a: string, b: bool): string =
  return a + b

proc add*(a: bool, b: string): string =
  return a + b

proc add*(a: string, b: int): string =
  return a + b

proc add*(a: int, b: string): string =
  return a + b

proc add*(a: string, b: float): string =
  return a + b

proc add*(a: float, b: string): string =
  return a + b

proc add*[T, U](a: seq[T], b: U): seq[untyped] =
  return a + b

proc add*[T, U](a: T, b: seq[U]): seq[untyped] =
  return a + b

proc add*[T, U](a: seq[T], b: seq[U]): seq[untyped] =
  return a + b
