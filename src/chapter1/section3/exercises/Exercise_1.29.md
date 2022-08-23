# Exercise 1.29

## Results

### Cube between 0 and 1

|    Integral    |  dx   |  n   |       Result        | Percentage Error |
| :------------: | :---: | :--: | :-----------------: | :--------------: |
|    Default     | 0.01  |  -   | 0.24998750000000042 |      0.005%      |
|    Default     | 0.001 |  -   |  0.249999875000001  |     0.00005%     |
| Simpson's Rule |   -   | 100  |        0.25         |        0%        |
| Simpson's Rule |   -   | 1000 |        0.25         |        0%        |

where

- **expected value** = $\dfrac{1}{4}$ = $0.25$
- **percentage error** = $\left|\dfrac{\textnormal{result}-0.25}{0.25}\right| \times 100\%$

## Conclusion

The results of the integral using Simpson's Rule are more accurate.
