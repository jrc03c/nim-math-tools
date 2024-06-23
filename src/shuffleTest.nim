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

let y1 = @[@[2, 3], @[4, 5]]
let y2 = shuffle(y1)

assert (y2[0] == y1[0] and y2[1] == y1[1]) or (y2[1] == y1[0] and y2[0] == y1[1])
