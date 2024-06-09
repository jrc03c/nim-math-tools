import random

proc shuffle*[T](x: seq[T]): seq[T] =
  var temp: seq[T] = @[]
  temp.add(x)

  for i in 0 .. len(temp) - 1:
    let idx1 = int(random() * float(len(temp)))
    let idx2 = int(random() * float(len(temp)))
    let buffer = temp[idx1]
    temp[idx1] = temp[idx2]
    temp[idx2] = buffer

  return temp
