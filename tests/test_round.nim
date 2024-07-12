import nim_math_tools/round
import std/unittest

test "round":
    check round(1.1) == 1.0
    check round(1.9) == 2.0
    check round(@[1.2, 3.4, 5.6]) == @[1.0, 3.0, 6.0]

    check round(@[@[2.3, 4.5, 6.7], @[8.9, 10.11, 12.13]]) == @[@[2.0, 5.0,
            7.0], @[9.0, 10.0, 12.0]]
