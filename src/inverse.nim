import dot
import flatten
import operator_add
import operator_div
import operator_mul
import operator_sub
import shape
import std/sequtils
import std/sugar

export flatten

proc inverse*(x: seq[seq[float]]): seq[seq[float]] =
  let x_shape = shape(x)
  assert x_shape[0] == x_shape[1]
  assert x_shape[0] > 0

  if x_shape[0] == 1:
    assert x[0][0] != 0
    return @[@[1.0 / x[0][0]]]

  if x_shape[0] == 2:
    let a = x[0][0]
    let b = x[0][1]
    let c = x[1][0]
    let d = x[1][1]

    let det = a * d - b * c
    assert det != 0

    return @[@[d, -b], @[-c, a]] / det

  for divider in 1 .. x_shape[0] - 2:
    let A = x[0 .. divider - 1].map(row => row[0 .. divider - 1])
    let B = x[0 .. divider - 1].map(row => row[divider .. x_shape[0] - 1])
    let C = x[divider .. x_shape[0] - 1].map(row => row[0 .. divider - 1])

    let D = x[divider .. x_shape[0] - 1].map(row => row[divider .. x_shape[0] - 1])

    let AInv = inverse(A)
    let CompInv = inverse(D - dot(dot(C, AInv), B))

    let top_left = AInv + dot(dot(dot(dot(AInv, B), CompInv), C), AInv)
    let top_right = -dot(dot(AInv, B), CompInv)
    let bottom_left = -dot(dot(CompInv, C), AInv)
    let bottom_right = CompInv

    var temp: seq[seq[float]] = @[]

    for i, row in top_left:
      temp.add(row.concat(top_right[i]))

    for i, row in bottom_left:
      temp.add(row.concat(bottom_right[i]))

    return temp
