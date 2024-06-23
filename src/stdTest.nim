import std
import operatorApprox

assert std(@[2.0, 3.0, 4.0]) ~ 0.816496580927726
assert std(@[-15.0, 5.0]) ~ 10.0

let x = @[@[@[-0.897703183200186, -0.8428668619024631, 1.8195396829151167,
    -1.1403736798973996], @[-0.39511048340236765, -0.8275195000433296,
    1.7501668228177834, -0.1758343170165969], @[1.3332674756374794,
    -0.4028416901756511, -1.0694621669785018, 0.5662067975103033]], @[@[
    0.29324803368477653, 0.14648179100519257, -0.17041144022748161,
    -0.1260658238906836], @[0.2999397871154262, 0.8933657738605033,
    -0.8254619185776498, -0.5016171782523109], @[-1.7685454335484285,
    0.018340545058687995, 0.5716757522860385, 1.0964099333435249]]]

assert std(x) ~ 0.914963942318295
assert stdev(x) ~ 0.914963942318295
