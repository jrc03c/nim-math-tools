import mul
import operatorApprox

assert mul(3, 4) == 12
assert mul(1.2, 3.4) ~ 4.08
assert mul(2, 3.4) ~ 6.8
assert mul(2.3, 4) ~ 9.2
assert mul(-5, -10) == 50
assert mul(-2.3, -4.5) ~ 10.35
assert mul(-5.6, 5.6) ~ -31.36
assert mul("foo", true) == "foo"
assert mul(false, "foo") == ""
assert mul("foo", 4) == "foofoofoofoo"
assert mul(4, "foo") == "foofoofoofoo"
assert mul("food", 3.25) == "foodfoodfoodf"
assert mul(3.25, "food") == "foodfoodfoodf"
assert mul(-2.5, "abcdef") == "cbafedcbafedcba"

assert mul(@[2, 3, 4], @[5, 6, 7]) == @[10, 18, 28]
assert mul(@[2, 3, 4], @[5.6, 7.8, 9.0]) ~ @[11.2, 23.4, 36.0]
assert mul(@[2.3, 4.5, 6.7], @[8, 9, 10]) ~ @[18.4, 40.5, 67.0]
assert mul(@[2.3, 4.5, 6.7], @[8.9, 10.11, 12.13]) ~ @[20.47, 45.495, 81.271]
assert mul(@["a", "b", "c"], @[1, 2, 3]) == @["a", "bb", "ccc"]
assert mul(@["eat", "drink", "be merry"], @[1.25, 2.5, 3.75]) == @["eate",
    "drinkdrinkdri", "be merrybe merrybe merrybe mer"]

assert mul(@[@[2, 3], @[4, 5], @[6, 7]], @[8, 9, 10]) == @[@[16, 24], @[36, 45],
    @[60, 70]]

assert mul(@[8, 9, 10], @[@[2, 3], @[4, 5], @[6, 7]]) == @[@[16, 24], @[36, 45],
    @[60, 70]]

assert mul(@[@[2.0, 3.0], @[4.0, 5.0], @[6.0, 7.0]], @[8.0, 9.0, 10.0]) ~ @[@[
    16.0, 24.0], @[36.0, 45.0], @[60.0, 70.0]]

assert mul(@[8.0, 9.0, 10.0], @[@[2.0, 3.0], @[4.0, 5.0], @[6.0, 7.0]]) ~ @[@[
    16.0, 24.0], @[36.0, 45.0], @[60.0, 70.0]]

assert mul(@[@["a", "b"], @["c", "d"], @["e", "f"]], @[2, 3, 4]) == @[@["aa",
    "bb"], @["ccc", "ddd"], @["eeee", "ffff"]]

assert mul(@["g", "h", "i"], @[@[1, 2], @[3, 4], @[5, 6]]) == @[@["g",
    "gg"], @["hhh", "hhhh"], @["iiiii", "iiiiii"]]

assert mul(true, -1) == -1
assert mul(-1, false) == 0
assert mul(@[2, 3, 4], -1) == @[-2, -3, -4]
assert mul(-1, @[-10, 20, -30]) == @[10, -20, 30]
assert mul(@[1.2, -3.4, 5.6, -7.8], -1) ~ @[-1.2, 3.4, -5.6, 7.8]
assert mul(-1, @[@[true, false], @[false, true]]) == @[@[-1, 0], @[0, -1]]
