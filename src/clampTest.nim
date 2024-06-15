import clamp

assert clamp(1, 0, 10) == 1
assert clamp(-1, 0, 10) == 0
assert clamp(-5, -20, -10) == -10
assert clamp(1.2, 1.1, 1.3) == 1.2
assert clamp(1.2, 1.3, 1.3) == 1.3
assert clamp(@[1.2, 3.4, 5.6], 3.0, 4.0) == @[3.0, 3.4, 4.0]

assert clamp(@[@[@[-1.2, 3.4, -5.6, 7.8]]], -5.0, 5.0) == @[@[@[-1.2, 3.4, -5.0, 5.0]]]
