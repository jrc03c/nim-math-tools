import std/sequtils

proc transpose*[T](x: seq[seq[T]]): seq[seq[T]] =
  if len(x) == 0 or len(x[0]) == 0:
    return newSeqWith(1, newSeq[T]())

  var temp: seq[seq[T]] = newSeqWith(len(x[0]), newSeqWith(len(x), default(T)))

  for i in 0 .. len(x) - 1:
    for j in 0 .. len(x[i]) - 1:
      temp[j][i] = x[i][j]

  return temp
