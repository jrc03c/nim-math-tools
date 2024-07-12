import nim_math_tools/shape
import std/unittest

test "shape":
    check shape(new_seq[int]()) == @[0]
    check shape(@[2, 3, 4]) == @[3]
    check shape(@[@[2, 3, 4], @[5, 6, 7]]) == @[2, 3]

    check shape(@[@[@[0, 1, 2, 3], @[4, 5, 6, 7], @[8, 9, 10, 11]], @[@[12, 13,
            14, 15], @[16, 17, 18, 19], @[20, 21, 22, 23]]]) == @[2, 3, 4]
