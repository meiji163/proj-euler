>A row of five grey square tiles is to have a number of its tiles replaced with coloured oblong tiles chosen from red (length two), green (length three), or blue (length four).
>Assuming that colours cannot be mixed there are 7 + 3 + 2 = 12 ways of replacing the grey tiles in a row measuring five units in length.
>How many different ways can the grey tiles in a row measuring fifty units in length be replaced if colours cannot be mixed and at least one coloured tile must be used?

The number of ways to tile a nx1 domino with i>1 kx1 dominoes is the number of ways to choose i positions from the <math> n-i(k-1) </math> total tiles, or in other words </math> C(n-i(k-1),i)<math>. Then just sum over i ≤ n/k.

    time ./p116
    real	0m0.005s
    user	0m0.000s
    sys	0m0.005s
    20492570929
