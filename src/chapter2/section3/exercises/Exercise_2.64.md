# Exercise 2.64

> The following procedure `list->tree` converts an ordered list to a balanced bi­nary tree. The helper procedure `partial-tree` takes as arguments an integer $n$ and list of at least $n$ elements and constructs a balanced tree containing the first $n$ elements of the list. The result returned by `partial-tree` is a pair (formed with `cons`) whose `car` is the constructed tree and whose `cdr` is the list of elements not included in the tree.
>
> ```scheme
> (define (list->tree elements)
>   (car (partial-tree elements (length elements))))
> ```
>
> ```scheme
> (define (partial-tree elts n)
>   (if (= n 0)
>       (cons '() elts)
>       (let ((left-size (quotient (- n 1) 2)))
>         (let ((left-result (partial-tree elts left-size)))
>           (let ((left-tree (car left-result))
>                 (non-left-elts (cdr left-result))
>                 (right-size (- n (+ left-size 1))))
>             (let ((this-entry (car non-left-elts))
>                   (right-result (partial-tree (cdr non-left-elts)
>                                               right-size)))
>               (let ((right-tree (car right-result))
>                     (remaining-elts (cdr right-result)))
>                 (cons (make-tree this-entry left-tree right-tree)
>                       remaining-elts))))))))
> ```

## a.

> Write a short paragraph explaining as clearly as you can how `partial-tree` works. Draw the tree produced by `list->tree` for the list `(1 3 5 7 9 11)`.

For each element, the `partial-tree` divides the input list into left and right subtrees and join them with the node containing the element. It first calculates the size of the left subtree as $\lfloor\frac{n-1}{2}\rfloor$ and builds the left subtree using `(partial-tree elts left-size)`. The first unused element from the remaining list becomes the root node of the current tree, whereas the rest of the elements are used to construct the right subtree with size $n-\texttt{left-size}-1$. Finally, the current node is joined with the left and right subtrees to form the complete tree, which is returend along with the unused elements.

```
    5
  /   \
1       9
 \     / \
  3   7   11
```

## b.

> What is the order of growth in the number of steps required by `list->tree` to convert a list of n elements?

$\Theta(n)$ growth. In each recursive step, it constructs the left and right subtrees and joins them with the current node, taking a constant number of steps. Therefore, the number of recursive calls is proportional to the number of nodes in the tree.
