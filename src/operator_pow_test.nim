import operator_approx
import operator_pow

assert 2 ** 3 == 8
assert 4 ** 3 == 64
assert 2.0 ** 3.0 == 8.0
assert 1.2 ** 3.4 ~ 1.858729692
assert @[2, 3, 4] ** 3 == @[8, 27, 64]
assert @[@[@[2, 3, 4]]] ** @[@[@[5, 6, 7]]] == @[@[@[32, 729, 16384]]]
