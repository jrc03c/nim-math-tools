import dropNaN
import operatorApprox
import random
import std/math

assert dropNaN(@[1.2, 3.4, NaN, 5.6]) == @[1.2, 3.4, 5.6]

var x = random(100)
x[int(random() * float(len(x)))] = NaN
var yTrue: seq[float] = @[]

for v in x:
  if not isNaN(v):
    yTrue.add(v)

let yPred = dropNaN(x)
assert yPred ~ yTrue
