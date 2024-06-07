import apply

proc clamp*[T](x: seq[T], xmin: float, xmax: float): seq[untyped] =
  proc helper(v: float): float =
    if v < xmin:
      return xmin

    if v > xmax:
      return xmax

    return v

  return apply(x, helper)
