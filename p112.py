#!/usr/bin/python3
from p113 import non_bouncy

def is_bouncy(n):
    s = str(n)
    inc, dec = True, True
    for i in range(len(s)-1):
        inc = inc and (s[i] <= s[i+1])
        dec = dec and (s[i] >= s[i+1])
        if not ( inc or dec ):
            return True
    return False

if __name__ == "__main__":
    #number of non-bouncy numbers with at most 6 digits calculated in 
    #Problem 113
    count = non_bouncy(6) 
    n = 999_999

    #find when ratio of non-bouncy numbers is 1:100
    while(count*100 > n):
        n += 1
        if not is_bouncy(n):
            count+= 1
    print(n)
    

