# Exercise 2.38

> What are the values of
>
> ```scheme
> (fold-right / 1 (list 1 2 3))
> ```

`3/2` since $\dfrac{1}{\dfrac{1}{\tfrac{2}{3}}}=\dfrac{3}{2}$.

> ```scheme
> (fold-left / 1 (list 1 2 3))
> ```

`1/6` since $\dfrac{\dfrac{\tfrac{1}{1}}{2}}{3}=\dfrac{1}{6}$.

> ```scheme
> (fold-right list nil (list 1 2 3))
> ```

`(1 (2 (3 ())))` since it is equivalent to

```scheme
(list 1 (list 2 (list 3 (list nil))))
```

> ```scheme
> (fold-left list nil (list 1 2 3))
> ```

`(((() 1) 2) 3)` since it is equivalent to

```scheme
(list (list (list (list nil) 1) 2) 3)
```

> Give a property that `op` should satisfy to guarantee that `fold-right` and `fold­-left` will produce the same values for any sequence.

- Associative property.

  That is, the order in which the operations are performed does not affect the result as long as the order of the operands is not changed.

  ```scheme
  (op (op a b) c) = (op a (op b c))
  ```

- Commutative property.

  That is, the order of the operands does not affect the result.

  ```scheme
  (op a identity) = (op identity a)
  ```
