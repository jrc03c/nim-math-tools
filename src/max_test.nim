import max

assert max(123.456, 789.012) == 789.012
assert max(-789.012, -123.456) == -123.456
assert max(123.456, 234) == 234
assert max(-234, 123.456) == 123.456

let empty_ints: seq[int] = @[]
let empty_floats: seq[float] = @[]

assert max(empty_ints) == low(int)
assert max(empty_floats) == low(float)

assert max(@[@[@[20, 30, 10]]]) == 30
assert max(@[@[@[-123.456, 123.456]]]) == 123.456
