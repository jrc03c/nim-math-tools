import covariance
import operatorMul
import random
import std/sequtils
import zeros

const n = 100000

let a = random(n)
let b = a
assert covariance(a, b) > 0.0

let c = zeros(n)
assert abs(covariance(a, c)) < 1.0

let d = -a
assert covariance(a, d) < 0.0
