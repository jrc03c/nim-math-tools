# notes

- a design decision that needs to be made: when working with bools, should they be left alone, converted to ints, or converted to floats? right now, for example, the `abs` function converts them to floats, but the `min` function leaves them as bools if they're compared to each other or to ints or floats if compared to those respectively.
- add string addition & multiplication (& maybe subtraction & division?)
- for functions that have a corresponding operator (like `add` and `+`), i think i'll try to put all of the functionality in the operator definitions and then just use the operators in the named functions
