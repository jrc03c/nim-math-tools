import innerType
import set
import std/tables

export innerType
export set
export tables

proc count*[T](x: seq[T]): TableRef[untyped, int] =
  type t = innerType(x)
  let xset = set[T](x)
  var table = newTable[t, int]()

  for v in xset:
    if not table.contains(v):
      table[v] = 0

    table[v] += 1

  return table
