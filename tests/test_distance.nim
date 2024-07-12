import nim_math_tools/distance
import nim_math_tools/flatten
import nim_math_tools/operator_approx
import nim_math_tools/operator_pow
import nim_math_tools/random
import nim_math_tools/sqrt
import std/unittest

test "distance":
  check distance(@[3.0, 4.0], @[0.0, 0.0]) == 5.0
  check distance(@[@[1.2, 3.4, 5.6]], @[@[7.8, 9.10, 11.12]]) ~ 10.320872056

  let a = random(@[2, 3, 4, 5])
  let b = random(@[2, 3, 4, 5])
  let aflat = flatten(a)
  let bflat = flatten(b)
  var c_true = 0.0

  for i in 0 .. len(aflat) - 1:
    c_true += (aflat[i] - bflat[i]) ** 2.0

  c_true = sqrt(c_true)
  let c_pred = distance(a, b)
  check c_pred ~ c_true
