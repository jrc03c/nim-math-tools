import min
import max
import normal
import shape

assert typeof(normal()) is float
assert max(normal(1000)) >= 0.0
assert min(normal(1000)) <= 0.0
assert shape(normal(@[2, 3, 4])) == @[2, 3, 4]
