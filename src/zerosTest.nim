import innerType
import zeros
import shape

assert zeros(3) == @[0.0, 0.0, 0.0]
assert zeros(@[3]) == @[0.0, 0.0, 0.0]
assert zeros(@[2, 3]) == @[@[0.0, 0.0, 0.0], @[0.0, 0.0, 0.0]]
assert innerType(zeros(@[2, 3, 4])) is float
assert shape(zeros(@[2, 3, 4])) == @[2, 3, 4]
