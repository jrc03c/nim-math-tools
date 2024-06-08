import mean

proc covariance*(a: seq[float], b: seq[float]): float =
  assert len(a) == len(b)

  let ma = mean(a)
  let mb = mean(b)
  var temp: float = 0.0

  for i in 0 .. len(a) - 1:
    temp += (a[i] - ma) * (b[i] - mb)

  return temp
