# Exercise 1.22

## Timing data

```
Three smallest primes larger than 1000:
1009 *** 1
1013 *** 1
1019 *** 1
Three smallest primes larger than 10000:
10007 *** 2
10009 *** 4
10037 *** 2
Three smallest primes larger than 10^5:
100003 *** 6
100019 *** 6
100043 *** 6
Three smallest primes larger than 10^6:
1000003 *** 19
1000033 *** 36
1000037 *** 19
Three smallest primes larger than 10^7:
10000019 *** 57
10000079 *** 76
10000103 *** 58
Three smallest primes larger than 10^8:
100000007 *** 182
100000037 *** 191
100000039 *** 183
Three smallest primes larger than 10^9:
1000000007 *** 585
1000000009 *** 593
1000000021 *** 576
Three smallest primes larger than 10^10:
10000000019 *** 1843
10000000033 *** 1748
10000000061 *** 1874
Three smallest primes larger than 10^11:
100000000003 *** 6544
100000000019 *** 6048
100000000057 *** 6207
Three smallest primes larger than 10^12:
1000000000039 *** 18720
1000000000061 *** 18716
1000000000063 *** 19019
Three smallest primes larger than 10^13:
10000000000037 *** 58482
10000000000051 *** 58289
10000000000099 *** 57321
Three smallest primes larger than 10^14:
100000000000031 *** 182969
100000000000067 *** 179601
100000000000097 *** 181803
Three smallest primes larger than 10^15:
1000000000000037 *** 573312
1000000000000091 *** 581938
1000000000000159 *** 565909
```

## Analysis

|     n     | Time, $T_{n}$ | $T_{\tfrac{n}{10}}$ | Observed Ratio | Percentage Error |
| :-------: | :-----------: | :-----------------: | :------------: | :--------------: |
|  $1000$   |       1       |          -          |      1.00      |        -         |
|  $10000$  |       2       |          1          |      2.00      |      36.75%      |
| $10^{5}$  |       6       |          2          |      3.00      |      5.132%      |
| $10^{6}$  |      19       |          6          |      3.17      |      0.139%      |
| $10^{7}$  |      58       |         19          |      3.05      |      3.467%      |
| $10^{8}$  |      183      |         58          |      3.16      |      0.225%      |
| $10^{9}$  |      585      |         183         |      3.20      |      1.089%      |
| $10^{10}$ |     1843      |         585         |      3.15      |      0.375%      |

where

- **time** is the median time recorded
- **observed ratio** = $\dfrac{T_{n}}{T_{\tfrac{n}{10}}}$
- **expected value** = $\sqrt{10} = 3.16$
- **percentage error** = $\left|\dfrac{\textnormal{observed ratio}-\sqrt{10}}{\sqrt{10}}\right| \times 100\%$

## Conclusion

> Since the testing algorithm has order of growth of $\Theta (\sqrt{n})$, you should expect that testing for primes around 10,000 should take about $\sqrt{10}$ times as long as testing for primes around 1000. Do your timing data bear this out?

Yes.

> How well do the data for 100,000 and 1,000,000 support the $\sqrt{n}$ prediction?

It supports very well with percentage error of 0.139%.

> Is your result compatible with the notion that programs on your machine run in time proportional to the number of steps required for the computation?

Yes.
