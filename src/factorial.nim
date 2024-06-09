proc factorial*(n: int): int =
  var temp: int = 1

  for i in 2 .. n:
    temp *= i

  return temp

proc factorial*(n: float): float =
  return float(factorial(int(n)))
