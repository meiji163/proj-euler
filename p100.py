#!/usr/bin/env python3
MAX = 1_000_000_000_000

#for n odd, gives next solution for a^2-2b^2 = -1
def PellSoln(n):
	a,b = 1,1
	for i in range(n-1):
		a, b = a + 2*b , a + b
	return a,b

#a = 2n-1, b= 2m-1
count=1
soln = PellSoln(1)
while (soln[0]+1)//2 <= MAX:
	count += 2
	soln = PellSoln( count )
#soln = PellSoln(count+2)
print((soln[1]+1)//2)
