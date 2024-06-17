import min
import max
import random
import shape

assert typeof(random()) is float
assert random() <= 1.0
assert random() >= 0.0
assert max(random(1000)) <= 1.0
assert min(random(1000)) >= 0.0
assert shape(random(@[2, 3, 4])) == @[2, 3, 4]
