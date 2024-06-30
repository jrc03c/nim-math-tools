import drop_na_n
import operator_approx
import random
import std/math

assert drop_na_n(@[1.2, 3.4, NaN, 5.6]) == @[1.2, 3.4, 5.6]

var x = random(100)
x[int(random() * float(len(x)))] = NaN
var y_true: seq[float] = @[]

for v in x:
  if not is_na_n(v):
    y_true.add(v)

let y_pred = drop_na_n(x)
assert y_pred ~ y_true
