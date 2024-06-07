import divide
import operatorApprox

assert divide(3, 4) ~ 0.75
assert divide(1.2, 3.4) ~ 0.352941176
assert divide(2, 3.4) ~ 0.588235294
assert divide(2.3, 4) ~ 0.575
assert divide(-5, -10) ~ 0.5
assert divide(-2.3, -4.5) ~ 0.511111111
assert divide(-5.6, 5.6) ~ -1.0
assert divide("hello", true) == "hello"
assert divide("hello", 2) == "hel"
assert divide("hello", 0.5) == "hellohello"
assert divide("hello", -2) == "leh"
assert divide("hello", 100) == ""

assert divide("hello", @[1, 2, 3]) == @["hello", "hel", "he"]

assert divide(@[2, 3, 4], @[5, 6, 7]) ~ @[0.4, 0.5, 0.571428571]

assert divide(@[2, 3, 4], @[5.6, 7.8, 9.0]) ~ @[0.357142857, 0.384615385, 0.444444444]

assert divide(@[2.3, 4.5, 6.7], @[8, 9, 10]) ~ @[0.2875, 0.5, 0.67]

assert divide(@[2.3, 4.5, 6.7], @[8.9, 10.11, 12.13]) ~ @[0.258426966,
    0.445103858, 0.552349547]

assert divide(@["abc123", "def456", "ghi789"], @[1, 2, 3]) == @["abc123", "def", "gh"]

assert divide(@["eat", "drink", "be merry"], @[1.25, 2.5, 3.75]) == @["ea",
    "dr", "be"]

assert divide(@[@[2, 3], @[4, 5], @[6, 7]], @[8, 9, 10]) ~ @[@[0.25, 0.375], @[
    0.444444444, 0.555555556], @[0.6, 0.7]]

assert divide(@[8, 9, 10], @[@[2, 3], @[4, 5], @[6, 7]]) ~ @[@[4.0,
    2.666666667], @[2.25, 1.8], @[1.666666667, 1.428571429]]

assert divide(@[@[2.0, 3.0], @[4.0, 5.0], @[6.0, 7.0]], @[8.0, 9.0, 10.0]) ~ @[
    @[0.25, 0.375], @[0.444444444, 0.555555556], @[0.6, 0.7]]

assert divide(@[8.0, 9.0, 10.0], @[@[2.0, 3.0], @[4.0, 5.0], @[6.0, 7.0]]) ~ @[
    @[4.0, 2.666666667], @[2.25, 1.8], @[1.666666667, 1.428571429]]

assert divide(@[@["abc123", "def456"], @["ghi789", "jklmno"], @["pqrs",
    "tuvw"]], @[2, 3, 4]) == @[@["abc", "def"], @["gh", "jk"], @["p", "t"]]

assert divide(@[@["g", "gg"], @["hhh", "hhhh"], @["iiiii", "iiiiii"]], @[@[1,
    2], @[3, 4], @[5, 6]]) == @[@["g", "g"], @["h", "h"], @["i", "i"]]
