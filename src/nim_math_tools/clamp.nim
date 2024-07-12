import apply

export apply

proc clamp*(x: SomeNumber, xmin: SomeNumber, xmax: SomeNumber): SomeNumber =
  assert xmax >= xmin

  if x < xmin:
    return xmin

  if x > xmax:
    return xmax

  return x

proc clamp*[T](x: seq[T], xmin: SomeNumber, xmax: SomeNumber): seq[untyped] =
  assert xmax >= xmin

  proc helper(v: SomeNumber): SomeNumber =
    if v < xmin:
      return xmin

    if v > xmax:
      return xmax

    return v

  return apply(x, helper)
