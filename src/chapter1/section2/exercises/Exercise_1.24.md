# Exercise 1.24

## Timing data

```
Three smallest primes larger than 1000:
1009 *** 64393
1013 *** 67035
1019 *** 70049
Three smallest primes larger than 10000:
10007 *** 80305
10009 *** 79241
10037 *** 81344
Three smallest primes larger than 10^5:
100003 *** 93663
100019 *** 101530
100043 *** 96301
Three smallest primes larger than 10^6:
1000003 *** 106645
1000033 *** 104353
1000037 *** 108532
Three smallest primes larger than 10^7:
10000019 *** 123341
10000079 *** 128918
10000103 *** 130605
Three smallest primes larger than 10^8:
100000007 *** 156517
100000037 *** 154672
100000039 *** 149974
Three smallest primes larger than 10^9:
1000000007 *** 159567
1000000009 *** 157802
1000000021 *** 160232
```

## Analysis

|    n     | Time, $T_{n}$ |
| :------: | :-----------: |
|  $1000$  |     67035     |
| $10000$  |     80305     |
| $10^{5}$ |     96301     |
| $10^{6}$ |    106645     |
| $10^{7}$ |    128918     |
| $10^{8}$ |    154672     |
| $10^{9}$ |    159567     |

where

- **time** is the median time recorded (using `times` as 100000)

## Conclusion

> Since the Fermat test has $\Theta(\log n)$ growth, how would you expect the time to test primes near 1,000,000 to compare with the time needed to test primes near 1000?

It should be twice of the latter.

Since the time required is proportional to $\Theta(\log n)$,

$$
\begin{aligned}
\dfrac{T_{1,000,000}}{T_{1000}}
&= \dfrac{\Theta(\log 1000000)}{\Theta(\log 1000)} \\
&= \dfrac{\Theta(\log 1000^{2})}{\Theta(\log 1000)} \\
&= \dfrac{\Theta(2 \log 1000)}{\Theta(\log 1000)} \\
&= \dfrac{2 \cdot \Theta(\log 1000)}{\Theta(\log 1000)} \\
&= 2
\end{aligned}
$$

> Do your data bear this out?

No. It has a percentage error of 20.5%.

$$
\begin{aligned}
\textnormal{Observed ratio} &= \dfrac{106645}{67035} = 1.59 \\
\textnormal{Percentage error} &= \left|\dfrac{1.59-2}{2}\right| \times 100\% = 20.5\%\end{aligned}
$$

> Can you explain any discrepancy you find?

Since the Fermat test for primes near 1,000,000 uses random numbers, it may choose small numbers (e.g., numbers less than 1000) that take shorter time to evaluate the results.
