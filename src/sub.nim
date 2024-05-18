import operatorSub
import std/strutils

proc sub*(a: bool, b: bool): int =
  if a:
    if b:
      return 0

    return 1

  if b:
    return -1

  return 0

proc sub*(a: int, b: bool): int =
  if b:
    return a - 1

  return a

proc sub*(a: bool, b: int): int =
  if a:
    return 1 - b

  return -b

proc sub*(a: float, b: bool): float =
  if b:
    return a - 1.0

  return a

proc sub*(a: bool, b: float): float =
  if a:
    return 1.0 - b

  return -b

proc sub*(a: int, b: int): int =
  return a - b

proc sub*(a: float, b: int): float =
  return a - b

proc sub*(a: int, b: float): float =
  return a - b

proc sub*(a: float, b: float): float =
  return a - b

proc sub*(a: string, b: string): string =
  var index = a.find(b)

  if index > -1:
    return a.substr(0, index - 1) & a.substr(index + len(b))

  return a

proc sub*(a: string, b: bool): string =
  return sub(a, $b)

proc sub*(a: bool, b: string): string =
  return sub($a, b)

proc sub*(a: string, b: int): string =
  return sub(a, $b)

proc sub*(a: int, b: string): string =
  return sub($a, b)

proc sub*(a: string, b: float): string =
  return sub(a, $b)

proc sub*(a: float, b: string): string =
  return sub($a, b)

proc sub*[T, U](a: seq[T], b: U): seq[untyped] =
  return a - b

proc sub*[T, U](a: T, b: seq[U]): seq[untyped] =
  return a - b

proc sub*[T, U](a: seq[T], b: seq[U]): seq[untyped] =
  return a - b
