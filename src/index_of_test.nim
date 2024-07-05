import index_of

assert index_of(@[2, 3, 4, 5, 6], 4) == @[2]
assert index_of(@[@[2], @[3, 4], @[5, 6, 7]], 6) == @[2, 1]
assert index_of(@[2, 3, 4, 5, 6], proc(v: int): bool = v > 5) == @[4]
assert index_of(@[@[2], @[3, 4], @[5, 6, 7]], proc(v: int): bool = v > 5) == @[2, 1]
