import flatten
import inner_type
import set

export flatten
export inner_type

template union*[T, U](a: seq[T], b: seq[U]): untyped =
  when T is seq:
    union(flatten(a), b)

  elif U is seq:
    union(a, flatten(b))

  else:
    var temp: seq[T] = @[]

    for v in a:
      if v notin temp:
        temp.add(v)

    for v in b:
      if v notin temp:
        temp.add(v)

    temp
