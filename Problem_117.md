>Using a combination of grey square tiles and oblong tiles chosen from: red tiles (measuring two units), green tiles (measuring three units), and blue tiles (measuring four units), it is possible to tile a row measuring five units in length in exactly fifteen different ways.
>How many ways can a row measuring fifty units in length be tiled?

Similar to Problem 116, we calculate the number of tilings with i red tiles, j green tiles, and k blue tiles. 
First we choose i tiles from the n-i-2j-3k total tiles, then choose j tiles from the n-2i-2j-3k remaining, then choose k from n-2i-3j-3k. this is

C(n-i-2j-3k,i)C(n-2i-2j-3k,j)C(n-2i-3j-3k, k).

We sum this over all (i,j,k) such that i+j+k = m. Then we sum over 0≤ m ≤ n/2. 

    $ time ./p117
    100808458960497

    real	0m0.004s
    user	0m0.000s
    sys	0m0.004s

