import flatten
import ndarray
import product

export flatten
export ndarray

template reshape*[T](x: seq[T], new_shape: seq[int]): untyped =
  when T is seq:
    reshape(flatten(x), new_shape)

  else:
    when len(new_shape) <= 1:
      x

    elif len(new_shape) == 2:
      var temp: seq[seq[T]] = @[]
      let step = int(len(x) / new_shape[0])

      for i in 0 .. new_shape[0] - 1:
        temp.add(x[i * step .. (i + 1) * step - 1])

      temp

    else:
      var temp: seq[typeof(ndarray(new_shape[1..^1], T))] = @[]
      let step = int(len(x) / new_shape[0])

      for i in 0 .. new_shape[0] - 1:
        temp.add(reshape(x[i * step .. (i + 1) * step - 1], new_shape[1..^1]))

      temp
