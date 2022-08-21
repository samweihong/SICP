# Exercise 1.23

## Timing data

```
Three smallest primes larger than 1000:
1009 *** 1
1013 *** 1
1019 *** 1
Three smallest primes larger than 10000:
10007 *** 1
10009 *** 3
10037 *** 1
Three smallest primes larger than 10^5:
100003 *** 3
100019 *** 3
100043 *** 3
Three smallest primes larger than 10^6:
1000003 *** 10
1000033 *** 10
1000037 *** 10
Three smallest primes larger than 10^7:
10000019 *** 29
10000079 *** 29
10000103 *** 29
Three smallest primes larger than 10^8:
100000007 *** 94
100000037 *** 113
100000039 *** 122
Three smallest primes larger than 10^9:
1000000007 *** 313
1000000009 *** 331
1000000021 *** 296
Three smallest primes larger than 10^10:
10000000019 *** 945
10000000033 *** 921
10000000061 *** 1872
Three smallest primes larger than 10^11:
100000000003 *** 3585
100000000019 *** 2987
100000000057 *** 3062
Three smallest primes larger than 10^12:
1000000000039 *** 10860
1000000000061 *** 10677
1000000000063 *** 9385
Three smallest primes larger than 10^13:
10000000000037 *** 31390
10000000000051 *** 31304
10000000000099 *** 30676
Three smallest primes larger than 10^14:
100000000000031 *** 99445
100000000000067 *** 105909
100000000000097 *** 100150
Three smallest primes larger than 10^15:
1000000000000037 *** 306980
1000000000000091 *** 311309
1000000000000159 *** 306227
```

## Analysis

|     n     | Old Time | New Time | Observed Ratio | Percentage Error |
| :-------: | :------: | :------: | :------------: | :--------------: |
|  $1000$   |    1     |    1     |      1.00      |      50.00%      |
|  $10000$  |    2     |    1     |      2.00      |      0.00%       |
| $10^{5}$  |    6     |    3     |      2.00      |      0.00%       |
| $10^{6}$  |    19    |    10    |      1.90      |      5.00%       |
| $10^{7}$  |    58    |    29    |      2.00      |      0.00%       |
| $10^{8}$  |   183    |   113    |      1.62      |      19.03%      |
| $10^{9}$  |   585    |   313    |      1.87      |      6.55%       |
| $10^{10}$ |   1843   |   945    |      1.95      |      2.50%       |

where

- **old time** is the median time recorded in Exercise 1.22
- **new time** is the median time recorded in Exercise 1.23
- **observed ratio** = $\dfrac{\textnormal{old time}}{\textnormal{new time}}$
- **expected value** = $2$
- **percentage error** = $\left|\dfrac{\textnormal{observed ratio}-2}{2}\right| \times 100\%$

## Conclusion

> Since this modification halves the number of test steps, you should expect it to run about twice as fast. Is this expectation confirmed?

Yes.
