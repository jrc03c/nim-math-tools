proc pad_start*(x: string, n: int, c: string = " "): string =
  assert n >= 0
  assert len(c) > 0

  var s = x

  while len(s) < n:
    s = c & s

  return s
