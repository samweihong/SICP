# Exercise 1.10

$$\begin{aligned}
A(1, 10)
&= A(0, A(1, 9)) \\
&= 2 \cdot A(1, 9) \\
&= 2 \cdot 2 \cdot A(1, 8) \\
&\vdots \\
&= (2^9) \cdot A(1, 1) \\
&= (2^9) \cdot 2 \\
&= 2^{10} \\
&= 1024
\end{aligned}$$

> We can deduce that $A(1, n) = 2^{n}$.

$$\begin{aligned}
A(2, 4)
&= A(1, A(2, 3)) \\
&= A(1, A(1, A(2, 2))) \\
&= A(1, A(1, A(1, A(2, 1)))) \\
&= A(1, A(1, A(1, 2))) \\
&= 2^{A(1, A(1, 2))} \\
&= 2^{2^{A(1, 2)}} \\
&= 2^{2^{2^{2}}} \\
&= 65536
\end{aligned}$$

> We can deduce that $A(2, n) = 2 \uparrow\uparrow n$.

$$\begin{aligned}
A(3, 3)
&= A(2, A(3, 2)) \\
&= A(2, A(2, A(3, 1))) \\
&= A(2, A(2, 2)) \\
&= 2 \uparrow\uparrow A(2, 2) \\
&= 2 \uparrow\uparrow 2 \uparrow\uparrow 2 \\
&= 65536
\end{aligned}$$

> We can deduce that $A(3, n) = 2 \uparrow\uparrow\uparrow n$.

<br />

`(f n)` $= 2n$ \
`(g n)` $= 2^n$ \
`(h n)` $= 2 \uparrow\uparrow n$
