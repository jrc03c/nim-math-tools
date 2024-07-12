import nim_math_tools/operator_approx
import std/unittest

test "operator_approx":
    check approx(3.0, 3.0000000001)
    check not approx(3.0, 4.0000000001)
    check approx(3, 3)
    check not approx(3, 4)
    check approx(3, 3.0000000001)
    check not approx(3, 4.0000000001)
    check approx(3.0000000001, 3)
    check not approx(3.0000000001, 4)
    check approx(@[3.0, 4.0, 5.0], @[3.0000000001, 4.0000000001, 5.0000000001])
    check not approx(@[3.0, 4.0, 5.0], @[3.5, 4.5, 5.5])

    check approx(@[@[2.0, 3.0], @[4.0, 5.0]], @[@[2.0000000001, 3.0000000001],
            @[4.0000000001, 5.0000000001]])

    check not approx(@[@[2.0, 3.0], @[4.0, 5.0]], @[@[2.5, 3.5], @[4.5, 5.5]])
    check not approx(@[2.0, 3.0], @[2.0, 3.1])
    check approx(2, 12, 15)
    check approx(2.5, 3.5, 2.0)
    check not approx(2.5, 2.5000000000001, 0.0)
    check not approx(3.0, NaN)
    check not approx(NaN, 3.0)
    check approx(NaN, NaN)

    check 3.0 ~ 3.0000000001
    check 3.0 !~ 4.0000000001
    check 3 ~ 3
    check 3 !~ 4
    check 3 ~ 3.0000000001
    check 3 !~ 4.0000000001
    check 3.0000000001 ~ 3
    check 3.0000000001 !~ 4
    check @[3.0, 4.0, 5.0] ~ @[3.0000000001, 4.0000000001, 5.0000000001]
    check @[3.0, 4.0, 5.0] !~ @[3.5, 4.5, 5.5]

    check @[@[2.0, 3.0], @[4.0, 5.0]] ~ @[@[2.0000000001, 3.0000000001], @[
            4.0000000001, 5.0000000001]]

    check @[@[2.0, 3.0], @[4.0, 5.0]] !~ @[@[2.5, 3.5], @[4.5, 5.5]]
    check @[2.0, 3.0] !~ @[2.0, 3.1]
