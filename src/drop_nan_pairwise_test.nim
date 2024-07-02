import drop_nan_pairwise

assert drop_nan_pairwise(@[1.2, 3.4, NaN, 5.6], @[7.8, NaN, 9.10, 11.12]) == (@[
    1.2, 5.6], @[7.8, 11.12])

assert drop_nan_pairwise(@[1.2, 3.4], @[5.6, 7.8]) == (@[1.2, 3.4], @[5.6, 7.8])

let empty_float_seq: seq[float] = @[]

assert drop_nan_pairwise(@[NaN, 1.2, NaN], @[3.4, NaN, 5.6]) == (
    empty_float_seq, empty_float_seq)
