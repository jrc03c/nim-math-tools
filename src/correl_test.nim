import correl
import normal
import operator_add
import operator_mul

let a = normal(1000)
let b = a + 0.0001 * normal(1000)
assert correl(a, b) > 0.99
assert correl(a, b) <= 1.0

let c = a + 0.1 * normal(1000)
assert correl(a, c) > 0.75
assert correl(a, c) <= 1.0

let d = normal(1000)
assert abs(correl(a, d)) < 0.25

let e = -a + 0.0001 * normal(1000)
assert correl(a, e) < -0.99
assert correl(a, e) >= -1.0
