import nim_math_tools/intersect
import nim_math_tools/sort
import std/unittest

test "intersect":
    check intersect(@[2, 3, 4], @[4, 5, 6]) == @[4]

    check sort(intersect(@[@[@[5, 3, 1, 2, 4, 6]]], @[@[@[1, 3, 5, 7, 9]]])) ==
            @[1, 3, 5]

    let empty_int_seq: seq[int] = @[]
    check intersect(@[2, 3, 4], @[2, 3, 4]) == @[2, 3, 4]
    check intersect(@[2, 3, 4], empty_int_seq) == empty_int_seq
    check intersect(@["a", "b", "c"], @["a", "c"]) == @["a", "c"]
    check intersect(@[@[@[1.2, 3.4, 5.6]]], @[1.2]) == @[1.2]
