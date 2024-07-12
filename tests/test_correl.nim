import nim_math_tools/correl
import nim_math_tools/normal
import nim_math_tools/operator_add
import nim_math_tools/operator_mul
import std/unittest

test "correl":
  let a = normal(1000)
  let b = a + 0.0001 * normal(1000)
  check correl(a, b) > 0.99
  check correl(a, b) <= 1.0

  let c = a + 0.1 * normal(1000)
  check correl(a, c) > 0.75
  check correl(a, c) <= 1.0

  let d = normal(1000)
  check abs(correl(a, d)) < 0.25

  let e = -a + 0.0001 * normal(1000)
  check correl(a, e) < -0.99
  check correl(a, e) >= -1.0
