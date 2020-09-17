#!/usr/bin/python3

def binom(n,k):
    '''returns binomial coefficient n choose k'''
    r = 1
    for i in range(1,k+1):
        r *= (n-k+i)/i
    return int(r + 0.01)

def non_bouncy(n):
    '''Number of non-bouncy numbers with no more than n digits'''
    return binom(n+9,9) + binom(n+10, 10) -10*n-2

if __name__ == "__main__":
    print(non_bouncy(100))
