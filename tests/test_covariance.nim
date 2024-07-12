import nim_math_tools/covariance
import nim_math_tools/operator_mul
import nim_math_tools/random
import nim_math_tools/zeros
import std/sequtils
import std/unittest

test "covariance":
  const n = 100000

  let a = random(n)
  let b = a
  check covariance(a, b) > 0.0

  let c = zeros(n)
  check abs(covariance(a, c)) < 1.0

  let d = -a
  check covariance(a, d) < 0.0
