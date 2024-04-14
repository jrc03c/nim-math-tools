proc `~`*(a: float, b: float): bool =
  return abs(a - b) < 0.0001

proc `!~`*(a: float, b: float): bool =
  return not (a ~ b)

proc `~`*(a: seq[float], b: seq[float]): bool =
  for i, v in a:
    if v !~ b[i]:
      return false

  return true

proc `!~`*(a: seq[float], b: seq[float]): bool =
  return not (a ~ b)
