import nim_math_tools/ceil
import nim_math_tools/operator_approx
import std/unittest

test "ceil":
    check ceil(2.3) ~ 3.0
    check ceil(-2.3) ~ -2.0
    check ceil(true) ~ 1.0
    check ceil(false) ~ 0.0
    check ceil(@[2.3, 4.5, 6.7]) ~ @[3.0, 5.0, 7.0]
    check ceil(@[-2.3, -4.5, -6.7]) ~ @[-2.0, -4.0, -6.0]

    check ceil(@[@[1.2, -3.4], @[5.6, -7.8], @[9.10, -11.12]]) ~ @[@[2.0, -3.0],
            @[6.0, -7.0], @[10.0, -11.0]]
