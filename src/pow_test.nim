import operator_approx
import pow

assert pow(2, 3) == 8
assert pow(4, 3) == 64
assert pow(2.0, 3.0) == 8.0
assert pow(1.2, 3.4) ~ 1.858729692
assert pow(@[2, 3, 4], 3) == @[8, 27, 64]
assert pow(@[@[@[2, 3, 4]]], @[@[@[5, 6, 7]]]) == @[@[@[32, 729, 16384]]]
