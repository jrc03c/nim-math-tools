import nim_math_tools/cos
import std/math
import std/unittest

test "cos":
    check cos(0.0) == math.cos(0.0)
    check cos(math.PI) == math.cos(math.PI)
    check cos(-math.PI) == math.cos(-math.PI)

    check cos(@[-math.PI / 2.0, 0.0, math.PI / 2.0]) == @[math.cos(-math.PI /
            2.0), math.cos(0.0), math.cos(math.PI / 2.0)]

    check cos(@[@[@[1.2, 3.4, 5.6]]]) == @[@[@[math.cos(1.2), math.cos(3.4),
            math.cos(5.6)]]]
