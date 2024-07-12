import nim_math_tools/operator_approx
import nim_math_tools/sqrt
import std/math
import std/unittest

test "sqrt":
    check sqrt(10) == math.sqrt(10.0)
    check sqrt(234.567) ~ math.sqrt(234.567)
    check sqrt(@[2, 3, 4]) == @[sqrt(2), sqrt(3), sqrt(4)]
    check sqrt(@[2.3, 4.5, 6.7]) ~ @[sqrt(2.3), sqrt(4.5), sqrt(6.7)]

    check sqrt(@[@[1.2, 3.4], @[5.6, 7.8], @[9.10, 11.12]]) ~ @[@[sqrt(1.2),
            sqrt(3.4)], @[sqrt(5.6), sqrt(7.8)], @[sqrt(9.10), sqrt(11.12)]]
