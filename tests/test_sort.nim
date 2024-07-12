import nim_math_tools/sort
import std/unittest

test "sort":
    check sort(@[2, 3, 4]) == @[2, 3, 4]
    check sort(@[-4.5, -2.3, -6.7]) == @[-6.7, -4.5, -2.3]

    check sort(@[-4.5, -2.3, -6.7], proc(a: float, b: float): int = return int(
            b - a)) == @[-2.3, -4.5, -6.7]

    check sort(@[@[2, 3, 4, 5], @[6, 7], @[8], @[9, 10, 11]], proc(a: seq[int],
            b: seq[int]): int = return len(a) - len(b)) == @[@[8], @[6, 7], @[9,
            10, 11], @[2, 3, 4, 5]]
