import identity
import shape

assert identity(3) == @[@[1.0, 0.0, 0.0], @[0.0, 1.0, 0.0], @[0.0, 0.0, 1.0]]
assert identity(3, int) == @[@[1, 0, 0], @[0, 1, 0], @[0, 0, 1]]
assert shape(identity(5)) == @[5, 5]
assert eye(7) == identity(7)
