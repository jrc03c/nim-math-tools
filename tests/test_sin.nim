import nim_math_tools/sin
import std/math
import std/unittest

test "sin":
    check sin(0.0) == math.sin(0.0)
    check sin(math.PI) == math.sin(math.PI)
    check sin(-math.PI) == math.sin(-math.PI)

    check sin(@[-math.PI / 2.0, 0.0, math.PI / 2.0]) == @[math.sin(-math.PI /
            2.0), math.sin(0.0), math.sin(math.PI / 2.0)]

    check sin(@[@[@[1.2, 3.4, 5.6]]]) == @[@[@[math.sin(1.2), math.sin(3.4),
            math.sin(5.6)]]]
