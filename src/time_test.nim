import time

proc fib(n: int): int =
  if n < 3:
    return 1

  return fib(n - 1) + fib(n - 2)

assert time(fib, 20) < time(fib, 30)
assert time(fib, 20) > time(fib, 10)
