import flatten
import std/sequtils

export flatten

proc permutations*[T](x: seq[T], r: int): seq[seq[T]] =
  when T is seq:
    return permutations(flatten(x), r)

  else:
    if r > len(x):
      return permutations(x, len(x))

    if r <= 0:
      return @[newSeq[T]()]

    if len(x) < 2:
      return @[x]

    var temp: seq[seq[T]] = @[]

    for i, v in x:
      let before = x[0 .. i - 1]
      let after = x[i + 1 .. len(x) - 1]
      let others = concat(before, after)
      let children = permutations(others, r - 1)

      for child in children:
        temp.add(concat(@[v], child))

    return temp
