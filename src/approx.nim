proc approx*(a: float, b: float, tol: float = 0.00001): bool =
  return abs(a - b) < tol

proc approx*(a: int, b: int): bool =
  return a == b

proc approx*(a: int, b: float): bool =
  return approx(float(a), b)

proc approx*(a: float, b: int): bool =
  return approx(a, float(b))

proc approx*[T, U](a: seq[T], b: seq[U]): bool =
  if len(a) != len(b):
    return false

  for i in 0..len(a)-1:
    if not approx(a[i], b[i]):
      return false

  return true

proc `~`*[T, U](a: T, b: U): bool =
  return approx(a, b)

proc `~`*[T, U](a: seq[T], b: seq[U]): bool =
  return approx(a, b)

proc `!~`*[T, U](a: T, b: U): bool =
  return not approx(a, b)

proc `!~`*[T, U](a: seq[T], b: seq[U]): bool =
  return not approx(a, b)

