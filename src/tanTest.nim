import tan
import math

assert tan(0.0) == math.tan(0.0)
assert tan(math.PI) == math.tan(math.PI)
assert tan(-math.PI) == math.tan(-math.PI)

assert tan(@[-math.PI / 2.0, 0.0, math.PI / 2.0]) == @[math.tan(-math.PI / 2.0),
    math.tan(0.0), math.tan(math.PI / 2.0)]

assert tan(@[@[@[1.2, 3.4, 5.6]]]) == @[@[@[math.tan(1.2), math.tan(3.4),
    math.tan(5.6)]]]
