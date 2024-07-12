import nim_math_tools/divide
import nim_math_tools/operator_approx
import std/unittest

test "divide":
    check divide(3, 4) ~ 0.75
    check divide(1.2, 3.4) ~ 0.352941176
    check divide(2, 3.4) ~ 0.588235294
    check divide(2.3, 4) ~ 0.575
    check divide(-5, -10) ~ 0.5
    check divide(-2.3, -4.5) ~ 0.511111111
    check divide(-5.6, 5.6) ~ -1.0
    check divide("hello", true) == "hello"
    check divide("hello", 2) == "hel"
    check divide("hello", 0.5) == "hellohello"
    check divide("hello", -2) == "leh"
    check divide("hello", 100) == ""

    check divide("hello", @[1, 2, 3]) == @["hello", "hel", "he"]

    check divide(@[2, 3, 4], @[5, 6, 7]) ~ @[0.4, 0.5, 0.571428571]

    check divide(@[2, 3, 4], @[5.6, 7.8, 9.0]) ~ @[0.357142857, 0.384615385, 0.444444444]

    check divide(@[2.3, 4.5, 6.7], @[8, 9, 10]) ~ @[0.2875, 0.5, 0.67]

    check divide(@[2.3, 4.5, 6.7], @[8.9, 10.11, 12.13]) ~ @[0.258426966,
            0.445103858, 0.552349547]

    check divide(@["abc123", "def456", "ghi789"], @[1, 2, 3]) == @["abc123",
            "def", "gh"]

    check divide(@["eat", "drink", "be merry"], @[1.25, 2.5, 3.75]) == @["ea",
            "dr", "be"]

    check divide(@[@[2, 3], @[4, 5], @[6, 7]], @[8, 9, 10]) ~ @[@[0.25, 0.375],
            @[0.444444444, 0.555555556], @[0.6, 0.7]]

    check divide(@[8, 9, 10], @[@[2, 3], @[4, 5], @[6, 7]]) ~ @[@[4.0,
            2.666666667], @[2.25, 1.8], @[1.666666667, 1.428571429]]

    check divide(@[@[2.0, 3.0], @[4.0, 5.0], @[6.0, 7.0]], @[8.0, 9.0, 10.0]) ~
            @[@[0.25, 0.375], @[0.444444444, 0.555555556], @[0.6, 0.7]]

    check divide(@[8.0, 9.0, 10.0], @[@[2.0, 3.0], @[4.0, 5.0], @[6.0, 7.0]]) ~
            @[@[4.0, 2.666666667], @[2.25, 1.8], @[1.666666667, 1.428571429]]

    check divide(@[@["abc123", "def456"], @["ghi789", "jklmno"], @["pqrs",
            "tuvw"]], @[2, 3, 4]) == @[@["abc", "def"], @["gh", "jk"], @["p", "t"]]

    check divide(@[@["g", "gg"], @["hhh", "hhhh"], @["iiiii", "iiiiii"]], @[@[1,
            2], @[3, 4], @[5, 6]]) == @[@["g", "g"], @["h", "h"], @["i", "i"]]
