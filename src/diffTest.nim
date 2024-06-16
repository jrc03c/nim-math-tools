import diff
import sort

assert diff(@[2, 3, 4], @[4, 5, 6]) == @[2, 3]

assert sort(diff(@[@[@[5, 3, 1, 2, 4, 6]]], @[@[@[1, 3, 5, 7, 9]]])) == @[2, 4, 6]
