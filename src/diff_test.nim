import diff
import sort

assert diff(@[2, 3, 4], @[4, 5, 6]) == @[2, 3]

assert sort(diff(@[@[@[5, 3, 1, 2, 4, 6]]], @[@[@[1, 3, 5, 7, 9]]])) == @[2, 4, 6]

let empty_int_seq: seq[int] = @[]
assert diff(@[2, 3, 4], @[2, 3, 4]) == empty_int_seq
assert diff(@[2, 3, 4], empty_int_seq) == @[2, 3, 4]
assert diff(@["a", "b", "c"], @["a", "c"]) == @["b"]
assert diff(@[@[@[1.2, 3.4, 5.6]]], @[1.2]) == @[3.4, 5.6]

assert diff_both(@[2, 3, 4], @[3, 4, 5]) == @[2, 5]

assert diff_both(@[@["foo", "bar"], @["hello", "world"]], @[@[@["hello",
    "foo"]]]) == @["bar", "world"]
