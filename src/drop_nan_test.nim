import drop_nan
import operator_approx
import random
import std/math

assert drop_nan(@[1.2, 3.4, NaN, 5.6]) == @[1.2, 3.4, 5.6]

var x = random(100)
x[int(random() * float(len(x)))] = NaN
var y_true: seq[float] = @[]

for v in x:
  if not is_nan(v):
    y_true.add(v)

let y_pred = drop_nan(x)
assert y_pred ~ y_true
