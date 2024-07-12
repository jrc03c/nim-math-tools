import nim_math_tools/operator_mul
import nim_math_tools/operator_approx
import std/unittest

test "operator_mul":
  check 3 * 4 == 12
  check 1.2 * 3.4 ~ 4.08
  check 2 * 3.4 ~ 6.8
  check 2.3 * 4 ~ 9.2
  check -5 * -10 == 50
  check -2.3 * -4.5 ~ 10.35
  check -5.6 * 5.6 ~ -31.36
  check "foo" * true == "foo"
  check false * "foo" == ""
  check "foo" * 4 == "foofoofoofoo"
  check 4 * "foo" == "foofoofoofoo"
  check "food" * 3.25 == "foodfoodfoodf"
  check 3.25 * "food" == "foodfoodfoodf"
  check -2.5 * "abcdef" == "cbafedcbafedcba"

  check @[2, 3, 4] * @[5, 6, 7] == @[10, 18, 28]
  check @[2, 3, 4] * @[5.6, 7.8, 9.0] ~ @[11.2, 23.4, 36.0]
  check @[2.3, 4.5, 6.7] * @[8, 9, 10] ~ @[18.4, 40.5, 67.0]
  check @[2.3, 4.5, 6.7] * @[8.9, 10.11, 12.13] ~ @[20.47, 45.495, 81.271]
  check @["a", "b", "c"] * @[1, 2, 3] == @["a", "bb", "ccc"]

  check @["eat", "drink", "be merry"] * @[1.25, 2.5, 3.75] == @["eate",
      "drinkdrinkdri", "be merrybe merrybe merrybe mer"]

  check @[@[2, 3], @[4, 5], @[6, 7]] * @[8, 9, 10] == @[@[16, 24], @[36, 45],
      @[60, 70]]

  check @[8, 9, 10] * @[@[2, 3], @[4, 5], @[6, 7]] == @[@[16, 24], @[36, 45],
      @[60, 70]]

  check @[@[2.0, 3.0], @[4.0, 5.0], @[6.0, 7.0]] * @[8.0, 9.0, 10.0] ~ @[@[
      16.0, 24.0], @[36.0, 45.0], @[60.0, 70.0]]

  check @[8.0, 9.0, 10.0] * @[@[2.0, 3.0], @[4.0, 5.0], @[6.0, 7.0]] ~ @[@[
      16.0, 24.0], @[36.0, 45.0], @[60.0, 70.0]]

  check @[@["a", "b"], @["c", "d"], @["e", "f"]] * @[2, 3, 4] == @[@["aa",
      "bb"], @["ccc", "ddd"], @["eeee", "ffff"]]

  check @["g", "h", "i"] * @[@[1, 2], @[3, 4], @[5, 6]] == @[@["g", "gg"], @[
      "hhh", "hhhh"], @["iiiii", "iiiiii"]]

  check -true == false
  check -false == true
  check -(@[2, 3, 4]) == @[-2, -3, -4]
  check -(@[-10, 20, -30]) == @[10, -20, 30]
  check -(@[1.2, -3.4, 5.6, -7.8]) ~ @[-1.2, 3.4, -5.6, 7.8]

  check -(@[@[true, false], @[false, true]]) == @[@[false, true], @[true, false]]

  (proc () =
    var x = 3
    x *= 4
    check x == 12
  )()

  (proc () =
    var x = 3.1
    x *= 4
    check x ~ 12.4
  )()

  (proc () =
    var x = 3.1
    x *= 4.2
    check x ~ 13.02
  )()

  (proc () =
    var x = 3
    x *= true
    check x == 3
  )()

  (proc () =
    var x = 3
    x *= false
    check x == 0
  )()

  (proc () =
    var x = 3.4
    x *= true
    check x == 3.4
  )()

  (proc () =
    var x = 3.4
    x *= false
    check x == 0.0
  )()

  (proc () =
    var x = "hello"
    x *= true
    check x == "hello"
  )()

  (proc () =
    var x = "hello"
    x *= 3
    check x == "hellohellohello"
  )()

  (proc () =
    var x = "hello"
    x *= 3.8
    check x == "hellohellohellohell"
  )()

  (proc () =
    var x = "hello"
    x *= -2.5
    check x == "leholleholleh"
  )()

  (proc () =
    var x = @[2, 3, 4]
    x *= 5
    check x == @[10, 15, 20]
  )()

  (proc () =
    var x = @[2.3, 4.5, 6.7]
    x *= 8.9
    check x ~ @[20.47, 40.05, 59.63]
  )()

  (proc () =
    var x = @["a", "b", "c"]
    x *= 3
    check x == @["aaa", "bbb", "ccc"]
  )()


  (proc () =
    var x = @[2, 3, 4]
    x *= @[5, 6, 7]
    check x == @[10, 18, 28]
  )()

  (proc () =
    var x = @[2.3, 4.5, 6.7]
    x *= @[8.9, 10.11, 12.13]
    check x ~ @[20.47, 45.495, 81.271]
  )()

  (proc () =
    var x = @["a", "b", "c"]
    x *= @[2, 3, 4]
    check x == @["aa", "bbb", "cccc"]
  )()

  (proc () =
    var x = @[2.3, 4.5, 6.7]
    x *= @[true, false, true]
    check x ~ @[2.3, 0.0, 6.7]
  )()

  (proc () =
    var x = @[@[2.3, 4.5], @[6.7, 8.9], @[10.11, 12.13]]
    x *= @[14.15, 16.17, 18.19]
    check x ~ @[@[32.545, 63.675], @[108.339, 143.913], @[183.9009, 220.6447]]
  )()

  (proc () =
    var x = @[@["a", "b"], @["c", "d"], @["e", "f"]]
    x *= @[2, 3, 4]
    check x == @[@["aa", "bb"], @["ccc", "ddd"], @["eeee", "ffff"]]
  )()
