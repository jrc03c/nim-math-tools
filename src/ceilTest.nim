import ceil
import operatorApprox

assert ceil(234) == 234
assert ceil(-234) == -234
assert ceil(2.3) ~ 3.0
assert ceil(-2.3) ~ -2.0
assert ceil(true) ~ 1.0
assert ceil(false) ~ 0.0
assert ceil(@[2, 3, 4]) == @[2, 3, 4]
assert ceil(@[-2, -3, -4]) == @[-2, -3, -4]
assert ceil(@[2.3, 4.5, 6.7]) ~ @[3.0, 5.0, 7.0]
assert ceil(@[-2.3, -4.5, -6.7]) ~ @[-2.0, -4.0, -6.0]
assert ceil(@[@[1.2, -3.4], @[5.6, -7.8], @[9.10, -11.12]]) ~ @[@[2.0, -3.0], @[6.0, -7.0], @[10.0, -11.0]]
