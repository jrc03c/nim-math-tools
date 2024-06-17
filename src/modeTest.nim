import mode

assert mode(@[2, 3, 2, 3, 2, 2, 2, 4]) == @[2]
assert mode(@["foo", "bar", "bar", "baz"]) == @["bar"]
assert mode(@[@[2, 3], @[2, 3], @[2, 3], @[4, 5]]) == @[2, 3]
