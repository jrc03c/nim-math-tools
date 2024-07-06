import operator_approx

assert approx(3.0, 3.0000000001)
assert not approx(3.0, 4.0000000001)
assert approx(3, 3)
assert not approx(3, 4)
assert approx(3, 3.0000000001)
assert not approx(3, 4.0000000001)
assert approx(3.0000000001, 3)
assert not approx(3.0000000001, 4)
assert approx(@[3.0, 4.0, 5.0], @[3.0000000001, 4.0000000001, 5.0000000001])
assert not approx(@[3.0, 4.0, 5.0], @[3.5, 4.5, 5.5])
assert approx(@[@[2.0, 3.0], @[4.0, 5.0]], @[@[2.0000000001, 3.0000000001], @[
    4.0000000001, 5.0000000001]])
assert not approx(@[@[2.0, 3.0], @[4.0, 5.0]], @[@[2.5, 3.5], @[4.5, 5.5]])
assert not approx(@[2.0, 3.0], @[2.0, 3.1])
assert approx(2, 12, 15)
assert approx(2.5, 3.5, 2.0)
assert not approx(2.5, 2.5000000000001, 0.0)
assert not approx(3.0, NaN)
assert not approx(NaN, 3.0)
assert approx(NaN, NaN)

assert 3.0 ~ 3.0000000001
assert 3.0 !~ 4.0000000001
assert 3 ~ 3
assert 3 !~ 4
assert 3 ~ 3.0000000001
assert 3 !~ 4.0000000001
assert 3.0000000001 ~ 3
assert 3.0000000001 !~ 4
assert @[3.0, 4.0, 5.0] ~ @[3.0000000001, 4.0000000001, 5.0000000001]
assert @[3.0, 4.0, 5.0] !~ @[3.5, 4.5, 5.5]
assert @[@[2.0, 3.0], @[4.0, 5.0]] ~ @[@[2.0000000001, 3.0000000001], @[
    4.0000000001, 5.0000000001]]
assert @[@[2.0, 3.0], @[4.0, 5.0]] !~ @[@[2.5, 3.5], @[4.5, 5.5]]
assert @[2.0, 3.0] !~ @[2.0, 3.1]
