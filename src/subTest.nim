import sub
import operatorApprox

assert sub(false, false) == 0
assert sub(false, true) == -1
assert sub(true, false) == 1
assert sub(true, true) == 0
assert sub(234, false) == 234
assert sub(234, true) == 233
assert sub(false, -234) == 234
assert sub(true, -234) == 235
assert sub(234.567, false) ~ 234.567
assert sub(234.567, true) ~ 233.567
assert sub(false, -234.567) ~ 234.567
assert sub(true, -234.567) ~ 235.567
assert sub(false, "hello") == "false"
assert sub(true, "hello") == "true"
assert sub("goodbye", false) == "goodbye"
assert sub("goodbye", true) == "goodbye"
assert sub("foobar", "o") == "fobar"
assert sub("Mississippi", "iss") == "Missippi"
assert sub(3, 4) == -1
assert sub(1.2, 3.4) ~ -2.2
assert sub(2, 3.4) ~ -1.4
assert sub(2.3, 4) ~ -1.7
assert sub(-5, -10) == 5
assert sub(-2.3, -4.5) ~ 2.2
assert sub(-5.6, 5.6) ~ -11.2
assert sub("hello", 234) == "hello"
assert sub(234, "hello") == "234"
assert sub("goodbye", 234.567) == "goodbye"
assert sub(234.567, "goodbye") == "234.567"
assert sub(@[2, 3, 4], 5) == @[-3, -2, -1]
assert sub(1.23, @[-4.56, -7.89]) ~ @[5.79, 9.12]
assert sub(@[2, 3, 4], @[5, 6, 7]) == @[-3, -3, -3]
assert sub(@[2, 3, 4], @[5.6, 7.8, 9.0]) ~ @[-3.6, -4.8, -5.0]
assert sub(@[2.3, 4.5, 6.7], @[8, 9, 10]) ~ @[-5.7, -4.5, -3.3]
assert sub(@[2.3, 4.5, 6.7], @[8.9, 10.11, 12.13]) ~ @[-6.6, -5.61, -5.43]

assert sub(@[@[2, 3], @[4, 5], @[6, 7]], @[8, 9, 10]) == @[@[-6, -5], @[-5, -4],
    @[-4, -3]]

assert sub(@[8, 9, 10], @[@[2, 3], @[4, 5], @[6, 7]]) == @[@[6, 5], @[5, 4],
    @[4, 3]]

assert sub(@[@[2.0, 3.0], @[4.0, 5.0], @[6.0, 7.0]], @[8.0, 9.0, 10.0]) ~ @[@[
    -6.0, -5.0], @[-5.0, -4.0], @[-4.0, -3.0]]

assert sub(@[8.0, 9.0, 10.0], @[@[2.0, 3.0], @[4.0, 5.0], @[6.0, 7.0]]) ~ @[@[
    6.0, 5.0], @[5.0, 4.0], @[4.0, 3.0]]
