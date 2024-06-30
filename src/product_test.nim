import operator_approx
import product

assert product(@[0]) == 0
assert product(@[5]) == 5
assert product(@[-5]) == -5
assert product(@[2, 3, 4]) == 24
assert product(@[2.0, 3.0, 4.0]) == 24.0
assert product(@[@[2.3, 4.5], @[6.7, 8.9]]) ~ 617.1705
