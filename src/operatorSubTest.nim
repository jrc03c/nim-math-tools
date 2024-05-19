import operatorSub
import operatorApprox

assert false - false == 0
assert false - true == -1
assert true - false == 1
assert true - true == 0
assert 234 - false == 234
assert 234 - true == 233
assert false - -234 == 234
assert true - -234 == 235
assert 234.567 - false ~ 234.567
assert 234.567 - true ~ 233.567
assert false - -234.567 ~ 234.567
assert true - -234.567 ~ 235.567
assert false - "hello" == "false"
assert true - "hello" == "true"
assert "goodbye" - false == "goodbye"
assert "goodbye" - true == "goodbye"
assert "foobar" - "o" == "fobar"
assert "Mississippi" - "iss" == "Missippi"
assert 3 - 4 == -1
assert 1.2 - 3.4 ~ -2.2
assert 2 - 3.4 ~ -1.4
assert 2.3 - 4 ~ -1.7
assert -5 - -10 == 5
assert -2.3 - -4.5 ~ 2.2
assert -5.6 - 5.6 ~ -11.2
assert "hello" - 234 == "hello"
assert 234 - "hello" == "234"
assert "goodbye" - 234.567 == "goodbye"
assert 234.567 - "goodbye" == "234.567"
assert @[2, 3, 4] - 5 == @[-3, -2, -1]
assert 1.23 - @[-4.56, -7.89] ~ @[5.79, 9.12]
assert @[2, 3, 4] - @[5, 6, 7] == @[-3, -3, -3]
assert @[2, 3, 4] - @[5.6, 7.8, 9.0] ~ @[-3.6, -4.8, -5.0]
assert @[2.3, 4.5, 6.7] - @[8, 9, 10] ~ @[-5.7, -4.5, -3.3]
assert @[2.3, 4.5, 6.7] - @[8.9, 10.11, 12.13] ~ @[-6.6, -5.61, -5.43]

assert @[@[2, 3], @[4, 5], @[6, 7]] - @[8, 9, 10] == @[@[-6, -5], @[-5, -4],
    @[-4, -3]]

assert @[8, 9, 10] - @[@[2, 3], @[4, 5], @[6, 7]] == @[@[6, 5], @[5, 4],
    @[4, 3]]

assert @[@[2.0, 3.0], @[4.0, 5.0], @[6.0, 7.0]] - @[8.0, 9.0, 10.0] ~ @[@[
    -6.0, -5.0], @[-5.0, -4.0], @[-4.0, -3.0]]

assert @[8.0, 9.0, 10.0] - @[@[2.0, 3.0], @[4.0, 5.0], @[6.0, 7.0]] ~ @[@[
    6.0, 5.0], @[5.0, 4.0], @[4.0, 3.0]]

(proc () =
  var x = 3
  x -= 4
  assert x == -1
)()

(proc () =
  var x = 3.1
  x -= 4
  assert x ~ -0.9
)()

(proc () =
  var x = 3.1
  x -= 4.2
  assert x ~ -1.1
)()

(proc () =
  var x = 3
  x -= true
  assert x == 2
)()

(proc () =
  var x = 3.4
  x -= true
  assert x == 2.4
)()

(proc () =
  var x = "Hello, world!"
  x -= ", world"
  assert x == "Hello!"
)()

(proc () =
  var x = "It's all true, I swear!"
  x -= true
  x -= " , I"
  assert x == "It's all swear!"
)()

(proc () =
  var x = @[2, 3, 4]
  x -= 5
  assert x == @[-3, -2, -1]
)()

(proc () =
  var x = @[2.3, 4.5, 6.7]
  x -= 8.9
  assert x ~ @[-6.6, -4.4, -2.2]
)()

(proc () =
  var x = @[2, 3, 4]
  x -= @[5, 6, 7]
  assert x == @[-3, -3, -3]
)()

(proc () =
  var x = @[2.3, 4.5, 6.7]
  x -= @[8.9, 10.11, 12.13]
  assert x ~ @[-6.6, -5.61, -5.43]
)()

(proc () =
  var x = @[2.3, 4.5, 6.7]
  x -= @[true, false, true]
  assert x ~ @[1.3, 4.5, 5.7]
)()

(proc () =
  var x = @[@[2.3, 4.5], @[6.7, 8.9], @[10.11, 12.13]]
  x -= @[14.15, 16.17, 18.19]
  assert x ~ @[@[-11.85, -9.65], @[-9.47, -7.27], @[-8.08, -6.06]]
)()
