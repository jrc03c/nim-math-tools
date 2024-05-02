proc approx*(a: float, b: float, tol: float = 0.00001): bool =
  return abs(a - b) < tol

proc approx*(a: int, b: int, tol: int = 1): bool =
  return abs(a - b) < tol

proc approx*(a: int, b: float, tol: float = 0.00001): bool =
  return approx(float(a), b, tol)

proc approx*(a: float, b: int, tol: float = 0.00001): bool =
  return approx(a, float(b), tol)

proc approx*[T, U](a: seq[T], b: seq[U], tol: float = 0.00001): bool =
  if len(a) != len(b):
    return false

  for i in 0..len(a)-1:
    if not approx(a[i], b[i], tol):
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

