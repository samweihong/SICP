# Exercise 2.9

> Show that the width of the sum (or difference) of two inter­vals is a function only of the widths of the intervals being added (or subtracted).

Suppose we have two intervals

$$x=\left[ a_{1},b_{1}\right] $$

$$y=\left[ a_{2},b_{2}\right] $$

with widths

$$\textnormal{width}_{x}=\dfrac{b_{1}-a_{1}}{2}$$

$$\textnormal{width}_{y}=\dfrac{b_{2}-a_{2}}{2}$$

The width of the sum of these two intervals

$$x+y=\left[ a_{1}+a_{2},b_{1}+b_{2}\right] $$

is

$$
\begin{aligned}
\textnormal{width}_{x+y}&=\dfrac{\left( b_{1}+b_{2}\right) -\left( a_{1}+a_{2}\right) }{2} \\
&=\dfrac{b_{1}-a_{1}}{2}+\dfrac{b_{2}-a_{2}}{2} \\
&=\textnormal{width}_{x}+\textnormal{width}_{y}
\end{aligned}
$$

Similarly, the width of the difference of these two intervals

$$x-y=\left[ a_{1}-b_{2},b_{1}-a_{2}\right] $$

is

$$
\begin{aligned}
\textnormal{width}_{x-y}&=\dfrac{\left( b_{1}-a_{2}\right) -\left( a_{1}-b_{2}\right) }{2} \\
&=\dfrac{b_{1}-a_{1}}{2}+\dfrac{b_{2}-a_{2}}{2} \\
&=\textnormal{width}_{x}+\textnormal{width}_{y}
\end{aligned}
$$

Hence, the width of both the sum and difference of two inter­vals is the sum of the widths of the intervals being added or subtracted. $\quad \blacksquare$

> Give examples to show that this is not true for multiplication or division.

The product of $\left[ 2,4\right]$ and $\left[ 10,20\right]$ is $\left[ 20,80\right]$, with a width of $1$, $5$, and $30$ respectively. Similarly, the product of $\left[ 2,4\right]$ and $\left[ 100,120\right]$ is $\left[ 200,480\right]$, with a width of $1$, $5$, and $140$ respectively.

Though the factors have the same widths in both cases, each of their products has a different width. Therefore, the width of the product of two intervals cannot be expressed using a function of only the widths of the intervals being multiplied.

The quotient of $\left[ 10,20\right]$ and $\left[ 2,4\right]$ is $\left[ 2.5,10\right]$, with a width of $5$, $1$, and $3.75$ respectively. Similarly, the quotient of $\left[ 100,120\right]$ and $\left[ 2,4\right]$ is $\left[ 25,60\right]$, with a width of $5$, $1$, and $17.5$ respectively.

Though the dividends and divisors have the same widths in both cases, each of their quotients has a different width. Therefore, the width of the quotient of two intervals cannot be expressed using a function of only the widths of the intervals being divided.
