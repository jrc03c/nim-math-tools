import nim_math_tools/operator_add
import nim_math_tools/operator_approx
import std/unittest

test "operator_add":
  check 3 + 4 == 7
  check 1.2 + 3.4 ~ 4.6
  check 2 + 3.4 ~ 5.4
  check 2.3 + 4 ~ 6.3
  check -5 + -10 == -15
  check -2.3 + -4.5 ~ -6.8
  check -5.6 + 5.6 ~ 0.0
  check "foo" + "bar" == "foobar"
  check "foo" + true == "footrue"
  check false + "foo" == "falsefoo"
  check "foo" + 234 == "foo234"
  check 234 + "foo" == "234foo"
  check "foo" + 234.567 == "foo234.567"
  check 234.567 + "foo" == "234.567foo"

  check @[2, 3, 4] + 5 == @[7, 8, 9]
  check 5 + @[2, 3, 4] == @[7, 8, 9]
  check @[1.2, 3.4, 5.6] + 7.8 ~ @[9.0, 11.2, 13.4]
  check 7.8 + @[1.2, 3.4, 5.6] ~ @[9.0, 11.2, 13.4]
  check @["a", "b", "c"] + "foo" == @["afoo", "bfoo", "cfoo"]
  check "foo" + @["a", "b", "c"] == @["fooa", "foob", "fooc"]

  check @[2, 3, 4] + @[5, 6, 7] == @[7, 9, 11]
  check @[2, 3, 4] + @[5.6, 7.8, 9.0] ~ @[7.6, 10.8, 13.0]
  check @[2.3, 4.5, 6.7] + @[8, 9, 10] ~ @[10.3, 13.5, 16.7]
  check @[2.3, 4.5, 6.7] + @[8.9, 10.11, 12.13] ~ @[11.2, 14.61, 18.83]
  check @["a", "b", "c"] + @["d", "e", "f"] == @["ad", "be", "cf"]

  check @[@[2, 3], @[4, 5], @[6, 7]] + @[8, 9, 10] == @[@[10, 11], @[13, 14],
      @[16, 17]]

  check @[8, 9, 10] + @[@[2, 3], @[4, 5], @[6, 7]] == @[@[10, 11], @[13, 14],
      @[16, 17]]

  check @[@[2.0, 3.0], @[4.0, 5.0], @[6.0, 7.0]] + @[8.0, 9.0, 10.0] ~ @[@[
      10.0, 11.0], @[13.0, 14.0], @[16.0, 17.0]]

  check @[8.0, 9.0, 10.0] + @[@[2.0, 3.0], @[4.0, 5.0], @[6.0, 7.0]] ~ @[@[
      10.0, 11.0], @[13.0, 14.0], @[16.0, 17.0]]

  check @[@["a", "b"], @["c", "d"], @["e", "f"]] + @["g", "h", "i"] == @[@[
      "ag", "bg"], @["ch", "dh"], @["ei", "fi"]]

  check @["g", "h", "i"] + @[@["a", "b"], @["c", "d"], @["e", "f"]] == @[@[
      "ga", "gb"], @["hc", "hd"], @["ie", "if"]]

  (proc () =
    var x = 3
    x += 4
    check x == 7
  )()

  (proc () =
    var x = 3.1
    x += 4
    check x ~ 7.1
  )()

  (proc () =
    var x = 3.1
    x += 4.2
    check x ~ 7.3
  )()

  (proc () =
    var x = 3
    x += true
    check x == 4
  )()

  (proc () =
    var x = 3.4
    x += true
    check x ~ 4.4
  )()

  (proc () =
    var x = "hello"
    x += "goodbye"
    check x == "hellogoodbye"
  )()

  (proc () =
    var x = "hello"
    x += true
    check x == "hellotrue"
  )()

  (proc () =
    var x = "hello"
    x += 234
    check x == "hello234"
  )()

  (proc () =
    var x = "hello"
    x += 234.567
    check x == "hello234.567"
  )()

  (proc () =
    var x = @[2, 3, 4]
    x += 5
    check x == @[7, 8, 9]
  )()

  (proc () =
    var x = @[2.3, 4.5, 6.7]
    x += 8.9
    check x ~ @[11.2, 13.4, 15.6]
  )()

  (proc () =
    var x = @["a", "b", "c"]
    x += "foo"
    check x == @["afoo", "bfoo", "cfoo"]
  )()

  (proc () =
    var x = @[2, 3, 4]
    x += @[5, 6, 7]
    check x == @[7, 9, 11]
  )()

  (proc () =
    var x = @[2.3, 4.5, 6.7]
    x += @[8.9, 10.11, 12.13]
    check x ~ @[11.2, 14.61, 18.83]
  )()

  (proc () =
    var x = @["a", "b", "c"]
    x += @["d", "e", "f"]
    check x == @["ad", "be", "cf"]
  )()

  (proc () =
    var x = @[2.3, 4.5, 6.7]
    x += @[true, false, true]
    check x ~ @[3.3, 4.5, 7.7]
  )()

  (proc () =
    var x = @[@[2.3, 4.5], @[6.7, 8.9], @[10.11, 12.13]]
    x += @[14.15, 16.17, 18.19]
    check x ~ @[@[16.45, 18.65], @[22.87, 25.07], @[28.3, 30.32]]
  )()

  (proc () =
    var x = @[@["a", "b"], @["c", "d"], @["e", "f"]]
    x += @["g", "h", "i"]
    check x == @[@["ag", "bg"], @["ch", "dh"], @["ei", "fi"]]
  )()
