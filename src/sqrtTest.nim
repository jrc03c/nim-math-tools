import operatorApprox
import sqrt
import std/math

assert sqrt(10) == math.sqrt(10.0)
assert sqrt(234.567) ~ math.sqrt(234.567)
assert sqrt(@[2, 3, 4]) == @[sqrt(2), sqrt(3), sqrt(4)]
assert sqrt(@[2.3, 4.5, 6.7]) ~ @[sqrt(2.3), sqrt(4.5), sqrt(6.7)]

assert sqrt(@[@[1.2, 3.4], @[5.6, 7.8], @[9.10, 11.12]]) ~ @[@[sqrt(1.2), sqrt(
    3.4)], @[sqrt(5.6), sqrt(7.8)], @[sqrt(9.10), sqrt(11.12)]]
