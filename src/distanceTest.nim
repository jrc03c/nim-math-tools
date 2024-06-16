import distance
import flatten
import operatorApprox
import operatorPow
import random
import sqrt

assert distance(@[3.0, 4.0], @[0.0, 0.0]) == 5.0
assert distance(@[@[1.2, 3.4, 5.6]], @[@[7.8, 9.10, 11.12]]) ~ 10.320872056

let a = random(@[2, 3, 4, 5])
let b = random(@[2, 3, 4, 5])
let aflat = flatten(a)
let bflat = flatten(b)
var cTrue = 0.0

for i in 0 .. len(aflat) - 1:
  cTrue += (aflat[i] - bflat[i]) ** 2.0

cTrue = sqrt(cTrue)
let cPred = distance(a, b)
assert cPred ~ cTrue
