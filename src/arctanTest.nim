import apply
import arctan
import random
import std/math
import std/sequtils
import std/sugar

assert arctan(0.5) == math.arctan(0.5)
assert arctan(@[-0.5]) == @[math.arctan(-0.5)]

assert arctan(@[-0.25, 0.0, 0.25]) == @[math.arctan(-0.25), math.arctan(0.0),
    math.arctan(0.25)]

assert arctan(@[@[0.12, -0.34], @[0.56, -0.78]]) == @[@[math.arctan(0.12),
    math.arctan(-0.34)], @[math.arctan(0.56), math.arctan(-0.78)]]

let x = random(100)
assert arctan(x) == apply(x, proc(v: float): float = math.arctan(v))
