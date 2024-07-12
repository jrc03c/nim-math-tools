import random

proc shuffle*[T](x: seq[T]): seq[T] =
  var temp: seq[T] = @[]
  temp.add(x)

  for i in 0 .. len(temp) - 1:
    let idx_1 = int(random() * float(len(temp)))
    let idx_2 = int(random() * float(len(temp)))
    let buffer = temp[idx_1]
    temp[idx_1] = temp[idx_2]
    temp[idx_2] = buffer

  return temp
