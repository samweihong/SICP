# Exercise 1.15

## a.

> 5 times.

Explanation:

`12.15 -> 4.05 -> 1.35 -> 0.45 -> 0.15 -> 0.05` (less than 0.1).

```scheme
(sine 12.15)
(p (sine 4.05))
(p (p (sine 1.35)))
(p (p (p (sine 0.45))))
(p (p (p (p (sine 0.15)))))
(p (p (p (p (p (sine 0.05))))))
(p (p (p (p (p 0.05)))))
```

Or, by solving $\dfrac{12.05}{3^x} ≤ 0.1$,
where $x$ is the lowest integer that satisfies the equation.

## b.

> Order of growth of space: $\Theta\left(\log\left(n\right)\right)$

Explanation:

The space required is proportional to the height of the tree. \
The height of the tree, $h$ is the minimum integer solution to the equation $\dfrac{a}{3^h} ≤ 0.1$,
which is equivalent to $h ≥ \log_3 (10a)$. \
Thus, $h = \lceil \log_3 (10a) \rceil$. \
Hence, the order of growth of space is **logarithmic**.

> Order of growth of number of steps: $\Theta\left(\log\left(n\right)\right)$

Explanation:

The number of steps required is proportional to the number of nodes in the tree. \
Since each sine procedure (except the last) calls itself once only,
the process is linear recursive where there is no branching. \
Thus, the number of nodes is equal to the height of the tree + 1. \
Hence, the order of growth of number of steps is also **logarithmic**.
