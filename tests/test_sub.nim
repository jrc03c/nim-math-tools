import nim_math_tools/sub
import nim_math_tools/operator_approx
import std/unittest

test "sub":
    check sub(false, false) == 0
    check sub(false, true) == -1
    check sub(true, false) == 1
    check sub(true, true) == 0
    check sub(234, false) == 234
    check sub(234, true) == 233
    check sub(false, -234) == 234
    check sub(true, -234) == 235
    check sub(234.567, false) ~ 234.567
    check sub(234.567, true) ~ 233.567
    check sub(false, -234.567) ~ 234.567
    check sub(true, -234.567) ~ 235.567
    check sub(false, "hello") == "false"
    check sub(true, "hello") == "true"
    check sub("goodbye", false) == "goodbye"
    check sub("goodbye", true) == "goodbye"
    check sub("foobar", "o") == "fobar"
    check sub("Mississippi", "iss") == "Missippi"
    check sub(3, 4) == -1
    check sub(1.2, 3.4) ~ -2.2
    check sub(2, 3.4) ~ -1.4
    check sub(2.3, 4) ~ -1.7
    check sub(-5, -10) == 5
    check sub(-2.3, -4.5) ~ 2.2
    check sub(-5.6, 5.6) ~ -11.2
    check sub("hello", 234) == "hello"
    check sub(234, "hello") == "234"
    check sub("goodbye", 234.567) == "goodbye"
    check sub(234.567, "goodbye") == "234.567"
    check sub(@[2, 3, 4], 5) == @[-3, -2, -1]
    check sub(1.23, @[-4.56, -7.89]) ~ @[5.79, 9.12]
    check sub(@[2, 3, 4], @[5, 6, 7]) == @[-3, -3, -3]
    check sub(@[2, 3, 4], @[5.6, 7.8, 9.0]) ~ @[-3.6, -4.8, -5.0]
    check sub(@[2.3, 4.5, 6.7], @[8, 9, 10]) ~ @[-5.7, -4.5, -3.3]
    check sub(@[2.3, 4.5, 6.7], @[8.9, 10.11, 12.13]) ~ @[-6.6, -5.61, -5.43]

    check sub(@[@[2, 3], @[4, 5], @[6, 7]], @[8, 9, 10]) == @[@[-6, -5], @[-5,
            -4], @[-4, -3]]

    check sub(@[8, 9, 10], @[@[2, 3], @[4, 5], @[6, 7]]) == @[@[6, 5], @[5, 4],
            @[4, 3]]

    check sub(@[@[2.0, 3.0], @[4.0, 5.0], @[6.0, 7.0]], @[8.0, 9.0, 10.0]) ~ @[
            @[-6.0, -5.0], @[-5.0, -4.0], @[-4.0, -3.0]]

    check sub(@[8.0, 9.0, 10.0], @[@[2.0, 3.0], @[4.0, 5.0], @[6.0, 7.0]]) ~ @[
            @[6.0, 5.0], @[5.0, 4.0], @[4.0, 3.0]]
