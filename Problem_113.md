>Working from left-to-right if no digit is exceeded by the digit to its left it is called an increasing number; for example, 134468.
>Similarly if no digit is exceeded by the digit to its right it is called a decreasing number; for example, 66420.
>We shall call a positive integer that is neither increasing nor decreasing a "bouncy" number; for example, 155349.
>As _n_ increases, the proportion of bouncy numbers below _n_ increases such that there are only 12951 numbers below one-million that are not bouncy and only 277032 non-bouncy numbers below 10<sup>10</sup>.
>How many numbers below a googol (10<sup>100</sup>) are not bouncy

The number of increasing numbers with exactly _n_ digits is the binomial coefficient _C(n+8,8)_. To see this, note that increasing numbers with _n_ digits are in bijection with paths of length _n+8_ on a _(n+1) x 9_ grid that

 1. Only goes right or down and
 2. Begins in the upper left corner and ends in the lower right corner.

For example the increasing number 136 corresponds to the path 

|| 1 | 2 | 3 | 4| 5 | 6 | 7 | 8| 9
|--|-- |-- |-- |--|-- |--|--|--|--|
 |**1**| x| |  |  |  |  |  |  |
|**2**| x | x | x |  |
|**3**|  |    | x | x | x | x | 
| **4**|  | 	|   |   |   | x | x | x |x

Each path is uniquely determined by choosing 8 places for the path to go right, so there are _n+8_ choose _8_ of them.

The number of increasing non-negative integers with at most _n_ digits is therefore 

<math> C(8,8) + C(9,8) + ... + C(n+8,8) = C(n+9,9)</math>

by the [Hockey Stick identity](https://en.wikipedia.org/wiki/Hockey-stick_identity). A similar argument shows that the number of decreasing numbers is C(n+10,10).  Taking into account overlap and discarding 0, the total number of non-bouncy numbers with at most _n_ digits is 

<math>C(n+9,9) + C(n+10,10) - 10n - 2.</math>

    $ time ./p113.py 
	51161058134250
	real	0m0.045s
	user	0m0.025s
	sys	0m0.013s


