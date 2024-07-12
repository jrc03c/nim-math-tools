import nim_math_tools/mul
import nim_math_tools/operator_approx
import std/unittest

test "mul":
    check mul(3, 4) == 12
    check mul(1.2, 3.4) ~ 4.08
    check mul(2, 3.4) ~ 6.8
    check mul(2.3, 4) ~ 9.2
    check mul(-5, -10) == 50
    check mul(-2.3, -4.5) ~ 10.35
    check mul(-5.6, 5.6) ~ -31.36
    check mul("foo", true) == "foo"
    check mul(false, "foo") == ""
    check mul("foo", 4) == "foofoofoofoo"
    check mul(4, "foo") == "foofoofoofoo"
    check mul("food", 3.25) == "foodfoodfoodf"
    check mul(3.25, "food") == "foodfoodfoodf"
    check mul(-2.5, "abcdef") == "cbafedcbafedcba"

    check mul(@[2, 3, 4], @[5, 6, 7]) == @[10, 18, 28]
    check mul(@[2, 3, 4], @[5.6, 7.8, 9.0]) ~ @[11.2, 23.4, 36.0]
    check mul(@[2.3, 4.5, 6.7], @[8, 9, 10]) ~ @[18.4, 40.5, 67.0]

    check mul(@[2.3, 4.5, 6.7], @[8.9, 10.11, 12.13]) ~ @[20.47, 45.495, 81.271]

    check mul(@["a", "b", "c"], @[1, 2, 3]) == @["a", "bb", "ccc"]

    check mul(@["eat", "drink", "be merry"], @[1.25, 2.5, 3.75]) == @["eate",
            "drinkdrinkdri", "be merrybe merrybe merrybe mer"]

    check mul(@[@[2, 3], @[4, 5], @[6, 7]], @[8, 9, 10]) == @[@[16, 24], @[36,
            45], @[60, 70]]

    check mul(@[8, 9, 10], @[@[2, 3], @[4, 5], @[6, 7]]) == @[@[16, 24], @[36,
            45], @[60, 70]]

    check mul(@[@[2.0, 3.0], @[4.0, 5.0], @[6.0, 7.0]], @[8.0, 9.0, 10.0]) ~ @[
            @[16.0, 24.0], @[36.0, 45.0], @[60.0, 70.0]]

    check mul(@[8.0, 9.0, 10.0], @[@[2.0, 3.0], @[4.0, 5.0], @[6.0, 7.0]]) ~ @[
            @[16.0, 24.0], @[36.0, 45.0], @[60.0, 70.0]]

    check mul(@[@["a", "b"], @["c", "d"], @["e", "f"]], @[2, 3, 4]) == @[@[
            "aa", "bb"], @["ccc", "ddd"], @["eeee", "ffff"]]

    check mul(@["g", "h", "i"], @[@[1, 2], @[3, 4], @[5, 6]]) == @[@["g",
            "gg"], @["hhh", "hhhh"], @["iiiii", "iiiiii"]]

    check mul(true, -1) == -1
    check mul(-1, false) == 0
    check mul(@[2, 3, 4], -1) == @[-2, -3, -4]
    check mul(-1, @[-10, 20, -30]) == @[10, -20, 30]
    check mul(@[1.2, -3.4, 5.6, -7.8], -1) ~ @[-1.2, 3.4, -5.6, 7.8]
    check mul(-1, @[@[true, false], @[false, true]]) == @[@[-1, 0], @[0, -1]]
