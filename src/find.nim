proc findValue*[T](x: seq[T], fn: proc(v: T): bool): T =
  for v in x:
    if fn(v):
      return v
