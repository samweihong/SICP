# Exercise 1.13

> Prove that $\textnormal{Fib}(n)$ is the closest integer to $\dfrac{\phi^n}{\sqrt{5}}$, where $\phi = \dfrac{1 + \sqrt{5}}{2}$.

We will first prove that $\textnormal{Fib}(n) = \dfrac{\phi^n - \psi^n}{\sqrt{5}}$, where $\psi = \dfrac{1 - \sqrt{5}}{2}$.

Assume that $\textnormal{Fib}(n)$ is true when $n = k-1$ and $n = k$.
Therefore,
$$\textnormal{Fib}(k-1) = \dfrac{\phi^{k-1} - \psi^{k-1}}{\sqrt{5}}$$
$$\textnormal{Fib}(k) = \dfrac{\phi^k - \psi^k}{\sqrt{5}}$$

Then, we will show that $\textnormal{Fib}(n)$ is true when $n = k+1$.

According to the definition of Fibonacci numbers,

$$
\begin{aligned}
\textnormal{Fib}(k+1) &= \textnormal{Fib}(k) + \textnormal{Fib}(k-1) \\
&= \dfrac{\phi^k - \psi^k}{\sqrt{5}} + \dfrac{\phi^{k-1} - \psi^{k-1}}{\sqrt{5}} \\
&= \dfrac{\phi^k - \psi^k + \dfrac{\phi^k}{\phi} - \dfrac{\psi^k}{\psi}}{\sqrt{5}} \\
&= \dfrac{\dfrac{\phi^{k+1} + \phi^k}{\phi} - \dfrac{\psi^{k+1} + \psi^k}{\psi}}{\sqrt{5}} \\
&= \dfrac{\dfrac{\phi^k (\phi + 1)}{\phi} - \dfrac{\psi^k (\psi + 1)}{\psi}}{\sqrt{5}} \\
&= \dfrac{\dfrac{\phi^k (\phi + 1)\psi - \psi^k (\psi + 1)\phi}{\phi\psi}}{\sqrt{5}} \\
\textnormal{Fib}(k+1) &= \dfrac{\dfrac{\phi^k (\phi\psi + \psi) - \psi^k (\phi\psi + \phi)}{\phi\psi}}{\sqrt{5}}
\end{aligned}
$$

As $\phi\psi = \dfrac{(1 + \sqrt{5})(1 - \sqrt{5})}{4} = \dfrac{1 - 5}{4} = -1$,

$$
\begin{aligned}
\textnormal{Fib}(k+1) &= \dfrac{\dfrac{\phi^k \left(-1 + \dfrac{1 - \sqrt{5}}{2} \right) - \psi^k \left(-1 + \dfrac{1 + \sqrt{5}}{2} \right)}{-1}}{\sqrt{5}} \\
&= \dfrac{\dfrac{\phi^k \left(\dfrac{-2 + 1 - \sqrt{5}}{2} \right) - \psi^k \left(\dfrac{-2 + 1 + \sqrt{5}}{2} \right)}{-1}}{\sqrt{5}} \\
&= \dfrac{\dfrac{\phi^k \left(\dfrac{-1 - \sqrt{5}}{2} \right) - \psi^k \left(\dfrac{-1 + \sqrt{5}}{2} \right)}{-1}}{\sqrt{5}} \\
&= \dfrac{\phi^k \left(\dfrac{1 + \sqrt{5}}{2} \right) - \psi^k \left(\dfrac{1 - \sqrt{5}}{2} \right)}{\sqrt{5}} \\
&= \dfrac{\phi^k \cdot \phi - \psi^k \cdot \psi}{\sqrt{5}} \\
\textnormal{Fib}(k+1) &= \dfrac{\phi^{k+1} - \psi^{k+1}}{\sqrt{5}}
\end{aligned}
$$

Also, $\textnormal{Fib}(n)$ is true when $n = 1$ and $n = 2$.

$$
\begin{aligned}
\textnormal{Fib}(1) &= \dfrac{\phi^1 - \psi^1}{\sqrt{5}} \\
&= \dfrac{\dfrac{1 + \sqrt{5}}{2} - \dfrac{1 - \sqrt{5}}{2}}{\sqrt{5}} \\
&= \dfrac{\dfrac{2\sqrt{5}}{2}}{\sqrt{5}} \\
&= 1
\end{aligned}
$$

$$
\begin{aligned}
\textnormal{Fib}(2) &= \dfrac{\phi^2 - \psi^2}{\sqrt{5}} \\
&= \dfrac{(\phi + \psi)(\phi - \psi)}{\sqrt{5}} \\
&= \dfrac{\left(\dfrac{1 + \sqrt{5}}{2} + \dfrac{1 - \sqrt{5}}{2} \right)\left(\dfrac{1 + \sqrt{5}}{2} - \dfrac{1 - \sqrt{5}}{2} \right)}{\sqrt{5}} \\
&= \dfrac{\dfrac{2}{2} \cdot \dfrac{2\sqrt{5}}{2}}{\sqrt{5}} \\
&= 1
\end{aligned}
$$

Hence, using mathematical induction, $\textnormal{Fib}(n) = \dfrac{\phi^n - \psi^n}{\sqrt{5}}$ for all natural numbers.

Now, to prove $\textnormal{Fib}(n)$ is the closest integer to $\dfrac{\phi^n}{\sqrt{5}}$, that is,

$$
\begin{aligned}
\left| \textnormal{Fib}\left( n\right) -\dfrac{\phi ^{n}}{\sqrt{5}}\right| &<\dfrac{1}{2} \\
\left| \dfrac{\phi^n}{\sqrt{5}} - \dfrac{\psi^n}{\sqrt{5}} -\dfrac{\phi ^{n}}{\sqrt{5}}\right| &<\dfrac{1}{2} \\
\left| \dfrac{\psi ^{n}}{\sqrt{5}}\right|  &<\dfrac{1}{2} \\
\left| \psi ^{n}\right|  &<\dfrac{\sqrt{5}}{2}
\end{aligned}
$$

Since $\left| \psi \right|  <1$,

$$\left| \psi ^{n+1}\right|  <\left| \psi ^{n}\right|$$

Using $\psi <\dfrac{\sqrt{5}}{2}$ and this fact, we can deduce that $\left| \psi ^{n}\right|$ is strictly decreasing.

Thus, $\left| \psi ^{n}\right|  <\dfrac{\sqrt{5}}{2}$ for all integers $n > 0$.

Hence, $\textnormal{Fib}(n)$ is the closest integer to $\dfrac{\phi^n}{\sqrt{5}}$. $\quad \blacksquare$
