import random
import shuffle
import sort

# Technically, it's possible that a shuffled array will end up in its original
# order. But I'm just hoping that it's unlikely!
let x = random(1000)
var xcopy: seq[float] = @[]
xcopy.add(x)

assert x == xcopy
assert shuffle(x) != x
assert sort(shuffle(x)) == sort(x)

let y_1 = @[@[2, 3], @[4, 5]]
let y_2 = shuffle(y_1)

assert (y_2[0] == y_1[0] and y_2[1] == y_1[1]) or (y_2[1] == y_1[0] and y_2[0] == y_1[1])
