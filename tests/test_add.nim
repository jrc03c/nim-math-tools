import nim_math_tools/add
import nim_math_tools/operator_approx
import std/unittest

test "add":
    check add(false, false) == 0
    check add(false, true) == 1
    check add(true, false) == 1
    check add(true, true) == 2
    check add(234, false) == 234
    check add(234, true) == 235
    check add(false, -234) == -234
    check add(true, -234) == -233
    check add(234.567, false) ~ 234.567
    check add(234.567, true) ~ 235.567
    check add(false, -234.567) ~ -234.567
    check add(true, -234.567) ~ -233.567
    check add(false, "hello") == "falsehello"
    check add(true, "hello") == "truehello"
    check add("goodbye", false) == "goodbyefalse"
    check add("goodbye", true) == "goodbyetrue"
    check add(3, 4) == 7
    check add(1.2, 3.4) ~ 4.6
    check add(2, 3.4) ~ 5.4
    check add(2.3, 4) ~ 6.3
    check add(-5, -10) == -15
    check add(-2.3, -4.5) ~ -6.8
    check add(-5.6, 5.6) ~ 0.0
    check add("hello", 234) == "hello234"
    check add(234, "hello") == "234hello"
    check add("goodbye", 234.567) == "goodbye234.567"
    check add(234.567, "goodbye") == "234.567goodbye"
    check add("hello", "goodbye") == "hellogoodbye"
    check add(@[2, 3, 4], 5) == @[7, 8, 9]
    check add(1.23, @[-4.56, -7.89]) ~ @[-3.33, -6.66]
    check add(@[2, 3, 4], @[5, 6, 7]) == @[7, 9, 11]
    check add(@[2, 3, 4], @[5.6, 7.8, 9.0]) ~ @[7.6, 10.8, 13.0]
    check add(@[2.3, 4.5, 6.7], @[8, 9, 10]) ~ @[10.3, 13.5, 16.7]
    check add(@[2.3, 4.5, 6.7], @[8.9, 10.11, 12.13]) ~ @[11.2, 14.61, 18.83]

    check add(@[@[2, 3], @[4, 5], @[6, 7]], @[8, 9, 10]) == @[@[10, 11], @[13,
            14], @[16, 17]]

    check add(@[8, 9, 10], @[@[2, 3], @[4, 5], @[6, 7]]) == @[@[10, 11], @[13,
            14], @[16, 17]]

    check add(@[@[2.0, 3.0], @[4.0, 5.0], @[6.0, 7.0]], @[8.0, 9.0, 10.0]) ~ @[
            @[10.0, 11.0], @[13.0, 14.0], @[16.0, 17.0]]

    check add(@[8.0, 9.0, 10.0], @[@[2.0, 3.0], @[4.0, 5.0], @[6.0, 7.0]]) ~ @[
            @[10.0, 11.0], @[13.0, 14.0], @[16.0, 17.0]]
