import nim_math_tools/operator_approx
import nim_math_tools/operator_div
import std/math
import std/unittest

test "operator_div":
  check 3 / 4 ~ 0.75
  check 1.2 / 3.4 ~ 0.352941176
  check 2 / 3.4 ~ 0.588235294
  check 2.3 / 4 ~ 0.575
  check -5 / -10 ~ 0.5
  check -2.3 / -4.5 ~ 0.511111111
  check -5.6 / 5.6 ~ -1.0
  check "hello" / true == "hello"
  check "hello" / 2 == "hel"
  check "hello" / 0.5 == "hellohello"
  check "hello" / -2 == "leh"
  check "hello" / 100 == ""

  check "hello" / @[1, 2, 3] == @["hello", "hel", "he"]

  check @[2, 3, 4] / @[5, 6, 7] ~ @[0.4, 0.5, 0.571428571]
  check @[2, 3, 4] / @[5.6, 7.8, 9.0] ~ @[0.357142857, 0.384615385, 0.444444444]
  check @[2.3, 4.5, 6.7] / @[8, 9, 10] ~ @[0.2875, 0.5, 0.67]

  check @[2.3, 4.5, 6.7] / @[8.9, 10.11, 12.13] ~ @[0.258426966, 0.445103858, 0.552349547]

  check @["abc123", "def456", "ghi789"] / @[1, 2, 3] == @["abc123", "def", "gh"]

  check @["eat", "drink", "be merry"] / @[1.25, 2.5, 3.75] == @["ea", "dr", "be"]

  check @[@[2, 3], @[4, 5], @[6, 7]] / @[8, 9, 10] ~ @[@[0.25, 0.375], @[
      0.444444444, 0.555555556], @[0.6, 0.7]]

  check @[8, 9, 10] / @[@[2, 3], @[4, 5], @[6, 7]] ~ @[@[4.0, 2.666666667], @[
      2.25, 1.8], @[1.666666667, 1.428571429]]

  check @[@[2.0, 3.0], @[4.0, 5.0], @[6.0, 7.0]] / @[8.0, 9.0, 10.0] ~ @[@[0.25,
      0.375], @[0.444444444, 0.555555556], @[0.6, 0.7]]

  check @[8.0, 9.0, 10.0] / @[@[2.0, 3.0], @[4.0, 5.0], @[6.0, 7.0]] ~ @[@[4.0,
      2.666666667], @[2.25, 1.8], @[1.666666667, 1.428571429]]

  check @[@["abc123", "def456"], @["ghi789", "jklmno"], @["pqrs", "tuvw"]] / @[
      2, 3, 4] == @[@["abc", "def"], @["gh", "jk"], @["p", "t"]]

  check @[@["g", "gg"], @["hhh", "hhhh"], @["iiiii", "iiiiii"]] / @[@[1, 2], @[
      3, 4], @[5, 6]] == @[@["g", "g"], @["h", "h"], @["i", "i"]]

  (proc () =
    var x: int = 3
    x /= 4
    check x == 0
  )()

  (proc () =
    var x = 3.1
    x /= 4
    check x ~ 0.775
  )()

  (proc () =
    var x = 3.1
    x /= 4.2
    check x ~ 0.738095238
  )()

  (proc () =
    var x = 3
    x /= true
    check x == 3
  )()

  (proc () =
    var x: float = 3
    x /= false
    check math.is_nan(x)
  )()

  (proc () =
    var x = 3.4
    x /= true
    check x ~ 3.4
  )()

  (proc () =
    var x = 3.4
    x /= false
    check math.is_nan(x)
  )()

  (proc () =
    var x = "hello"
    x /= true
    check x == "hello"
  )()

  (proc () =
    var x = "hello"
    x /= 5
    check x == "h"
  )()

  (proc () =
    var x = "hello"
    x /= -1.0 / 3.0
    check x == "olleholleholleh"
  )()

  (proc () =
    var x = @[2, 3, 4]
    x /= 5
    check x == @[2 div 5, 3 div 5, 4 div 5]
  )()

  (proc () =
    var x = @[2.3, 4.5, 6.7]
    x /= 8.9
    check x ~ @[0.258426966, 0.505617978, 0.752808989]
  )()

  (proc () =
    var x = @[2, 3, 4]
    x /= @[5, 6, 7]
    check x == @[2 div 5, 3 div 6, 4 div 7]
  )()

  (proc () =
    var x = @[2.3, 4.5, 6.7]
    x /= @[8.9, 10.11, 12.13]
    check x ~ @[0.258426966, 0.445103858, 0.552349547]
  )()

  (proc () =
    var x = @[2.3, 4.5, 6.7]
    x /= @[true, false, true]
    check x[0] ~ 2.3
    check math.is_nan(x[1])
    check x[2] ~ 6.7
  )()

  (proc () =
    var x = @[@[2.3, 4.5], @[6.7, 8.9], @[10.11, 12.13]]
    x /= @[14.15, 16.17, 18.19]

    check x ~ @[@[0.162544175, 0.318021201], @[0.414347557, 0.550401979], @[
        0.55579989, 0.666849918]]
  )()
