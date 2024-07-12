import flatten
import std/algorithm

export sort
export flatten

template median*[T](x: seq[T]): untyped =
  when T is seq:
    median(flatten(x))

  else:
    var temp: seq[T] = @[]
    temp.add(x)
    sort(temp)

    if len(temp) mod 2 == 0:
      T((temp[int(len(temp) / 2) - 1] + temp[int(len(temp) / 2)]) / T(2))

    else:
      T(temp[int(len(temp) / 2)])
