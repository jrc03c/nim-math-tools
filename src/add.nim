import std/sequtils
import std/sugar

# concatenate strings and numbers

proc `+`*(a: float, b: string): string =
  return $a & b

proc `+`*(a: string, b: float): string =
  return a & $b

proc `+`*(a: int, b: string): string =
  return $a & b

proc `+`*(a: string, b: int): string =
  return a & $b

# concatenate strings

proc `+`*(a: string, b: string): string =
  return a & b

# add sequences and numbers

proc `+`*[T](a: seq[T], b: float): seq[T] =
  return a.map(v => v + b)

proc `+`*[T](a: float, b: seq[T]): seq[T] =
  return b.map(v => v + a)

proc `+`*[T](a: seq[T], b: int): seq[T] =
  return a.map(v => v + b)

proc `+`*[T](a: int, b: seq[T]): seq[T] =
  return b.map(v => v + a)

