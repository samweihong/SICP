# Exercise 2.43

> Explain why this interchange makes the program run slowly.

In each recursive call, the interchanged program executes the `enumerate-interval` procedure one time and the `queen-cols` procedure `board-size` times. In contrast, the initial program executes the `queen-cols` procedure one time and the `enumerate-interval` procedure the same number of times as the number of positions in the `(queen-cols (- k 1))`. Since the `queen-cols` procedure contains a `safe?` procedure that is more expensive than the `enumerate-interval`, the interchanged program takes a significantly longer duration to complete as it executes the `queen-cols` procedure more often.

> Estimate how long it will take Louis's program to solve the eight-queens puzzle, assuming that the program in exercise 2.42 solves the puzzle in time $T$.

## Number of positions

| `k` | Number of positions in `(queen-cols k)` |
| :-: | :-------------------------------------: |
|  1  |                    8                    |
|  2  |                   42                    |
|  3  |                   140                   |
|  4  |                   344                   |
|  5  |                   568                   |
|  6  |                   550                   |
|  7  |                   312                   |
|  8  |                   92                    |

Assume that the execution time of the `safe?` procedure takes up most of the time in running the `queens` procedure. The initial program runs the `safe?` procedure $8\sum_{k=1}^7{\texttt{(queen-cols }k\texttt{)}} = 15712$ times, while the interchanged program runs it $8\sum_{k=1}^7{8^{8-k}\texttt{(queen-cols }k\texttt{)}} = 34112320$ times. Therefore, it is estimated that Louis's program will solve the puzzle in time $\frac{34112320}{15712}T = 2179.100T$.

## Timing data

```
Initial *** 3494.79

Interchanged *** 5767299.15
```

$$\text{Actual ratio}=\dfrac{5767299.15}{3494.79} = 1650.256$$
$$\text{Percentage error} = \left|\dfrac{1650.256 - 2179.100}{1650.256}\right|\times100\% = 32.05\%$$

Since $n=8$ is small, the assumption that the execution time of the `safe?` procedure takes up most of the completion time of the `queens` procedure does not hold. However, we can notice that the ratios are similar with a percentage error of $32.05\%$.
