import abs
import operator_approx

assert abs(-10) == 10
assert abs(10) == 10
assert abs(-234.567) ~ 234.567
assert abs(234.567) ~ 234.567
assert abs(@[2, 3, 4]) == @[2, 3, 4]
assert abs(@[-2, -3, -4]) == @[2, 3, 4]
assert abs(@[2.3, 4.5, 6.7]) ~ @[2.3, 4.5, 6.7]
assert abs(@[-2.3, -4.5, -6.7]) ~ @[2.3, 4.5, 6.7]
assert abs(@[@[-1.2, 3.4], @[-5.6, 7.8], @[-9.10, 11.12]]) ~ @[@[1.2, 3.4], @[
    5.6, 7.8], @[9.10, 11.12]]
assert abs(true) == 1.0
assert abs(false) == 0.0
assert abs(@[@[true, false, true]]) == @[@[1.0, 0.0, 1.0]]
