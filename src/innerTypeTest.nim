import innerType
import random

assert innerType(@[2, 3, 4]) is int
assert innerType(@[@[@["foo", "bar"]]]) is string
assert innerType(random(@[2, 3, 4, 5])) is float
