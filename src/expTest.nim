import exp
import math
import operatorApprox
import std/sequtils
import std/sugar

assert exp(1.2) == math.exp(1.2)
assert exp(@[1.2, 3.4, 5.6]) == (@[1.2, 3.4, 5.6]).map(v => math.exp(v))

let x = @[@[1.184147366120706, 0.7842148016228108, -0.766598470070492,
    2.0789239010128417, -0.5886539336721325], @[-0.005464901242778314,
    -0.5703489194694459, -0.6730319915224245, -0.6726789910259676,
    -1.4463430761483265], @[0.7316417486459098, -0.7084193417798565,
    0.8083225813830779, -0.5461269072032513, 0.4946079969090505], @[
    0.8164012550009336, 0.7237280264271926, 0.14050952156016466,
    -1.182071685674371, -0.09578667614186162], @[1.0578662835032702,
    0.5911119652787072, -0.23804143089188662, 1.1039682701011957,
    -0.8847163866963224]]

let yTrue = @[@[3.267899311604956, 2.190686142033798, 0.4645907027851268,
    7.995859946286574, 0.5550739484438054], @[0.9945500041654628,
    0.5653281502843941, 0.5101594314028645, 0.5103395497244799,
    0.2354296641539183], @[2.078490166505396, 0.49242193340849705,
    2.244140464709636, 0.5791887234954871, 1.6398552847049164], @[
    2.262343572558222, 2.062106486145952, 1.1508600374957676,
    0.3066428125871823, 0.9086578337898308], @[2.880218857658918,
    1.8059955035783453, 0.788170035829764, 3.0161110510301805,
    0.41283124110942027]]

let yPred = exp(x)
assert yPred ~ yTrue
