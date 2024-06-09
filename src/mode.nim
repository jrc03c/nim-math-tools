import count
import flatten
import max
import std/sequtils
import std/algorithm

export flatten

proc mode*[T](x: seq[T]): seq[untyped] =
  when T is seq:
    return mode(flatten(x))

  else:
    let counts = count(x)
    let maxCount = max(toSeq(counts.values))
    var temp: seq[T] = @[]

    for v in counts.keys:
      if counts[v] == maxCount:
        temp.add(v)

    sort(temp)
    return temp
