import nim_math_tools/operator_sub
import nim_math_tools/operator_approx
import std/unittest

test "operator_sub":
  check false - false == 0
  check false - true == -1
  check true - false == 1
  check true - true == 0
  check 234 - false == 234
  check 234 - true == 233
  check false - -234 == 234
  check true - -234 == 235
  check 234.567 - false ~ 234.567
  check 234.567 - true ~ 233.567
  check false - -234.567 ~ 234.567
  check true - -234.567 ~ 235.567
  check false - "hello" == "false"
  check true - "hello" == "true"
  check "goodbye" - false == "goodbye"
  check "goodbye" - true == "goodbye"
  check "foobar" - "o" == "fobar"
  check "Mississippi" - "iss" == "Missippi"
  check 3 - 4 == -1
  check 1.2 - 3.4 ~ -2.2
  check 2 - 3.4 ~ -1.4
  check 2.3 - 4 ~ -1.7
  check -5 - -10 == 5
  check -2.3 - -4.5 ~ 2.2
  check -5.6 - 5.6 ~ -11.2
  check "hello" - 234 == "hello"
  check 234 - "hello" == "234"
  check "goodbye" - 234.567 == "goodbye"
  check 234.567 - "goodbye" == "234.567"
  check @[2, 3, 4] - 5 == @[-3, -2, -1]
  check 1.23 - @[-4.56, -7.89] ~ @[5.79, 9.12]
  check @[2, 3, 4] - @[5, 6, 7] == @[-3, -3, -3]
  check @[2, 3, 4] - @[5.6, 7.8, 9.0] ~ @[-3.6, -4.8, -5.0]
  check @[2.3, 4.5, 6.7] - @[8, 9, 10] ~ @[-5.7, -4.5, -3.3]
  check @[2.3, 4.5, 6.7] - @[8.9, 10.11, 12.13] ~ @[-6.6, -5.61, -5.43]

  check @[@[2, 3], @[4, 5], @[6, 7]] - @[8, 9, 10] == @[@[-6, -5], @[-5, -4], @[-4, -3]]

  check @[8, 9, 10] - @[@[2, 3], @[4, 5], @[6, 7]] == @[@[6, 5], @[5, 4], @[4, 3]]

  check @[@[2.0, 3.0], @[4.0, 5.0], @[6.0, 7.0]] - @[8.0, 9.0, 10.0] ~ @[@[-6.0,
      -5.0], @[-5.0, -4.0], @[-4.0, -3.0]]

  check @[8.0, 9.0, 10.0] - @[@[2.0, 3.0], @[4.0, 5.0], @[6.0, 7.0]] ~ @[@[6.0,
      5.0], @[5.0, 4.0], @[4.0, 3.0]]

  (proc () =
    var x = 3
    x -= 4
    check x == -1
  )()

  (proc () =
    var x = 3.1
    x -= 4
    check x ~ -0.9
  )()

  (proc () =
    var x = 3.1
    x -= 4.2
    check x ~ -1.1
  )()

  (proc () =
    var x = 3
    x -= true
    check x == 2
  )()

  (proc () =
    var x = 3.4
    x -= true
    check x == 2.4
  )()

  (proc () =
    var x = "Hello, world!"
    x -= ", world"
    check x == "Hello!"
  )()

  (proc () =
    var x = "It's all true, I swear!"
    x -= true
    x -= " , I"
    check x == "It's all swear!"
  )()

  (proc () =
    var x = @[2, 3, 4]
    x -= 5
    check x == @[-3, -2, -1]
  )()

  (proc () =
    var x = @[2.3, 4.5, 6.7]
    x -= 8.9
    check x ~ @[-6.6, -4.4, -2.2]
  )()

  (proc () =
    var x = @[2, 3, 4]
    x -= @[5, 6, 7]
    check x == @[-3, -3, -3]
  )()

  (proc () =
    var x = @[2.3, 4.5, 6.7]
    x -= @[8.9, 10.11, 12.13]
    check x ~ @[-6.6, -5.61, -5.43]
  )()

  (proc () =
    var x = @[2.3, 4.5, 6.7]
    x -= @[true, false, true]
    check x ~ @[1.3, 4.5, 5.7]
  )()

  (proc () =
    var x = @[@[2.3, 4.5], @[6.7, 8.9], @[10.11, 12.13]]
    x -= @[14.15, 16.17, 18.19]
    check x ~ @[@[-11.85, -9.65], @[-9.47, -7.27], @[-8.08, -6.06]]
  )()
