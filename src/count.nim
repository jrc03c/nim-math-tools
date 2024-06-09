import flatten
import std/tables

export flatten
export tables

proc count*[T](x: seq[T]): TableRef[untyped, int] =
  when T is seq:
    return count(flatten(x))

  else:
    var table = newTable[T, int]()

    for v in x:
      if not table.hasKey(v):
        table[v] = 0

      table[v] += 1

    return table
