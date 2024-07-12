import nim_math_tools/time
import std/unittest

test "time":
  proc fib(n: int): int =
    if n < 3:
      return 1

    return fib(n - 1) + fib(n - 2)

  check time(fib, 20) < time(fib, 30)
  check time(fib, 20) > time(fib, 10)
