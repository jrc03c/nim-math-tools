import operatorApprox
import operatorMod

assert 9 % 2 == 1
assert 9 % 3 == 0
assert 9 % 5 == 4
assert @[5, 10, 15] % 3 == @[2, 1, 0]
assert @[5, 10, 15] % @[2, 3, 4] == @[1, 1, 3]
assert 2.3 % 1.2 ~ 1.1
assert @[@[@[5, 10, 15]]] % @[@[@[2, 3, 4]]] == @[@[@[1, 1, 3]]]
