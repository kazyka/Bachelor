from random import shuffle, seed
import numpy as np
import math


def mean(x):
    return sum(x) / (len(x) * 1.0)


def median(x):
    n = len(x)
    sorted_x = sorted(x)
    midpoint = n // 2

    if n % 2 == 1:
        return sorted_x[midpoint]
    else:
        lo = midpoint - 1
        hi = midpoint
        return (sorted_x[lo] + sorted_x[hi]) / 2
