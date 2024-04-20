import std/lenientops
import std/math
import std/sequtils
import std/strutils
import std/sugar

# multiply strings and numbers

proc reverseString(s: string): string =
  var temp = ""
  let sLen = len(s)

  for i in 0..sLen-1:
    temp = temp & s[sLen - 1 - i]

  return temp

proc `*`*(a: int, b: string): string =
  ## "Multiplies" an integer by a string, returning `a` concatenated copies of string `b`. If `a` is negative, then the resulting string will be reversed. For example:
  ##
  ## ```
  ## 3 * "abc!" # "abc!abc!abc!"
  ## -3 * "abc!" # "!cba!cba!cba"
  ## ```

  if a < 0:
    return reverseString(-a * b)

  var temp = ""

  for i in 0..a-1:
    temp = temp & b

  return temp

proc `*`*(a: string, b: int): string =
  ## "Multiplies" a string by an integer, returning `b` concatenated copies of string `a`. If `b` is negative, then the resulting string will be reversed. For example:
  ##
  ## ```
  ## "abc!" * 3 # "abc!abc!abc!"
  ## "abc!" * -3 # "!cba!cba!cba"
  ## ```

  if b < 0:
    return reverseString(a * -b)

  var temp = ""

  for i in 0..b-1:
    temp = temp & a

  return temp

proc `*`*(a: float, b: string): string =
  ## "Multiplies" a float by a string, returning `a` concatenated copies of string `b`. Since `a` is a float value, a partial copy of `b` may be added to the end of the output. If `a` is negative, then the resulting string will be reversed. For example:
  ##
  ## ```
  ## 2.5 * "12345|" # "12345|12345|123"
  ## -2.5 * "12345|" # "321|54321|54321"
  ## 0.25 * "abcdefghijkl" # "abc"
  ## -0.25 * "abcdefghijkl" # "cba"
  ## ```

  if a < 0:
    return reverseString(-a * b)

  elif a == 0:
    return ""

  else:
    let aInt = toInt(floor(a))
    return aInt * b & b[0..toInt(floor((a - aInt) * len(b)))-1]

proc `*`*(a: string, b: float): string =
  ## "Multiplies" a float by a string, returning `b` concatenated copies of string `a`. Since `b` is a float value, a partial copy of `a` may be added to the end of the output. If `b` is negative, then the resulting string will be reversed. For example:
  ##
  ## ```
  ## "12345|" * 2.5 # "12345|12345|123"
  ## "12345|" * 2.5 # "321|54321|54321"
  ## "abcdefghijkl" * 0.25 # "abc"
  ## "abcdefghijkl" * -0.25 # "cba"
  ## ```

  if b < 0:
    return reverseString(a * -b)

  elif b == 0:
    return ""

  else:
    let bInt = toInt(floor(b))
    return bInt * a & a[0..toInt(floor((b - bInt) * len(a)))-1]

# multiply sequences and numbers

proc `*`*[T](a: seq[T], b: float): seq[T] =
  ## Multiplies each value in sequence `a` by `b` and returns the resulting sequence. Sequences can be arbitrarily nested. For example:
  ##
  ## ```
  ## @[2, 3, 4] * 5.6
  ## # @[11.2, 16.8, 22.4]
  ##
  ## @["ab", "cd", "ef"] * 1.5
  ## # @["aba", "cdc", "efe"]
  ##
  ## @[@[@[-10, -20, -30]]] * -40.5
  ## # @[@[@[405, 810, 1215]]]
  ## ```

  return a.map(v => v * b)

proc `*`*[T](a: float, b: seq[T]): seq[T] =
  ## Multiplies each value in sequence `b` by `a` and returns the resulting sequence. Sequences can be arbitrarily nested. For example:
  ##
  ## ```
  ## 5.6 * @[2, 3, 4]
  ## # @[11.2, 16.8, 22.4]
  ##
  ## 1.5 * @["ab", "cd", "ef"]
  ## # @["aba", "cdc", "efe"]
  ##
  ## -40.5 * @[@[@[-10, -20, -30]]]
  ## # @[@[@[405, 810, 1215]]]
  ## ```

  return b.map(v => v * a)

proc `*`*[T](a: seq[T], b: int): seq[T] =
  return a.map(v => v * b)

proc `*`*[T](a: int, b: seq[T]): seq[T] =
  return b.map(v => v * a)

# multiply sequences and sequences

proc `*`*[T](a: seq[T], b: seq[T]): seq[T] =
  if len(a) != len(b):
    raise newException(
      Exception,
      "Sequences of different lengths cannot be multiplied together! ($# vs. $#)" %
        [$len(a), $len(b)]
    )

  var temp: seq[T] = @[]

  for i, v in a:
    temp.add(v * b[i])

  return temp

# apply the unary `-` operator to strings

proc `-`*(a: string): string =
  return reverseString(a)

# apply the unary `-` operator to sequences
#
# note: when applying the `-` operator to sequences, it can't be written
# immediately before the `@` symbol, even if separated by whitespace; so these
# examples are invalid:
#
# `echo -@[2, 3, 4]`
# `echo - @[2, 3, 4]`
#
# however, it will work correctly if either (1) the sequence is enclosed in
# quotation marks or (2) the sequence is referenced as a variable name; so these
# examples are valid:
#
# `echo -(@[2, 3, 4])
# `var x = @[2, 3, 4]`
# `echo -x`

proc `-`*[T](a: seq[T]): seq[T] =
  return a.map(v => v * -1)

# create the `*=` operator

proc `*=`*[T, S](a: var T, b: S) =
  a = a * b

proc `*=`*[T, S](a: var seq[T], b: S) =
  a = a.map(v => v * b)

proc `*=`*[T, S](a: var seq[T], b: seq[S]) =
  for i, v in b:
    a[i] = a[i] * v
