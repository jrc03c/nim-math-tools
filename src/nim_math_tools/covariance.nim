import mean

proc covariance*(a: seq[float], b: seq[float]): float =
  assert len(a) == len(b)

  let ma = mean(a)
  let mb = mean(b)
  var temp: float = 0.0

  for i in 0 .. len(a) - 1:
    temp += (a[i] - ma) * (b[i] - mb)

  return temp / float(len(a))


# function covariance(x, y) {
#   try {
#     const mx = mean(x)
#     const my = mean(y)

#     if (!isNumber(mx) || !isNumber(my)) {
#       return NaN
#     }

#     const n = Math.max(x.length, y.length)
#     let out = 0

#     for (let i = 0; i < n; i++) {
#       if (!isNumber(x[i])) return NaN
#       if (!isNumber(y[i])) return NaN
#       out += (x[i] - mx) * (y[i] - my)
#     }

#     return out / x.length
#   } catch (e) {
#     return NaN
#   }
# }

# module.exports = covariance
