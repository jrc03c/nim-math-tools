import nim_math_tools/remap
import std/unittest

test "remap":
    check remap(1.0, 1.0, 3.0, 10.0, 30.0) == 10.0
    check remap(2.0, 1.0, 3.0, 10.0, 30.0) == 20.0
    check remap(0.0, -5.0, 5.0, 0.0, 10.0) == 5.0
    check remap(-5.0, 0.0, 10.0, 10.0, 20.0) == 5.0

    check remap(@[1.0, 2.0, 3.0], 0.0, 10.0, 100.0, 200.0) == @[110.0, 120.0, 130.0]

    check remap(@[@[2.0, 3.0], @[4.0, 5.0]], -5.0, 0.0, 0.0, 5.0) == @[@[7.0,
            8.0], @[9.0, 10.0]]
