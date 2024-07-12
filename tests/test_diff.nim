import nim_math_tools/diff
import nim_math_tools/sort
import std/unittest

test "diff":
    check diff(@[2, 3, 4], @[4, 5, 6]) == @[2, 3]

    check sort(diff(@[@[@[5, 3, 1, 2, 4, 6]]], @[@[@[1, 3, 5, 7, 9]]])) == @[2,
            4, 6]

    let empty_int_seq: seq[int] = @[]
    check diff(@[2, 3, 4], @[2, 3, 4]) == empty_int_seq
    check diff(@[2, 3, 4], empty_int_seq) == @[2, 3, 4]
    check diff(@["a", "b", "c"], @["a", "c"]) == @["b"]
    check diff(@[@[@[1.2, 3.4, 5.6]]], @[1.2]) == @[3.4, 5.6]

    check diff_both(@[2, 3, 4], @[3, 4, 5]) == @[2, 5]

    check diff_both(@[@["foo", "bar"], @["hello", "world"]], @[@[@["hello",
            "foo"]]]) == @["bar", "world"]
