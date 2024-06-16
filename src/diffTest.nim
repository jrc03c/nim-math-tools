import diff
import sort

assert diff(@[2, 3, 4], @[4, 5, 6]) == @[2, 3]

assert sort(diff(@[@[@[5, 3, 1, 2, 4, 6]]], @[@[@[1, 3, 5, 7, 9]]])) == @[2, 4, 6]

let emptyIntSeq: seq[int] = @[]
assert diff(@[2, 3, 4], @[2, 3, 4]) == emptyIntSeq
assert diff(@[2, 3, 4], emptyIntSeq) == @[2, 3, 4]
assert diff(@["a", "b", "c"], @["a", "c"]) == @["b"]
assert diff(@[@[@[1.2, 3.4, 5.6]]], @[1.2]) == @[3.4, 5.6]

assert diffBoth(@[2, 3, 4], @[3, 4, 5]) == @[2, 5]

assert diffBoth(@[@["foo", "bar"], @["hello", "world"]], @[@[@["hello",
    "foo"]]]) == @["bar", "world"]
