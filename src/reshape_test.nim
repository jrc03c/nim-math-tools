import normal
import reshape
import shape

let a = normal(100)
let b = reshape(a, @[2, 5, 10])
assert shape(b) == @[2, 5, 10]

let c = normal(@[2, 3, 4, 5])
let d = reshape(c, @[5, 4, 3, 2])
let e = reshape(c, @[2 * 3 * 4 * 5])
assert shape(d) == @[5, 4, 3, 2]
assert shape(e) == @[2 * 3 * 4 * 5]
