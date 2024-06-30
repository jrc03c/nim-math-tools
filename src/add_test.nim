import add
import operator_approx

assert add(false, false) == 0
assert add(false, true) == 1
assert add(true, false) == 1
assert add(true, true) == 2
assert add(234, false) == 234
assert add(234, true) == 235
assert add(false, -234) == -234
assert add(true, -234) == -233
assert add(234.567, false) ~ 234.567
assert add(234.567, true) ~ 235.567
assert add(false, -234.567) ~ -234.567
assert add(true, -234.567) ~ -233.567
assert add(false, "hello") == "falsehello"
assert add(true, "hello") == "truehello"
assert add("goodbye", false) == "goodbyefalse"
assert add("goodbye", true) == "goodbyetrue"
assert add(3, 4) == 7
assert add(1.2, 3.4) ~ 4.6
assert add(2, 3.4) ~ 5.4
assert add(2.3, 4) ~ 6.3
assert add(-5, -10) == -15
assert add(-2.3, -4.5) ~ -6.8
assert add(-5.6, 5.6) ~ 0.0
assert add("hello", 234) == "hello234"
assert add(234, "hello") == "234hello"
assert add("goodbye", 234.567) == "goodbye234.567"
assert add(234.567, "goodbye") == "234.567goodbye"
assert add("hello", "goodbye") == "hellogoodbye"
assert add(@[2, 3, 4], 5) == @[7, 8, 9]
assert add(1.23, @[-4.56, -7.89]) ~ @[-3.33, -6.66]
assert add(@[2, 3, 4], @[5, 6, 7]) == @[7, 9, 11]
assert add(@[2, 3, 4], @[5.6, 7.8, 9.0]) ~ @[7.6, 10.8, 13.0]
assert add(@[2.3, 4.5, 6.7], @[8, 9, 10]) ~ @[10.3, 13.5, 16.7]
assert add(@[2.3, 4.5, 6.7], @[8.9, 10.11, 12.13]) ~ @[11.2, 14.61, 18.83]

assert add(@[@[2, 3], @[4, 5], @[6, 7]], @[8, 9, 10]) == @[@[10, 11], @[13, 14],
    @[16, 17]]

assert add(@[8, 9, 10], @[@[2, 3], @[4, 5], @[6, 7]]) == @[@[10, 11], @[13, 14],
    @[16, 17]]

assert add(@[@[2.0, 3.0], @[4.0, 5.0], @[6.0, 7.0]], @[8.0, 9.0, 10.0]) ~ @[@[
    10.0, 11.0], @[13.0, 14.0], @[16.0, 17.0]]

assert add(@[8.0, 9.0, 10.0], @[@[2.0, 3.0], @[4.0, 5.0], @[6.0, 7.0]]) ~ @[@[
    10.0, 11.0], @[13.0, 14.0], @[16.0, 17.0]]
