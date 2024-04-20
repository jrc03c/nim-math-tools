import std/lenientops
import std/math
import std/sequtils
import std/strutils
import std/sugar

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
  ## Multiplies each value in sequence `a` by `b` and returns the resulting sequence. Sequences can be arbitrarily nested. For example:
  ##
  ## ```
  ## @[2, 3, 4] * 5
  ## # @[10, 15, 20]
  ##
  ## @["ab", "cd", "ef"] * 2
  ## # @["abab", "cdcd", "efef]
  ##
  ## @[@[@[-10, -20, -30]]] * -40
  ## # @[@[@[400, 800, 1200]]]
  ## ```

  return a.map(v => v * b)

proc `*`*[T](a: int, b: seq[T]): seq[T] =
  ## Multiplies each value in sequence `b` by `a` and returns the resulting sequence. Sequences can be arbitrarily nested. For example:
  ##
  ## ```
  ## 5 * @[2, 3, 4]
  ## # @[10, 15, 20]
  ##
  ## 2 * @["ab", "cd", "ef"]
  ## # @["abab", "cdcd", "efef]
  ##
  ## -40 * @[@[@[-10, -20, -30]]]
  ## # @[@[@[400, 800, 1200]]]
  ## ```

  return b.map(v => v * a)

proc `*`*[T](a: seq[T], b: seq[T]): seq[T] =
  ## Multiplies sequences `a` and `b` element-wise and returns the resulting sequence. For example:
  ##
  ## ```
  ## @[2, 3, 4] * @[5, 6, 7]
  ## # @[10, 18, 28]
  ## ```
  ##
  ## Both sequences must have the same length, though they do not necessarily need to have the same *shape*. For example, a 3×2 nested sequence can be multiplied by a 1-dimensional sequence of length 3:
  ##
  ## ```
  ## let a: seq[seq[int]] = @[@[1, 2], @[3, 4], @[5, 6]]
  ## let b: seq[int] = @[7, 8, 9]
  ## echo a * b
  ## # @[@[7, 14], @[24, 32], @[45, 54]]
  ## ```
  ##
  ## This example works because this library provides the ability to multiply (e.g.) a sequence of integers by another integer; so each of the three inner sequences in `a` can be multiplied element-wise by each of the three integers in `b`.

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

proc `-`*(a: string): string =
  ## Returns a reversed copy of string `a`. For example:
  ##
  ## ```
  ## -"abc"
  ## # "cba"
  ## ```

  return reverseString(a)

proc `-`*[T](a: seq[T]): seq[T] =
  ## Multiplies each value in sequence `a` by -1 and returns the resulting array.
  ##
  ## **NOTE:** The minus sign must not appear immediately before the "@" symbol preceding a sequence literal expression, even when separated by whitespace! For example, both `-@[2, 3, 4]` and `- @[2, 3, 4]` are invalid according to the compiler. Instead, wrap the literal in parentheses and then place the minus sign on the outside, or store the sequence in a variable and then prepend the minus sign to the variable name. For example, these expressions are valid:
  ##
  ## ```
  ## -(@[2, 3, 4])
  ## # @[-2, -3, -4]
  ##
  ## let x = @[10, 20, 30]
  ## -x
  ## # @[-10, -20, -30]
  ## ```

  return a.map(v => v * -1)

proc `*=`*[T, S](a: var T, b: S) =
  ## Multiplies `a` by `b` and stores the result back into `a`. For example:
  ##
  ## ```
  ## var a = "abc!"
  ## a *= 3
  ## echo a
  ## # "abc!abc!abc!"
  ## ```

  a = a * b

proc `*=`*[T, S](a: var seq[T], b: S) =
  ## Multiplies each value in sequence `a` by `b` and stores the resulting sequence back into `a`. For example:
  ##
  ## ```
  ## var a = @[2, 3, 4]
  ## a *= 10
  ## echo a
  ## # @[20, 30, 40]
  ## ```

  a = a.map(v => v * b)

proc `*=`*[T, S](a: var seq[T], b: seq[S]) =
  ## Multiplies sequences `a` and `b` element-wise and stores the resulting sequence back into `a`. For example:
  ##
  ## ```
  ## var a = @[2, 3, 4]
  ## var b = @[5, 6, 7]
  ## a *= b
  ## echo a
  ## # @[10, 18, 28]
  ## ```

  for i, v in b:
    a[i] = a[i] * v
