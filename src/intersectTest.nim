import intersect
import sort

assert intersect(@[2, 3, 4], @[4, 5, 6]) == @[4]

assert sort(intersect(@[@[@[5, 3, 1, 2, 4, 6]]], @[@[@[1, 3, 5, 7, 9]]])) == @[
    1, 3, 5]

let emptyIntSeq: seq[int] = @[]
assert intersect(@[2, 3, 4], @[2, 3, 4]) == @[2, 3, 4]
assert intersect(@[2, 3, 4], emptyIntSeq) == emptyIntSeq
assert intersect(@["a", "b", "c"], @["a", "c"]) == @["a", "c"]
assert intersect(@[@[@[1.2, 3.4, 5.6]]], @[1.2]) == @[1.2]
