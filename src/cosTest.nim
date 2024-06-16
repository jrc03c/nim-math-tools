import cos
import math

assert cos(0.0) == math.cos(0.0)
assert cos(math.PI) == math.cos(math.PI)
assert cos(-math.PI) == math.cos(-math.PI)

assert cos(@[-math.PI / 2.0, 0.0, math.PI / 2.0]) == @[math.cos(-math.PI / 2.0),
    math.cos(0.0), math.cos(math.PI / 2.0)]

assert cos(@[@[@[1.2, 3.4, 5.6]]]) == @[@[@[math.cos(1.2), math.cos(3.4),
    math.cos(5.6)]]]
