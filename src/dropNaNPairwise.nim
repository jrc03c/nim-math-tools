import std/math

proc dropNaNPairwise*(a: seq[float], b: seq[float]): (seq[float], seq[float]) =
  var atemp: seq[float] = @[]
  var btemp: seq[float] = @[]

  for i in 0 .. min(len(a), len(b)) - 1:
    if not isNaN(a[i]) and not isNaN(b[i]):
      atemp.add(a[i])
      btemp.add(b[i])

  return (atemp, btemp)
