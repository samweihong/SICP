# Exercise 1.19

> Given
>
> $$
> T_{pq} =
> \begin{cases}
> a' = bq + aq + ap \\
> b' = bp + aq
> \end{cases}
> $$
>
> show that $T_{pq}^2 = T_{p'q'}$.

$$
T_{pq}^2 =
\begin{cases}
a'' = b'q + a'q + a'p \\
b'' = b'q + a'q
\end{cases}
$$

$$
\begin{aligned}
a''
&= (bp + aq)q + (bq + aq + ap)q + (bq + aq + ap)p \\
&= bpq + aq^2 + bq^2 + aq^2 + apq + bpq + apq + ap^2 \\
&= 2bpq + 2aq^2 + bq^2 + 2apq + ap^2 \\
&= b(q^2 + 2pq) + a(q^2 + 2pq) + a(p^2 + q^2) \\
\\
b''
&= (bp + aq)p + (bq + aq + ap)q \\
&= bp^2 + apq + bq^2 + aq^2 + apq \\
&= bp^2 + 2apq + bq^2 + aq^2 \\
&= b(p^2 + q^2) + a(q^2 + 2pq)
\end{aligned}
$$

Therefore, it is obvious that $p' = p^2 + q^2$ and $q' = q^2 + 2pq$.
