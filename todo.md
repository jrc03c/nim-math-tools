# todo

- convert everything to work with `openArray`s, not just sequences
- add error messages to all assertions

# notes

- a design decision that needs to be made: when working with bools, should they be left alone, converted to ints, or converted to floats? right now, for example, the `abs` function converts them to floats, but the `min` function leaves them as bools if they're compared to each other or to ints or floats if compared to those respectively.
