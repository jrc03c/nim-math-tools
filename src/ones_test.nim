import inner_type
import ones
import shape

assert ones(3) == @[1.0, 1.0, 1.0]
assert ones(@[3]) == @[1.0, 1.0, 1.0]
assert ones(@[2, 3]) == @[@[1.0, 1.0, 1.0], @[1.0, 1.0, 1.0]]
assert inner_type(ones(@[2, 3, 4])) is float
assert shape(ones(@[2, 3, 4])) == @[2, 3, 4]
