# Exercise 1.26

> "By writing the procedure like that, you have transformed the $\Theta(\log n)$ process into a $\Theta(n)$ process." Explain.

As the interpreter first evaluates the subexpressions, it will evaluate the `expmod` twice in each recursive call (if `exp` is even).

Since there are about $\log_{2} n$ recursive calls,

$$
\Theta \left(\underbrace {2\times 2\times \dots \times 2\times 2} _{\log_{2} n {\textnormal{ times}}} \right)
$$

$$
\begin{aligned}
&= \Theta \left( 2^{\log_{2} n }\right) \\
&= \Theta \left( n \right)
\end{aligned}
$$

The process is now a $\Theta(n)$ process.
