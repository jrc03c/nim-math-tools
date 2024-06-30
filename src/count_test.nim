import count

let x = @["a", "b", "c", "a", "b", "a", "a", "a"]
assert count(x)["a"] == 5
assert count(x)["b"] == 2
assert count(x)["c"] == 1

let y = @[@[@[1, 1], @[2, 2], @[3, 3, 3, 3]]]
assert count(y)[1] == 2
assert count(y)[2] == 2
assert count(y)[3] == 4
