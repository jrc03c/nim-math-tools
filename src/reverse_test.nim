import reverse

assert reverse("abcde") == "edcba"
assert reverse(@["a", "b", "c"]) == @["c", "b", "a"]
assert reverse(@[1, 3, 5, 7, 9]) == @[9, 7, 5, 3, 1]
assert reverse(@[@[2.3, 4.5], @[6.7, 8.9]]) == @[@[6.7, 8.9], @[2.3, 4.5]]
