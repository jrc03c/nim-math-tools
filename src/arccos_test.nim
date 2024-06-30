import apply
import arccos
import random
import std/math
import std/sequtils
import std/sugar

assert arccos(0.5) == math.arccos(0.5)
assert arccos(@[-0.5]) == @[math.arccos(-0.5)]

assert arccos(@[-0.25, 0.0, 0.25]) == @[math.arccos(-0.25), math.arccos(0.0),
    math.arccos(0.25)]

assert arccos(@[@[0.12, -0.34], @[0.56, -0.78]]) == @[@[math.arccos(0.12),
    math.arccos(-0.34)], @[math.arccos(0.56), math.arccos(-0.78)]]

let x = random(100)
assert arccos(x) == apply(x, proc(v: float): float = math.arccos(v))
