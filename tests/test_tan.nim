import nim_math_tools/tan
import std/math
import std/unittest

test "tan":
    check tan(0.0) == math.tan(0.0)
    check tan(math.PI) == math.tan(math.PI)
    check tan(-math.PI) == math.tan(-math.PI)

    check tan(@[-math.PI / 2.0, 0.0, math.PI / 2.0]) == @[math.tan(-math.PI /
            2.0), math.tan(0.0), math.tan(math.PI / 2.0)]

    check tan(@[@[@[1.2, 3.4, 5.6]]]) == @[@[@[math.tan(1.2), math.tan(3.4),
            math.tan(5.6)]]]
