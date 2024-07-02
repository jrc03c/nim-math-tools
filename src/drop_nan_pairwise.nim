import std/math

proc drop_nan_pairwise*(a: seq[float], b: seq[float]): (seq[float], seq[float]) =
  var atemp: seq[float] = @[]
  var btemp: seq[float] = @[]

  for i in 0 .. min(len(a), len(b)) - 1:
    if not is_nan(a[i]) and not is_nan(b[i]):
      atemp.add(a[i])
      btemp.add(b[i])

  return (atemp, btemp)
