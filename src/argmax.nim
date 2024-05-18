proc argmax*(x: seq[int]): int =
  if len(x) == 0:
    return -1

  var max = low(int)
  var maxIndex = 0

  for i, v in x:
    if v > max:
      max = v
      maxIndex = i

  return maxIndex

proc argmax*(x: seq[float]): int =
  if len(x) == 0:
    return -1

  var max = low(float)
  var maxIndex = 0

  for i, v in x:
    if v > max:
      max = v
      maxIndex = i

  return maxIndex

proc argmax*(x: seq[string]): int =
  if len(x) == 0:
    return -1

  var max = x[0]
  var maxIndex = 0

  for i, v in x[1 .. len(x) - 1]:
    if v > max:
      max = v
      maxIndex = i + 1

  return maxIndex
