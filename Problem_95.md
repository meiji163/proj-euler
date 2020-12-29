>The proper divisors of a number are all the divisors excluding the number itself. For example, the proper divisors of 28 are 1, 2, 4, 7, and 14. As the sum of these divisors is equal to 28, we call it a perfect number.
>Interestingly the sum of the proper divisors of 220 is 284 and the sum of the proper divisors of 284 is 220, forming a chain of two numbers. For this reason, 220 and 284 are called an amicable pair.
>Perhaps less well known are longer chains. For example, starting with 12496, we form a chain of five numbers:
>12496 → 14288 → 15472 → 14536 → 14264 (→ 12496 → ...)
>Since this chain returns to its starting point, it is called an amicable chain.
>Find the smallest member of the longest amicable chain with no element exceeding one million.

Any function f: X -> X defined on a finite set X determines a directed graph where the nodes are elements x in X with edges (x,f(x)).
This graph looks like disjoint cycles with trees attached; when we follow x, f(x), f(f(x)), ... we eventually get to a cycle.

For this problem f(n) = sum of proper divisors, X is set of integers 0 ≤ n ≤ 1,000,000 and we want to find the longest cycle.
1. To calculate f(n) efficiently we find the prime factorization n = p<sub>1</sub> <sup>e1</sup> ... p<sub>k</sub> <sup> ek</sup>
   using the sieve of eratosthenes. Then f(n)+n = (1+p<sub>1</sub> + p<sub>1</sub><sup>2</sup> + ... + p<sub>1</sub><sup>e1</sup>) ... (1+p<sub>k</sub> + ... + p<sub>k</sub><sup>ek</sup>) = (1-p<sub>1</sub><sup>e1 + 1</sup>)(1-p<sub>1</sub>) ... (1-p<sub>k</sub><sup>ek +1)/(1-p<sub>k</sub>)
2. To find the cycles we use [Brent's cycle-detection algorithm](https://en.wikipedia.org/wiki/Cycle_detection#Brent's_algorithm) on the sequence of iterates n, f(n), f(f(n)), ... until all integers have been visited.

Most integers end at 1 (period = 0). The others lead to perfect numbers (period = 1) or amicable numbers (period = 2).
Interestingly, there is only one long cycle with period 28.

14316 19116 31704 47616 83328 177792 295488 629072 589786 294896 358336 418904 366556 274924 
275444 243760 376736 381028 285778 152990 122410 97946 48976 45946 22976 22744 19916 17716 

    $ time ./p95
    real	0m1.063s
    user	0m1.020s
    sys	0m0.008s
