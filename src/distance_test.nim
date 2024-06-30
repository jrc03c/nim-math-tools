import distance
import flatten
import operator_approx
import operator_pow
import random
import sqrt

assert distance(@[3.0, 4.0], @[0.0, 0.0]) == 5.0
assert distance(@[@[1.2, 3.4, 5.6]], @[@[7.8, 9.10, 11.12]]) ~ 10.320872056

let a = random(@[2, 3, 4, 5])
let b = random(@[2, 3, 4, 5])
let aflat = flatten(a)
let bflat = flatten(b)
var c_true = 0.0

for i in 0 .. len(aflat) - 1:
  c_true += (aflat[i] - bflat[i]) ** 2.0

c_true = sqrt(c_true)
let c_pred = distance(a, b)
assert c_pred ~ c_true
