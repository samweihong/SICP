# Exercise 1.25

## Timing data

```
expmod1 (using normal way) 10 10 3 1 *** 5
expmod2 (using fast-expt)  10 10 3 1 *** 6

expmod1 (using normal way) 10 10 7 4 *** 3
expmod2 (using fast-expt)  10 10 7 4 *** 3

expmod1 (using normal way) 100 100 3 1 *** 3
expmod2 (using fast-expt)  100 100 3 1 *** 8

expmod1 (using normal way) 100 100 7 2 *** 3
expmod2 (using fast-expt)  100 100 7 2 *** 10

expmod1 (using normal way) 1000 1000 3 1 *** 3
expmod2 (using fast-expt)  1000 1000 3 1 *** 53

expmod1 (using normal way) 1000 1000 7 1 *** 2
expmod2 (using fast-expt)  1000 1000 7 1 *** 46

expmod1 (using normal way) 10000 10000 3 1 *** 3
expmod2 (using fast-expt)  10000 10000 3 1 *** 13266

expmod1 (using normal way) 10000 10000 7 4 *** 5
expmod2 (using fast-expt)  10000 10000 7 4 *** 2294

expmod1 (using normal way) 100000 100000 3 1 *** 4
expmod2 (using fast-expt)  100000 100000 3 1 *** 104734

expmod1 (using normal way) 100000 100000 7 2 *** 4
expmod2 (using fast-expt)  100000 100000 7 2 *** 78557

expmod1 (using normal way) 1000000 1000000 3 1 *** 9
expmod2 (using fast-expt)  1000000 1000000 3 1 *** 2801587

expmod1 (using normal way) 1000000 1000000 7 1 *** 5
expmod2 (using fast-expt)  1000000 1000000 7 1 *** 2774500
```

## Conclusion

> Is she correct?

No. Although both the procedures yield the same results, the one using `fast-expt` takes a considerably longer time for large numbers.

The procedure using the normal way computes the final result using multiple primitive operations on relatively small numbers. This is because the operands of the multiplication operations are modulo by `m`.

On the other hand, the procedure using `fast-expt` computes the final result by first computing the exact result of $\textnormal{base}^{\textnormal{exp}}$, and only then modulo by `m`. These processes involve primitive operations on very large numbers that take a significantly longer time to process.

> Would this procedure serve as well for our fast prime tester? Explain.

No. Our fast prime tester involves computation on large numbers. Therefore, this procedure is inefficient as it requires a much longer time.
