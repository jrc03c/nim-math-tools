import dropNaNPairwise

assert dropNaNPairwise(@[1.2, 3.4, NaN, 5.6], @[7.8, NaN, 9.10, 11.12]) == (@[
    1.2, 5.6], @[7.8, 11.12])

assert dropNaNPairwise(@[1.2, 3.4], @[5.6, 7.8]) == (@[1.2, 3.4], @[5.6, 7.8])

let emptyFloatSeq: seq[float] = @[]

assert dropNaNPairwise(@[NaN, 1.2, NaN], @[3.4, NaN, 5.6]) == (emptyFloatSeq, emptyFloatSeq)
