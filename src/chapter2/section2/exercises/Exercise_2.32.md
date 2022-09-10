# Exercise 2.32

> Complete the following definition of a procedure that generates the set of subsets of a set and give a clear explanation of why it works:
>
> ```scheme
> (define (subsets s)
>   (if (null? s)
>       (list nil)
>       (let ((rest (subsets (cdr s))))
>         (append rest (map < ?? > rest)))))
>
> (subsets (list 1 2 3))
> ```

The `< ?? >` is replaced by

```scheme
(map (lambda (set) (cons (car s) set))
     rest)
```

## Explanation

### Equivalent Sets

To explain how it works, we will first show that

> For any element $s$ of the set $S$, the set of all subsets of $S$, $P\left( S\right)$ consists of the same number of subsets that contain $s$ and subsets that don't.

Suppose we have two sets $X$ and $Y$, where $X$ contains all subsets of $S$ that do not contain $s$, and $Y$ contains all subsets of $S$ that contain $s$.

$$X=\lbrace  x| x\in P\left( S\right) \textnormal{ and }s\notin x\rbrace$$

$$Y=\lbrace  y| y\in P\left( S\right) \textnormal{ and }s\in y\rbrace$$

$$\left( X\cup Y=P\left( S\right) \textnormal{ and } X\cap Y=\emptyset \right)$$

Now, we define a function $f:X\rightarrow Y$ where $f\left( x\right) =x\cup \lbrace s\rbrace$.

#### Injective Function

To show $f$ is injective, it is equivalent to show

> If $f\left(a\right) = f\left(b\right)$, then $a = b$.

$$
\begin{aligned}
f\left(a\right) &= f\left(b\right) \\
a\cup \lbrace s\rbrace &= b\cup \lbrace s\rbrace
\end{aligned}
$$

Since each element of $\textnormal{LHS}$ is also an element of $\textnormal{RHS}$, each element of $a$ is also an element of $b$ or $\{x\}$. As $a$ does not contain $s$, the element must be in $b$. Therefore, $a\subseteq b$, and similarly, $b\subseteq a$.

Hence, we have

$$a=b$$

That is, $f$ is injective.

#### Surjective Function

To show $f$ is surjective, it is equivalent to show

> $$\forall y\in Y,\exists x\in X( f\left( x\right) = y)$$

To prove that for any $y\in Y$, there exists $x=y-\lbrace s\rbrace$ such that $f\left( x\right) = y$, we will need to show $x\in X$ and $f\left( x\right) = y$.

Since $y-\lbrace s\rbrace$ is a subset of $y$, and $y$ is a subset of $X$, $y-\lbrace s\rbrace$ is also a subset of $S$. Also, it is obvious that $y-\lbrace s\rbrace$ does not contain $s$.

Hence, according to the definition of $X$, $x=y-\lbrace s\rbrace$ is an element of $X$.

Moreover,

$$f\left( x\right)=f\left( y-\lbrace s\rbrace \right) =\left( y-\lbrace s\rbrace \right) \cup \lbrace s\rbrace =y\cup \lbrace s\rbrace$$

Since $s$ is already an element of $y$, $y\cup \lbrace s\rbrace = y$.

Hence proved that $f$ is surjective.

#### Bijective Function

As $f$ is both injective and surjective, $f$ is a bijective function. Therefore, $X$ and $Y$ have a same number of elements.

### Equal Sets

We proceed to prove that

> The set of all subsets of set $S$ that don't contain $s$ and the set of all subsets of set $S-\lbrace s\rbrace$ are equal, that is,
>
> $$X=P\left( S-\lbrace s\rbrace \right)$$

It is equivalent to show that

$$X\subseteq P\left( S-\lbrace s\rbrace \right) \textnormal{ and } P\left( S-\lbrace s\rbrace \right) \subseteq X$$

By definition of set $X$, each element $x$ of $X$ is a subset of $S$ that does not contain $s$. In other words, each element of $x$ is also an element of $S$. Since $x$ does not contain $s$, $x$ is a subset of $S-\lbrace s\rbrace$. Hence,

$$X\subseteq P\left( S-\lbrace s\rbrace \right)$$

Conversely, it is obvious that $S-\lbrace s\rbrace$ is a subset of $S$ that does not contain $s$. Therefore, according to the definition of $X$,

$$P\left( S-\lbrace s\rbrace \right) \subseteq X$$

Hence proved $X=P\left( S-\lbrace s\rbrace \right)$.

### Conclusion

To obtain the set of all subsets of $S$, we can first obtain the set of all subsets that do not contain $s$, $X$, and the set of all subsets that contain $s$, $Y$, where $s$ is the first element of $S$ (`(car s)`).

Next, we can obtain the set $X$ by computing the set of all subsets of $S-\lbrace s\rbrace$.

```scheme
(let ((rest (subsets (cdr s))))
  < body >)
```

We can then obtain the set $Y$ using the function $f\left( x\right) =x\cup \lbrace s\rbrace$ to map all elements of $X$.

```scheme
(map (lambda (set) (cons (car s) set))
     rest)
```

Finally, we combine both the sets $X$ and $Y$ to obtain the set of all subsets of $S$.

```scheme
(append rest (map (lambda (set) (cons (car s) set))
                  rest))
```

In the `subsets` procedure, we pass `(cdr s)` as the argument of the next recursive call. Thus, the number of elements of `s` decreases in each recursive call such that it eventually reaches the base case. That is, when `s` has no element and its only subset is the empty set (`nil`). Hence, we return `(list nil)` as the set of all subsets of an empty set. $\quad\blacksquare$
