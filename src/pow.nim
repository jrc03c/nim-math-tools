import operatorPow

export operatorPow

template pow*[T, U](a: T, b: U): untyped =
  a ** b
