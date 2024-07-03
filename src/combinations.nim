import flatten

export flatten

proc combinations*[T](x: seq[T], r: int): seq[seq[T]] =
  when T is seq:
    return combinations(flatten(x), r)

  else:
    if r > len(x):
      return @[x]

    if r <= 0:
      return @[newSeq[T]()]

    var temp: seq[seq[T]] = @[]

    for i, v in x:
      let after = x[i + 1 .. len(x) - 1]

      if len(after) < r - 1:
        continue

      let children = combinations(after, r - 1)

      for child in children:
        var subtemp: seq[T] = @[v]
        subtemp.add(child)
        temp.add(subtemp)

    return temp
