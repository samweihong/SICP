# Exercise 2.53

> What would the interpreter print in response to evaluating each of the following expressions?

> ```scheme
> (list 'a 'b 'c)
> ```

`(a b c)`

> ```scheme
> (list (list 'george))
> ```

`((george))`

> ```scheme
> (cdr '((xl x2) (yl y2)))
> ```

`((y1 y2))`

> ```scheme
> (cadr '((xl x2) (yl y2)))
> ```

`(y1 y2)`

> ```scheme
> (pair? (car '(a short list)))
> ```

`#f`

> ```scheme
> (memq 'red '((red shoes) (blue socks)))
> ```

`#f`

> ```scheme
> (memq 'red '(red shoes blue socks))
> ```

`(red shoes blue socks)`
