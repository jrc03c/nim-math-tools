import floor
import operatorApprox

assert floor(234) == 234
assert floor(-234) == -234
assert floor(2.3) ~ 2.0
assert floor(-2.3) ~ -3.0
assert floor(true) ~ 1.0
assert floor(false) ~ 0.0
assert floor(@[2, 3, 4]) == @[2, 3, 4]
assert floor(@[-2, -3, -4]) == @[-2, -3, -4]
assert floor(@[2.3, 4.5, 6.7]) ~ @[2.0, 4.0, 6.0]
assert floor(@[-2.3, -4.5, -6.7]) ~ @[-3.0, -5.0, -7.0]
assert floor(@[@[1.2, -3.4], @[5.6, -7.8], @[9.10, -11.12]]) ~ @[@[1.0, -4.0], @[5.0, -8.0], @[9.0, -12.0]]
