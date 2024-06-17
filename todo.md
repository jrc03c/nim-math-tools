# todo

- convert everything to work with `openArray`s, not just sequences
- add error messages to all assertions

# notes

- a design decision that needs to be made: when working with bools, should they be left alone, converted to ints, or converted to floats? right now, for example, the `abs` function converts them to floats, but the `min` function leaves them as bools if they're compared to each other or to ints or floats if compared to those respectively. **furthermore:** i think i'm tempted to say that if a function _can_ work with a data type, then it _should_ work with a data type. for example, the `ceil` function technically _can_ work on integers (though it doesn't do anything), so it _should_ work on integers. but this is implemented unevenly right now. (the alternative would be to take a minimalist approach and start with only float support for all functions, later adding support for other types as necessary.) one problem with the maximalist approach, though, is that some behavior is undefined. for example, what should be the result of `ceil(false)`? should it be `0.0` or `1.0`? it could be argued either way, i think.
- add string addition & multiplication (& maybe subtraction & division?)
- for functions that have a corresponding operator (like `add` and `+`), i think i'll try to put all of the functionality in the operator definitions and then just use the operators in the named functions
