import round

assert round(1.1) == 1.0
assert round(1.9) == 2.0
assert round(@[1.2, 3.4, 5.6]) == @[1.0, 3.0, 6.0]

assert round(@[@[2.3, 4.5, 6.7], @[8.9, 10.11, 12.13]]) == @[@[2.0, 5.0, 7.0],
    @[9.0, 10.0, 12.0]]
