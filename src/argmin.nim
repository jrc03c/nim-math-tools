proc argmin*(x: seq[int]): int =
  if len(x) == 0:
    return -1

  var min = high(int)
  var min_index = 0

  for i, v in x:
    if v < min:
      min = v
      min_index = i

  return min_index

proc argmin*(x: seq[float]): int =
  if len(x) == 0:
    return -1

  var min = high(float)
  var min_index = 0

  for i, v in x:
    if v < min:
      min = v
      min_index = i

  return min_index

proc argmin*(x: seq[string]): int =
  if len(x) == 0:
    return -1

  var min = x[0]
  var min_index = 0

  for i, v in x[1 .. len(x) - 1]:
    if v < min:
      min = v
      min_index = i + 1

  return min_index
