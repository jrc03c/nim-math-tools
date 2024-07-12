proc reverse*(x: string): string =
  var temp = ""
  let xlen = len(x)

  for i in 0 .. xlen - 1:
    temp = temp & x[xlen - 1 - i]

  return temp

proc reverse*[T](x: seq[T]): seq[T] =
  var temp: seq[T] = @[]
  let xlen = len(x)

  for i in 0 .. xlen - 1:
    temp.add(x[xlen - 1 - i])

  return temp
