import nim_math_tools/drop_nan
import nim_math_tools/operator_approx
import nim_math_tools/random
import std/math
import std/unittest

test "drop_nan":
  check drop_nan(@[1.2, 3.4, NaN, 5.6]) == @[1.2, 3.4, 5.6]

  var x = random(100)
  x[int(random() * float(len(x)))] = NaN
  var y_true: seq[float] = @[]

  for v in x:
    if not is_nan(v):
      y_true.add(v)

  let y_pred = drop_nan(x)
  check y_pred ~ y_true
