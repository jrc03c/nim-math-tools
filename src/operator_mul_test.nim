import operator_mul
import operator_approx

assert 3 * 4 == 12
assert 1.2 * 3.4 ~ 4.08
assert 2 * 3.4 ~ 6.8
assert 2.3 * 4 ~ 9.2
assert -5 * -10 == 50
assert -2.3 * -4.5 ~ 10.35
assert -5.6 * 5.6 ~ -31.36
assert "foo" * true == "foo"
assert false * "foo" == ""
assert "foo" * 4 == "foofoofoofoo"
assert 4 * "foo" == "foofoofoofoo"
assert "food" * 3.25 == "foodfoodfoodf"
assert 3.25 * "food" == "foodfoodfoodf"
assert -2.5 * "abcdef" == "cbafedcbafedcba"

assert @[2, 3, 4] * @[5, 6, 7] == @[10, 18, 28]
assert @[2, 3, 4] * @[5.6, 7.8, 9.0] ~ @[11.2, 23.4, 36.0]
assert @[2.3, 4.5, 6.7] * @[8, 9, 10] ~ @[18.4, 40.5, 67.0]
assert @[2.3, 4.5, 6.7] * @[8.9, 10.11, 12.13] ~ @[20.47, 45.495, 81.271]
assert @["a", "b", "c"] * @[1, 2, 3] == @["a", "bb", "ccc"]
assert @["eat", "drink", "be merry"] * @[1.25, 2.5, 3.75] == @["eate",
    "drinkdrinkdri", "be merrybe merrybe merrybe mer"]

assert @[@[2, 3], @[4, 5], @[6, 7]] * @[8, 9, 10] == @[@[16, 24], @[36, 45],
    @[60, 70]]

assert @[8, 9, 10] * @[@[2, 3], @[4, 5], @[6, 7]] == @[@[16, 24], @[36, 45],
    @[60, 70]]

assert @[@[2.0, 3.0], @[4.0, 5.0], @[6.0, 7.0]] * @[8.0, 9.0, 10.0] ~ @[@[
    16.0, 24.0], @[36.0, 45.0], @[60.0, 70.0]]

assert @[8.0, 9.0, 10.0] * @[@[2.0, 3.0], @[4.0, 5.0], @[6.0, 7.0]] ~ @[@[
    16.0, 24.0], @[36.0, 45.0], @[60.0, 70.0]]

assert @[@["a", "b"], @["c", "d"], @["e", "f"]] * @[2, 3, 4] == @[@["aa",
    "bb"], @["ccc", "ddd"], @["eeee", "ffff"]]

assert @["g", "h", "i"] * @[@[1, 2], @[3, 4], @[5, 6]] == @[@["g",
    "gg"], @["hhh", "hhhh"], @["iiiii", "iiiiii"]]

assert -true == false
assert -false == true
assert -(@[2, 3, 4]) == @[-2, -3, -4]
assert -(@[-10, 20, -30]) == @[10, -20, 30]
assert -(@[1.2, -3.4, 5.6, -7.8]) ~ @[-1.2, 3.4, -5.6, 7.8]
assert -(@[@[true, false], @[false, true]]) == @[@[false, true], @[true, false]]

(proc () =
  var x = 3
  x *= 4
  assert x == 12
)()

(proc () =
  var x = 3.1
  x *= 4
  assert x ~ 12.4
)()

(proc () =
  var x = 3.1
  x *= 4.2
  assert x ~ 13.02
)()

(proc () =
  var x = 3
  x *= true
  assert x == 3
)()

(proc () =
  var x = 3
  x *= false
  assert x == 0
)()

(proc () =
  var x = 3.4
  x *= true
  assert x == 3.4
)()

(proc () =
  var x = 3.4
  x *= false
  assert x == 0.0
)()

(proc () =
  var x = "hello"
  x *= true
  assert x == "hello"
)()

(proc () =
  var x = "hello"
  x *= 3
  assert x == "hellohellohello"
)()

(proc () =
  var x = "hello"
  x *= 3.8
  assert x == "hellohellohellohell"
)()

(proc () =
  var x = "hello"
  x *= -2.5
  assert x == "leholleholleh"
)()

(proc () =
  var x = @[2, 3, 4]
  x *= 5
  assert x == @[10, 15, 20]
)()

(proc () =
  var x = @[2.3, 4.5, 6.7]
  x *= 8.9
  assert x ~ @[20.47, 40.05, 59.63]
)()

(proc () =
  var x = @["a", "b", "c"]
  x *= 3
  assert x == @["aaa", "bbb", "ccc"]
)()


(proc () =
  var x = @[2, 3, 4]
  x *= @[5, 6, 7]
  assert x == @[10, 18, 28]
)()

(proc () =
  var x = @[2.3, 4.5, 6.7]
  x *= @[8.9, 10.11, 12.13]
  assert x ~ @[20.47, 45.495, 81.271]
)()

(proc () =
  var x = @["a", "b", "c"]
  x *= @[2, 3, 4]
  assert x == @["aa", "bbb", "cccc"]
)()

(proc () =
  var x = @[2.3, 4.5, 6.7]
  x *= @[true, false, true]
  assert x ~ @[2.3, 0.0, 6.7]
)()

(proc () =
  var x = @[@[2.3, 4.5], @[6.7, 8.9], @[10.11, 12.13]]
  x *= @[14.15, 16.17, 18.19]
  assert x ~ @[@[32.545, 63.675], @[108.339, 143.913], @[183.9009, 220.6447]]
)()

(proc () =
  var x = @[@["a", "b"], @["c", "d"], @["e", "f"]]
  x *= @[2, 3, 4]
  assert x == @[@["aa", "bb"], @["ccc", "ddd"], @["eeee", "ffff"]]
)()
