import apply
import index_of
import inner_type
import max
import pad_end
import pad_start
import range_seq
import sort
import std/math
import std/sequtils
import std/sugar
import std/typetraits

export apply

type Series*[T] = ref object of RootObj
  index*: seq[string]
  name*: string
  values*: seq[T]

proc append*(self: Series, other: Series): Series =
  return Series(
    index: concat(self.index, other.index),
    name: self.name,
    values: concat(self.values, other.values)
  )

proc apply*[T, U](self: Series, fn: proc(v: T): U): Series =
  return Series(
    index: self.index[0 .. len(self.index) - 1],
    name: self.name,
    values: apply(self.values, fn)
  )

proc concat*(self: Series, other: Series): Series =
  return self.append(other)

template dtype*(self: Series): untyped =
  inner_type(self.values)

proc echo*(self: Series) =
  let max_index_length = max(self.index.map(i => len(i)))
  let max_value_length = max(self.values.map(v => len($v)))

  echo "-----"
  echo "Series: " & self.name
  echo "-----"

  for i, v in self.values:
    if v is SomeNumber:
      echo pad_end(self.index[i], max_index_length) & " : " & pad_start($v, max_value_length)

    else:
      echo pad_end(self.index[i], max_index_length) & " : " & $v

  echo "-----"

proc filter*(self: Series, fn: proc): Series =
  var new_index: seq[string] = @[]
  var new_values: seq[self.dtype] = @[]

  for i, v in self.values:
    if fn(v):
      new_index.add(self.index[i])
      new_values.add(v)

  return Series(index: new_index, name: self.name,
      values: new_values)

proc drop_nan*(self: Series): Series =
  return self.filter(proc(v: self.dtype): bool = not is_nan(v))

proc get*(self: Series, indices: seq[int]): Series =
  var new_index: seq[string] = @[]
  var new_values: seq[self.dtype] = @[]

  for i in indices:
    new_index.add(self.index[i])
    new_values.add(self.values[i])

  return Series(index: new_index, name: self.name, values: new_values)

proc get*(self: Series, indices: seq[string]): Series =
  var new_index: seq[string] = @[]
  var new_values: seq[self.dtype] = @[]

  for i, name in indices:
    new_index.add(name)
    new_values.add(self.values[self.index.index_of(name)[0]])

  return Series(index: new_index, name: self.name, values: new_values)

proc `[]`*(self: Series, indices: seq[int]): Series =
  return self.get(indices)

proc `[]`*(self: Series, indices: seq[string]): Series =
  return self.get(indices)

proc len*(self: Series): int =
  return len(self.values)

proc length*(self: Series): int =
  return self.len

proc print*(self: Series) =
  echo(self)

proc sort_by_index*(self: Series): Series =
  return self.get(sort(self.index))

proc sort_by_value*(self: Series): Series =
  proc cmp(a: int, b: int): int =
    if self.values[a] < self.values[b]:
      return -1

    if self.values[a] > self.values[b]:
      return 1

    return 0

  if self.dtype is float:
    var nums_index: seq[int] = @[]
    var nans_index: seq[int] = @[]

    for i in 0 .. len(self.values) - 1:
      let v = self.values[i]

      if isNaN(v):
        nans_index.add(i)

      else:
        nums_index.add(i)

    let sorted_nums_index = sort(nums_index, cmp)
    let a = self.get(sorted_nums_index)
    let b = self.get(nans_index)
    return a.concat(b)

  else:
    var indices = range_seq(0, len(self.values) - 1)
    return self.get(sort(indices, cmp))

proc sort*[T](self: Series, fn: proc(a: T, b: T): int): Series =
  proc cmp(a: int, b: int): int =
    return fn(self.values[a], self.values[b])

  var indices = range_seq(0, len(self.values) - 1)
  return self.get(sort(indices, cmp))

proc sort*(self: Series): Series =
  return self.sort_by_value()
