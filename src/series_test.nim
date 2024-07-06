import operator_approx
import series

let a = Series[float](index: @["a", "b", "c", "d", "e"], name: "A", values: @[
    1.2, 3.4, 5.6, NaN, 9.10])

let b = Series[float](index: @["row1", "row2", "row3"], name: "B", values: @[
    100.0, 200.0, 300.0])

let c = a.append(b)
assert c.index == @["a", "b", "c", "d", "e", "row1", "row2", "row3"]
assert c.name == "A"
assert c.values ~ @[1.2, 3.4, 5.6, NaN, 9.10, 100.0, 200.0, 300.0]

let d = a.apply(proc(v: float): float = v * v)
assert d.index == a.index
assert d.name == a.name
assert d.values ~ @[1.44, 11.56, 31.36, NaN, 82.81]

assert a.dtype is float

let e = a.filter(proc(v: float): bool = v > 4.0)
assert e.index == @["c", "e"]
assert e.name == "A"
assert e.values ~ @[5.6, 9.10]

let f = a.drop_nan()
assert f.index == @["a", "b", "c", "e"]
assert f.name == "A"
assert f.values ~ @[1.2, 3.4, 5.6, 9.10]

let g = a.get(@["e", "c", "a", "b", "d"])
assert g.index == @["e", "c", "a", "b", "d"]
assert g.name == "A"
assert g.values ~ @[9.10, 5.6, 1.2, 3.4, NaN]

let h = a.get(@[4, 3, 2, 1, 0])
assert h.index == @["e", "d", "c", "b", "a"]
assert h.name == "A"
assert h.values ~ @[9.10, NaN, 5.6, 3.4, 1.2]

let i = a[@["e", "c", "a", "b", "d"]]
assert i.index == g.index
assert i.name == g.name
assert i.values ~ g.values

let j = a[@[4, 3, 2, 1, 0]]
assert j.index == h.index
assert j.name == h.name
assert j.values ~ h.values

assert j.sort_by_index().index == a.index
assert j.sort_by_value().values ~ @[1.2, 3.4, 5.6, 9.10, NaN]
assert j.sort().values ~ @[1.2, 3.4, 5.6, 9.10, NaN]

assert j.drop_nan().sort(proc(a, b: float): int = int(b - a)).values ~ @[9.10,
    5.6, 3.4, 1.2]

