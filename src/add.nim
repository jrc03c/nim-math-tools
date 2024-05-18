import operatorAdd

proc add*(a: bool, b: bool): int =
  if a:
    if b:
      return 2

    return 1

  if b:
    return 1

  return 0

proc add*(a: int, b: bool): int =
  if b:
    return a + 1

  return a

proc add*(a: bool, b: int): int =
  if a:
    return b + 1

  return b

proc add*(a: float, b: bool): float =
  if b:
    return a + 1.0

  return a

proc add*(a: bool, b: float): float =
  if a:
    return 1.0 + b

  return b

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
  if b:
    return a & "true"

  return a & "false"

proc add*(a: bool, b: string): string =
  if a:
    return "true" & b

  return "false" & b

proc add*(a: string, b: int): string =
  return a & $b

proc add*(a: int, b: string): string =
  return $a & b

proc add*(a: string, b: float): string =
  return a & $b

proc add*(a: float, b: string): string =
  return $a & b

proc add*[T, U](a: seq[T], b: U): seq[untyped] =
  return a + b

proc add*[T, U](a: T, b: seq[U]): seq[untyped] =
  return a + b

proc add*[T, U](a: seq[T], b: seq[U]): seq[untyped] =
  return a + b
