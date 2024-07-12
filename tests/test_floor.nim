import nim_math_tools/floor
import nim_math_tools/operator_approx
import std/unittest

test "floor":
    check floor(2.3) ~ 2.0
    check floor(-2.3) ~ -3.0
    check floor(true) ~ 1.0
    check floor(false) ~ 0.0
    check floor(@[2.3, 4.5, 6.7]) ~ @[2.0, 4.0, 6.0]
    check floor(@[-2.3, -4.5, -6.7]) ~ @[-3.0, -5.0, -7.0]

    check floor(@[@[1.2, -3.4], @[5.6, -7.8], @[9.10, -11.12]]) ~ @[@[1.0,
            -4.0], @[5.0, -8.0], @[9.0, -12.0]]

    check floor(@[true, false]) == @[1.0, 0.0]
