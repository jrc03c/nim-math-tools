import sign

assert sign(3) == 1
assert sign(-3) == -1
assert sign(0) == 0

assert sign(3.0) == 1.0
assert sign(-3.0) == -1.0
assert sign(0.0) == 0.0

assert sign(@[2, -3, 4, -5]) == @[1, -1, 1, -1]
assert sign(@[@[0.0, -2.0], @[4.0, -6.0]]) == @[@[0.0, -1.0], @[1.0, -1.0]]
