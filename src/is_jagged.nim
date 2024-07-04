proc is_jagged*[T](x: seq[T]): bool =
  when T is seq:
    for i in 0 .. len(x) - 2:
      if len(x[i]) != len(x[i + 1]):
        return true

      if is_jagged(x[i]):
        return true

    if is_jagged(x[len(x) - 1]):
      return true

    return false

  else:
    return false
