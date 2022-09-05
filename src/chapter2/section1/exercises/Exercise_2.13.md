# Exercise 2.13

> Show that under the assumption of small percentage tolerances there is a simple formula for the approximate percentage tolerance of the product of two intervals in terms of the tolerances of the factors. You may simplify the problem by assuming that all numbers are positive.

Suppose we have two intervals

$$x=\left[ c_{1}-\dfrac{p_{1} c_{1} }{100}, c_{1}+\dfrac{p_{1} c_{1} }{100}\right] $$

$$y=\left[ c_{2}-\dfrac{p_{2} c_{2} }{100}, c_{2}+\dfrac{p_{2} c_{2} }{100}\right] $$

where $x$ has a center of $c_{1}$ and a tolerance of $p_{1}$, and $y$ has a center of $c_{2}$ and a tolerance of $p_{2}$.

The lower-bound of their product is

$$
\begin{aligned}
&\left( c_{1}-\dfrac{p_{1} c_{1} }{100}\right) \cdot \left(  c_{2}-\dfrac{p_{2} c_{2} }{100}\right) \\
&=c_{1}c_{2}-\dfrac{c_{1}p_{2}c_{2} }{100}-\dfrac{c_{2}p_{1} c_{1} }{100}+\dfrac{p_{1}p_{2} c_{1}c_{2} }{100^{2}} \\
&= c_{1}c_{2} \left( 1-\dfrac{p_{2}}{100}-\dfrac{p_{1}}{100}+\dfrac{p_{1}p_{2}}{100^{2}}\right) \\
&= c_{1}c_{2} \left( 1-\dfrac{p_{1}+p_{2}}{100}+\dfrac{p_{1}p_{2}}{100^{2}}\right)
\end{aligned}
$$

Similarly, the upper-bound of their product is

$$c_{1}c_{2} \left( 1+\dfrac{p_{1}+p_{2}}{100}+\dfrac{p_{1}p_{2}}{100^{2}}\right)$$

Using them, we can calculate its center

$$
\begin{aligned}
&\dfrac{c_{1}c_{2} \left( 1-\dfrac{p_{1}+p_{2}}{100}+\dfrac{p_{1}p_{2}}{100^{2}}\right)+c_{1}c_{2} \left( 1+\dfrac{p_{1}+p_{2}}{100}+\dfrac{p_{1}p_{2}}{100^{2}}\right)}{2} \\
&=c_{1}c_{2}\left( 1+\dfrac{p_{1}p_{2}}{100^{2}}\right)
\end{aligned}
$$

and percentage tolerance

$$
\begin{aligned}
&100\cdot\dfrac{c_{1}c_{2} \left( 1+\dfrac{p_{1}+p_{2}}{100}+\dfrac{p_{1}p_{2}}{100^{2}}\right)-c_{1}c_{2} \left( 1-\dfrac{p_{1}+p_{2}}{100}+\dfrac{p_{1}p_{2}}{100^{2}}\right)}{c_{1}c_{2} \left( 1-\dfrac{p_{1}+p_{2}}{100}+\dfrac{p_{1}p_{2}}{100^{2}}\right)+c_{1}c_{2} \left( 1+\dfrac{p_{1}+p_{2}}{100}+\dfrac{p_{1}p_{2}}{100^{2}}\right)} \\
&=100\cdot \dfrac{2\left( \dfrac{p_{1}+p_{2}}{100}\right) }{2\left( 1+\dfrac{p_{1}p_{2}}{100^{2}}\right) } \\
&=\dfrac{p_{1}+p_{2}}{1+\dfrac{p_{1}p_{2}}{100^{2}}}
\end{aligned}
$$

Assuming the percentage tolerances, $p_{1}$ and $p_{2}$, are small, we have

$$\dfrac{p_{1}p_{2}}{100^{2}}\approx 0$$

Hence, the center of the product is

$$c_{1}c_{2}\left( 1+\dfrac{p_{1}p_{2}}{100^{2}}\right)\approx c_{1}c_{2}\left( 1+0\right)=c_{1}c_{2}$$

that is, the product of the centers of the factors.

Whereas, the tolerance of the product is

$$\dfrac{p_{1}+p_{2}}{1+\dfrac{p_{1}p_{2}}{100^{2}}}\approx\dfrac{p_{1}+p_{2}}{1+0}=p_{1}+p_{2}$$

that is, the sum of the tolerances of the factors. $\quad\blacksquare$
