import approximatelyEquals
import multiply

assert "foo" * 3 == "foofoofoo"
assert "Abcd" * 3.5 == "AbcdAbcdAbcdAb"
assert 3 * "foo" == "foofoofoo"
assert 3.5 * "Abcd" == "AbcdAbcdAbcdAb"
assert "abc" * -3 == "cbacbacba"
assert -3 * "abc" == "cbacbacba"
assert "Abcd" * -3.5 == "bAdcbAdcbAdcbA"
assert @["a", "b", "c"] * 3 == @["aaa", "bbb", "ccc"]
assert 3 * @["a", "b", "c"] == @["aaa", "bbb", "ccc"]
assert 2.5 * @["Ab", "Cd", "Ef"] == @["AbAbA", "CdCdC", "EfEfE"]
assert @["Ab", "Cd", "Ef"] * 2.5 == @["AbAbA", "CdCdC", "EfEfE"]
assert @[@[@["nope"]]] * 3 == @[@[@["nopenopenope"]]]
assert 3 * @[@[@["nope"]]] == @[@[@["nopenopenope"]]]

(proc () =
  var x = "abc"
  x *= 3
  assert x == "abcabcabc"
)()

(proc () =
  var x = @["abcd", "efgh"]
  x *= 2.5
  assert x == @["abcdabcdab", "efghefghef"]
)()

(proc () =
  var x = @[@[@["no"]]]
  x *= 5
  assert x == @[@[@["nonononono"]]]
)()

(proc () =
  var x = @[2, 3, 4]
  x *= 5
  assert x == @[10, 15, 20]
)()

(proc () =
  var x = @[1.1, 2.2, 3.3]
  x *= 4.4
  assert x ~ @[4.84, 9.68, 14.52]
)()

(proc () =
  var x = @[2, 3, 4]
  x *= @[5, 6, 7]
  assert x == @[10, 18, 28]
)()

(proc () =
  var x = @[1.1, 2.2, 3.3]
  x *= @[4.4, 5.5, 6.6]
  assert x ~ @[4.84, 12.1, 21.78]
)()

(proc () =
  var x = @[@[@[2, 3, 4]]]
  x *= @[@[@[5, 6, 7]]]
  assert x == @[@[@[10, 18, 28]]]
)()
