import std/sequtils

proc dot*(a: seq[SomeNumber], b: seq[SomeNumber]): SomeNumber =
  var temp = default(SomeNumber)

  if len(a) == 0 or len(b) == 0:
    return temp

  assert len(a) == len(b)

  for i in 0 .. len(a) - 1:
    temp += a[i] * b[i]

  return temp

proc dot*(a: seq[seq[SomeNumber]], b: seq[SomeNumber]): seq[SomeNumber] =
  var temp: seq[SomeNumber] = @[]

  if len(a) == 0 or len(a[0]) == 0 or len(b) == 0:
    return temp

  assert len(a[0]) == len(b)

  for row in a:
    temp.add(dot(row, b))

  return temp

proc dot*(a: seq[SomeNumber], b: seq[seq[SomeNumber]]): seq[SomeNumber] =
  var temp: seq[SomeNumber] = @[]

  if len(a) == 0 or len(b) == 0 or len(b[0]) == 0:
    return temp

  assert len(a) == len(b)

  for i in 0 .. len(b[0]) - 1:
    var bcol: seq[SomeNumber] = @[]

    for row in b:
      bcol.add(row[i])

    temp.add(dot(a, bcol))

  return temp

proc dot*(
  a: seq[seq[SomeNumber]],
  b: seq[seq[SomeNumber]]
): seq[seq[SomeNumber]] =
  var temp: seq[seq[SomeNumber]] = newSeqWith(1, newSeq[SomeNumber]())

  if len(a) == 0 or len(a[0]) == 0 or len(b) == 0 or len(b[0]) == 0:
    return temp

  assert len(a[0]) == len(b)

  temp.delete(0)

  for i in 0 .. len(a) - 1:
    let arow = a[i]
    var newrow: seq[SomeNumber] = @[]

    for j in 0 .. len(b[0]) - 1:
      var bcol: seq[SomeNumber] = @[]

      for brow in b:
        bcol.add(brow[j])

      newrow.add(dot(arow, bcol))

    temp.add(newrow)

  return temp
