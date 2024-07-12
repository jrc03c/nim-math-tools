import nim_math_tools/union
import nim_math_tools/sort
import std/unittest

test "union":
    check union(@[2, 3, 4], @[4, 5, 6]) == @[2, 3, 4, 5, 6]

    check sort(union(@[@[@[5, 3, 1, 2, 4, 6]]], @[@[@[1, 3, 5, 7, 9]]])) == @[1,
            2, 3, 4, 5, 6, 7, 9]

    let empty_int_seq: seq[int] = @[]
    check union(@[2, 3, 4], @[2, 3, 4]) == @[2, 3, 4]
    check union(@[2, 3, 4], empty_int_seq) == @[2, 3, 4]
    check union(@["a", "b", "c"], @["a", "c"]) == @["a", "b", "c"]
    check union(@[@[@[1.2, 3.4, 5.6]]], @[1.2]) == @[1.2, 3.4, 5.6]
