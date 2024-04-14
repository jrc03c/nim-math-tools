import std/lenientops
import std/math
import std/sequtils
import std/strutils
import std/sugar

# multiply strings and numbers

proc reverseString(s: string): string =
  var temp = ""
  let sLen = len(s)

  for i in 0..sLen-1:
    temp = temp & s[sLen - 1 - i]

  return temp

proc `*`*(a: int, b: string): string =
  if a < 0:
    return reverseString(-a * b)

  var temp = ""

  for i in 0..a-1:
    temp = temp & b

  return temp

proc `*`*(a: string, b: int): string =
  if b < 0:
    return reverseString(a * -b)

  var temp = ""

  for i in 0..b-1:
    temp = temp & a

  return temp

proc `*`*(a: float, b: string): string =
  if a < 0:
    return reverseString(-a * b)

  elif a == 0:
    return ""

  else:
    let aInt = toInt(floor(a))
    return aInt * b & b[0..toInt(floor((a - aInt) * len(b)))-1]

proc `*`*(a: string, b: float): string =
  if b < 0:
    return reverseString(a * -b)

  elif b == 0:
    return ""

  else:
    let bInt = toInt(floor(b))
    return bInt * a & a[0..toInt(floor((b - bInt) * len(a)))-1]

# multiply sequences and numbers

proc `*`*[T](a: seq[T], b: float): seq[T] =
  return a.map(v => v * b)

proc `*`*[T](a: float, b: seq[T]): seq[T] =
  return b.map(v => v * a)

proc `*`*[T](a: seq[T], b: int): seq[T] =
  return a.map(v => v * b)

proc `*`*[T](a: int, b: seq[T]): seq[T] =
  return b.map(v => v * a)

# multiply sequences and sequences

proc `*`*[T](a: seq[T], b: seq[T]): seq[T] =
  if len(a) != len(b):
    raise newException(
      Exception,
      "Sequences of different lengths cannot be multiplied together! ($# vs. $#)" %
        [$len(a), $len(b)]
    )

  var temp: seq[T] = @[]

  for i, v in a:
    temp.add(v * b[i])

  return temp
