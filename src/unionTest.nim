import union
import sort

assert union(@[2, 3, 4], @[4, 5, 6]) == @[2, 3, 4, 5, 6]

assert sort(union(@[@[@[5, 3, 1, 2, 4, 6]]], @[@[@[1, 3, 5, 7, 9]]])) == @[
    1, 2, 3, 4, 5, 6, 7, 9]

let emptyIntSeq: seq[int] = @[]
assert union(@[2, 3, 4], @[2, 3, 4]) == @[2, 3, 4]
assert union(@[2, 3, 4], emptyIntSeq) == @[2, 3, 4]
assert union(@["a", "b", "c"], @["a", "c"]) == @["a", "b", "c"]
assert union(@[@[@[1.2, 3.4, 5.6]]], @[1.2]) == @[1.2, 3.4, 5.6]
