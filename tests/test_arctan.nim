import nim_math_tools/apply
import nim_math_tools/arctan
import nim_math_tools/random
import std/math
import std/sequtils
import std/sugar
import std/unittest

test "arctan":
    check arctan(0.5) == math.arctan(0.5)
    check arctan(@[-0.5]) == @[math.arctan(-0.5)]

    check arctan(@[-0.25, 0.0, 0.25]) == @[math.arctan(-0.25), math.arctan(0.0),
        math.arctan(0.25)]

    check arctan(@[@[0.12, -0.34], @[0.56, -0.78]]) == @[@[math.arctan(0.12),
        math.arctan(-0.34)], @[math.arctan(0.56), math.arctan(-0.78)]]

    let x = random(100)
    check arctan(x) == apply(x, proc(v: float): float = math.arctan(v))
