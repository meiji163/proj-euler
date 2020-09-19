> Read the [Problem statement](https://projecteuler.net/problem=137)

Using the closed form for the <a href = https://en.wikipedia.org/wiki/Fibonacci_number#Mathematics> generating function </a>for Fibonacci numbers we see A<sub>F</sub>(x) = x/(1-x-x<sup>2</sup>).
Therefore to solve A<sub>F</sub>(x) = n for some positive integer n we must solve 
<p align = center> nx<sup>2</sup> + (n+1)x -n =0. </p>
The discriminant (n+1)<sup>2</sup> + 4n<sup>2</sup> must be the square of some integer m. In other words, (n+1, 2n, m) is a Pythagorean triple. Moreover, it is a <a href = https://en.wikipedia.org/wiki/Pythagorean_triple#Generating_a_triple> primitive Pythagorean triple </a> so we can write
<p align=center> n+1 = p<sup>2</sup> - q<sup>2</sup>, <br>
2n = 2pq,<br>
m = p<sup>2</sup> + q<sup>2</sup> </p>
for some coprime integers p>q. This implies 
<p align = center> p<sup>2</sup> - q<sup>2</sup> - pq - 1 = 0. </p>
At this point we can brute force search integer solutions. Of course, there are much nicer ways to solve Diophantine equations like this but it's unnecessary to get the 15th "golden nugget."

    $ time ./p137
	1120149658760
	real	0m0.054s
	user	0m0.051s
	sys	0m0.004s
