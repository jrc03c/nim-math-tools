import std/times

template time*(fn: proc, args: varargs[untyped]): float =
  let start = cpu_time()
  discard fn(args)
  cpu_time() - start
