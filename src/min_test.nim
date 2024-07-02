import min

assert min(123.456, 789.012) == 123.456
assert min(-789.012, -123.456) == -789.012
assert min(123.456, 234) == 123.456
assert min(-234, 123.456) == -234

let empty_ints: seq[int] = @[]
let empty_floats: seq[float] = @[]

assert min(empty_ints) == high(int)
assert min(empty_floats) == high(float)

assert min(@[@[@[20, 30, 10]]]) == 10
assert min(@[@[@[-123.456, 123.456]]]) == -123.456
