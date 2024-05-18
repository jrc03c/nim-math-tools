import std/sequtils
import std/sugar

proc min*(a: bool, b: bool): bool =
  if a:
    return b

  return a

proc min*(a: bool, b: int): int =
  if a:
    if b < 1:
      return b

    return 1

  if b < 0:
    return b

  return 0

proc min*(a: int, b: bool): int =
  if b:
    if a < 1:
      return a

    return 1

  if a < 0:
    return a

  return 0

proc min*(a: float, b: bool): float =
  if b:
    if a < 1.0:
      return a

    return 1.0

  if a < 0.0:
    return a

  return 0.0

proc min*(a: bool, b: float): float =
  if a:
    if b < 1.0:
      return b

    return 1.0

  if b < 0.0:
    return b

  return 0.0

proc min*(a: float, b: int): float =
  return min(a, float(b))

proc min*(a: int, b: float): float =
  return min(float(a), b)

proc min*(a: string, b: string): string =
  if a < b:
    return a

  return b

proc min*(x: seq[bool]): bool =
  if len(x) == 0:
    return false

  var m = x[0]

  for v in x:
    if not v:
      m = v

  return m

proc min*(x: seq[int]): int =
  if len(x) == 0:
    return 0

  var m = high(int)

  for v in x:
    if v < m:
      m = v

  return m

proc min*(x: seq[float]): float =
  if len(x) == 0:
    return NaN

  var m = Inf

  for v in x:
    if v < m:
      m = v

  return m

proc min*(x: seq[string]): string =
  if len(x) == 0:
    return ""

  var m = x[0]

  for v in x:
    if v < m:
      m = v

  return m

proc min*[T](x: seq[T]): (bool or int or float or string) =
  when T is (bool or int or float or string):
    return min(x)

  else:
    return min(x.map(v => min(v)))
