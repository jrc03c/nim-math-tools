proc lerp*(a: float, b: float, f: float): float =
  return f * (b - a) + a
