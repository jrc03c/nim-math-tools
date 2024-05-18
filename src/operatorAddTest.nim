import operatorAdd
import operatorApprox

assert 3 + 4 == 7
assert 1.2 + 3.4 ~ 4.6
assert 2 + 3.4 ~ 5.4
assert 2.3 + 4 ~ 6.3
assert -5 + -10 == -15
assert -2.3 + -4.5 ~ -6.8
assert -5.6 + 5.6 ~ 0.0
assert "foo" + "bar" == "foobar"
assert "foo" + true == "footrue"
assert false + "foo" == "falsefoo"
assert "foo" + 234 == "foo234"
assert 234 + "foo" == "234foo"
assert "foo" + 234.567 == "foo234.567"
assert 234.567 + "foo" == "234.567foo"

assert @[2, 3, 4] + 5 == @[7, 8, 9]
assert 5 + @[2, 3, 4] == @[7, 8, 9]
assert @[1.2, 3.4, 5.6] + 7.8 ~ @[9.0, 11.2, 13.4]
assert 7.8 + @[1.2, 3.4, 5.6] ~ @[9.0, 11.2, 13.4]
assert @["a", "b", "c"] + "foo" == @["afoo", "bfoo", "cfoo"]
assert "foo" + @["a", "b", "c"] == @["fooa", "foob", "fooc"]

assert @[2, 3, 4] + @[5, 6, 7] == @[7, 9, 11]
assert @[2, 3, 4] + @[5.6, 7.8, 9.0] ~ @[7.6, 10.8, 13.0]
assert @[2.3, 4.5, 6.7] + @[8, 9, 10] ~ @[10.3, 13.5, 16.7]
assert @[2.3, 4.5, 6.7] + @[8.9, 10.11, 12.13] ~ @[11.2, 14.61, 18.83]
assert @["a", "b", "c"] + @["d", "e", "f"] == @["ad", "be", "cf"]

assert @[@[2, 3], @[4, 5], @[6, 7]] + @[8, 9, 10] == @[@[10, 11], @[13, 14],
    @[16, 17]]

assert @[8, 9, 10] + @[@[2, 3], @[4, 5], @[6, 7]] == @[@[10, 11], @[13, 14],
    @[16, 17]]

assert @[@[2.0, 3.0], @[4.0, 5.0], @[6.0, 7.0]] + @[8.0, 9.0, 10.0] ~ @[@[
    10.0, 11.0], @[13.0, 14.0], @[16.0, 17.0]]

assert @[8.0, 9.0, 10.0] + @[@[2.0, 3.0], @[4.0, 5.0], @[6.0, 7.0]] ~ @[@[
    10.0, 11.0], @[13.0, 14.0], @[16.0, 17.0]]

assert @[@["a", "b"], @["c", "d"], @["e", "f"]] + @["g", "h", "i"] == @[@["ag",
    "bg"], @["ch", "dh"], @["ei", "fi"]]

assert @["g", "h", "i"] + @[@["a", "b"], @["c", "d"], @["e", "f"]] == @[@["ga",
    "gb"], @["hc", "hd"], @["ie", "if"]]

(proc () =
  var x = 3
  x += 4
  assert x == 7
)()

(proc () =
  var x = 3.1
  x += 4
  assert x ~ 7.1
)()

(proc () =
  var x = 3.1
  x += 4.2
  assert x ~ 7.3
)()

(proc () =
  var x = 3
  x += true
  assert x == 4
)()

(proc () =
  var x = 3.4
  x += true
  assert x ~ 4.4
)()

(proc () =
  var x = "hello"
  x += "goodbye"
  assert x == "hellogoodbye"
)()

(proc () =
  var x = "hello"
  x += true
  assert x == "hellotrue"
)()

(proc () =
  var x = "hello"
  x += 234
  assert x == "hello234"
)()

(proc () =
  var x = "hello"
  x += 234.567
  assert x == "hello234.567"
)()

(proc () =
  var x = @[2, 3, 4]
  x += 5
  assert x == @[7, 8, 9]
)()

(proc () =
  var x = @[2.3, 4.5, 6.7]
  x += 8.9
  assert x ~ @[11.2, 13.4, 15.6]
)()

(proc () =
  var x = @["a", "b", "c"]
  x += "foo"
  assert x == @["afoo", "bfoo", "cfoo"]
)()

(proc () =
  var x = @[2, 3, 4]
  x += @[5, 6, 7]
  assert x == @[7, 9, 11]
)()

(proc () =
  var x = @[2.3, 4.5, 6.7]
  x += @[8.9, 10.11, 12.13]
  assert x ~ @[11.2, 14.61, 18.83]
)()

(proc () =
  var x = @["a", "b", "c"]
  x += @["d", "e", "f"]
  assert x == @["ad", "be", "cf"]
)()

(proc () =
  var x = @[2.3, 4.5, 6.7]
  x += @[true, false, true]
  assert x ~ @[3.3, 4.5, 7.7]
)()

(proc () =
  var x = @[@[2.3, 4.5], @[6.7, 8.9], @[10.11, 12.13]]
  x += @[14.15, 16.17, 18.19]
  assert x ~ @[@[16.45, 18.65], @[22.87, 25.07], @[28.3, 30.32]]
)()

(proc () =
  var x = @[@["a", "b"], @["c", "d"], @["e", "f"]]
  x += @["g", "h", "i"]
  assert x == @[@["ag", "bg"], @["ch", "dh"], @["ei", "fi"]]
)()
