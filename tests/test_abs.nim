import nim_math_tools/abs
import nim_math_tools/operator_approx
import std/unittest

test "abs":
    check abs(-10) == 10
    check abs(10) == 10
    check abs(-234.567) ~ 234.567
    check abs(234.567) ~ 234.567
    check abs(@[2, 3, 4]) == @[2, 3, 4]
    check abs(@[-2, -3, -4]) == @[2, 3, 4]
    check abs(@[2.3, 4.5, 6.7]) ~ @[2.3, 4.5, 6.7]
    check abs(@[-2.3, -4.5, -6.7]) ~ @[2.3, 4.5, 6.7]

    check abs(@[@[-1.2, 3.4], @[-5.6, 7.8], @[-9.10, 11.12]]) ~ @[@[1.2, 3.4],
            @[5.6, 7.8], @[9.10, 11.12]]

    check abs(true) == 1.0
    check abs(false) == 0.0
    check abs(@[@[true, false, true]]) == @[@[1.0, 0.0, 1.0]]
