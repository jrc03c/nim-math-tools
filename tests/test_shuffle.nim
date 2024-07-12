import nim_math_tools/random
import nim_math_tools/shuffle
import nim_math_tools/sort
import std/unittest

test "shuffle":
  # Technically, it's possible that a shuffled array will end up in its original
  # order. But I'm just hoping that it's unlikely!
  let x = random(1000)
  var xcopy: seq[float] = @[]
  xcopy.add(x)

  check x == xcopy
  check shuffle(x) != x
  check sort(shuffle(x)) == sort(x)

  let y_1 = @[@[2, 3], @[4, 5]]
  let y_2 = shuffle(y_1)

  check (y_2[0] == y_1[0] and y_2[1] == y_1[1]) or (y_2[1] == y_1[0] and y_2[
      0] == y_1[1])
