import std/math

proc drop_na_nPairwise*(a: seq[float], b: seq[float]): (seq[float], seq[float]) =
  var atemp: seq[float] = @[]
  var btemp: seq[float] = @[]

  for i in 0 .. min(len(a), len(b)) - 1:
    if not is_na_n(a[i]) and not is_na_n(b[i]):
      atemp.add(a[i])
      btemp.add(b[i])

  return (atemp, btemp)
