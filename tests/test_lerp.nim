import nim_math_tools/lerp
import nim_math_tools/operator_approx
import std/unittest

test "lerp":
    check lerp(1.0, 2.0, 0.5) ~ 1.5
    check lerp(1.2, 3.4, 0.56) ~ 2.432

    check lerp(@[1.2, 3.4, 5.6], @[7.8, 9.10, 11.12], 0.25) ~ @[2.85, 4.825, 6.98]

    check lerp(@[@[1.0, 1.0], @[1.0, 1.0]], @[@[5.0, 5.0], @[5.0, 5.0]], 0.5) ~
            @[@[3.0, 3.0], @[3.0, 3.0]]

    check lerp(1.0, 5.0, @[@[0.1, 0.2, 0.3]]) == @[@[1.4, 1.8, 2.2]]

    check lerp(@[1.0, 2.0, 3.0], @[4.0, 5.0, 6.0], @[-1.0, 0.0, 1.0]) == @[-2.0,
            2.0, 6.0]
