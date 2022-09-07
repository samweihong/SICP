# Exercise 2.22

> ```scheme
> (define (square-list items)
>   (define (iter things answer)
>     (if (null? things)
>         answer
>         (iter (cdr things)
>               (cons (square (car things))
>                     answer))))
>   (iter items nil))
> ```
>
> Unfortunately, defining `square-list` this way produces the answer list in the reverse order of the one desired. Why?

The `square-list` prepends the square of the first item in `things` before the result from the previous iteration. Thus, the squares of items further down in `items` are always in front of those further up. Hence, the answer list is in reverse order.

> ```scheme
> (define (square-list items)
>   (define (iter things answer)
>     (if (null? things)
>         answer
>         (iter (cdr things)
>               (cons answer
>                     (square (car things))))))
>   (iter items nil))
> ```
>
> This doesn't work either. Explain.

The modified `square-list` produces the following output.

```
((((() . 1) . 4) . 9) . 16)
```

Though the squares are in the desired order, the structure is not. This is because `cons` stores the two items in a pair rather than combining them.
