import inner_type
import random

assert inner_type(@[2, 3, 4]) is int
assert inner_type(@[@[@["foo", "bar"]]]) is string
assert inner_type(random(@[2, 3, 4, 5])) is float
