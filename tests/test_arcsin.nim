import nim_math_tools/apply
import nim_math_tools/arcsin
import nim_math_tools/random
import std/math
import std/sequtils
import std/sugar
import std/unittest

test "arcsin":
    check arcsin(0.5) == math.arcsin(0.5)
    check arcsin(@[-0.5]) == @[math.arcsin(-0.5)]

    check arcsin(@[-0.25, 0.0, 0.25]) == @[math.arcsin(-0.25), math.arcsin(0.0),
        math.arcsin(0.25)]

    check arcsin(@[@[0.12, -0.34], @[0.56, -0.78]]) == @[@[math.arcsin(0.12),
        math.arcsin(-0.34)], @[math.arcsin(0.56), math.arcsin(-0.78)]]

    let x = random(100)
    check arcsin(x) == apply(x, proc(v: float): float = math.arcsin(v))
