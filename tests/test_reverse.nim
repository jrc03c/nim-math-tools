import nim_math_tools/reverse
import std/unittest

test "reverse":
  check reverse("abcde") == "edcba"
  check reverse(@["a", "b", "c"]) == @["c", "b", "a"]
  check reverse(@[1, 3, 5, 7, 9]) == @[9, 7, 5, 3, 1]
  check reverse(@[@[2.3, 4.5], @[6.7, 8.9]]) == @[@[6.7, 8.9], @[2.3, 4.5]]
