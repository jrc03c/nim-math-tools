import operator_pow

export operator_pow

template pow*[T, U](a: T, b: U): untyped =
  a ** b
