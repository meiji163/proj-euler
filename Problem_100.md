>If a box contains twenty-one coloured discs, composed of fifteen blue discs and six red discs, and two discs were taken at random, it can be seen that the probability of taking two blue discs, P(BB) = (15/21)×(14/20) = 1/2.
>The next such arrangement, for which there is exactly 50% chance of taking two blue discs at random, is a box containing eighty-five blue discs and thirty-five red discs.
>By finding the first arrangement to contain over 10<sup>12</sup> = 1,000,000,000,000 discs in total, determine the number of blue discs that the box would contain.

If n is the total number of discs and m is the number of blue discs, we must solve <br>
<a href="https://www.codecogs.com/eqnedit.php?latex=\dfrac{m}{n}\cdot&space;\dfrac{m-1}{n-1}=\dfrac{1}{2}&space;\iff&space;2m^2-2&space;=&space;n^2&space;-n" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\dfrac{m}{n}\cdot&space;\dfrac{m-1}{n-1}=\dfrac{1}{2}&space;\iff&space;2m^2-2&space;=&space;n^2&space;-n" title="\dfrac{m}{n}\cdot \dfrac{m-1}{n-1}=\dfrac{1}{2} \iff 2m^2-2 = n^2 -n." /></a> <br>
for n,m positive integers.
This is a quadratic Diophantine equation, which we rewrite as <br>
<a href="https://www.codecogs.com/eqnedit.php?latex=(2n-1)^2&space;-&space;2(2m-1)^2&space;=&space;-1&space;\iff&space;a^2&space;-2&space;b^2&space;=-1," target="_blank"><img src="https://latex.codecogs.com/gif.latex?(2n-1)^2&space;-&space;2(2m-1)^2&space;=&space;-1&space;\iff&space;a^2&space;-2&space;b^2&space;=-1," title="(2n-1)^2 - 2(2m-1)^2 = -1 \iff a^2 -2 b^2 =-1," /></a> <br>
where a = 2n-1 and b = 2m-1. The equation on the right is called a *negative Pell's equation,* and its solutions are well understood. The fundamental solution is (a<sub>1</sub>,b<sub>1</sub>) = (1,1), and all other solutions (a<sub>n</sub>,b<sub>n</sub>) are given by
<a href="https://www.codecogs.com/eqnedit.php?latex=(a_1&plus;\sqrt{2}\cdot&space;b_1)^n&space;=&space;a_n&space;&plus;&space;\sqrt{2}&space;\cdot&space;b_n" target="_blank"><img src="https://latex.codecogs.com/gif.latex?(a_1&plus;\sqrt{2}\cdot&space;b_1)^n&space;=&space;a_n&space;&plus;&space;\sqrt{2}&space;\cdot&space;b_n" title="(a_1\sqrt{2}\cdot b_1)^n = a_n + \sqrt{2} \cdot b_n" /></a>
where n>1 is odd. For a proof, see the fifth theorem of [Ben Lynn's Pell's Equation Notes](https://crypto.stanford.edu/pbc/notes/contfrac/pell.html). The theorem gives us a double recurrence: a<sub>n+1</sub> =  a<sub>n</sub> + 2 b<sub>n</sub> and b<sub>n+1 </sub> =b<sub>n</sub> + a<sub>n</sub>. It is now a simple matter to get a solution with n>10<sup>12</sup>.

    $ time ./p100.py
    756872327473 
    real	0m0.047s
    user	0m0.042s
    sys	0m0.004s


