import inner_type
import ndarray
import shape

assert ndarray(3) == @[0.0, 0.0, 0.0]
assert ndarray(3, int) == @[0, 0, 0]
assert ndarray(3, string) == @["", "", ""]
assert ndarray(3) == ndarray(@[3])
assert inner_type(ndarray(@[2, 3, 4], bool)) is bool
assert shape(ndarray(@[2, 3, 4])) == @[2, 3, 4]
