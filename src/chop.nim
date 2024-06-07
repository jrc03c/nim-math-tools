import apply

proc chop*[T](x: seq[T], threshold: float = 0.0000000001): seq[untyped] =
  proc helper(v: float): float =
    if abs(v) < threshold:
      return 0.0

    return v

  return apply(x, helper)
