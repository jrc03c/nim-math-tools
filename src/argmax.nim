proc argmax*(x: seq[int]): int =
  if len(x) == 0:
    return -1

  var max = low(int)
  var max_index = 0

  for i, v in x:
    if v > max:
      max = v
      max_index = i

  return max_index

proc argmax*(x: seq[float]): int =
  if len(x) == 0:
    return -1

  var max = low(float)
  var max_index = 0

  for i, v in x:
    if v > max:
      max = v
      max_index = i

  return max_index

proc argmax*(x: seq[string]): int =
  if len(x) == 0:
    return -1

  var max = x[0]
  var max_index = 0

  for i, v in x[1 .. len(x) - 1]:
    if v > max:
      max = v
      max_index = i + 1

  return max_index
