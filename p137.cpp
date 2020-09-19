#include <iostream>
#include <cmath>
using namespace std;

bool isPerfectSquare(long double x) 
{   
  long double sr = sqrt(x); 
  return ((sr - floor(sr)) == 0); 
}
 
int main(){
	int count = 0;
	unsigned long int p = 1, q =1 ;
        /*(n+1,2n,m) is a primitive Pythagorean triple so 
        (n+1, 2n, m) = (p^2 - q^2, 2pq, p^2 + q^2) for some p,q coprime.
         This implies p^2 - q^2 -pq - 1 =0. We loop through p and check if
         q is an integer.
        */
	while (count < 15){
		p++;
		unsigned long int s = 5*p*p -4;
		if (!isPerfectSquare(s))
			continue;
		unsigned long int sr = sqrt(s);
		q = sr-p;

		if (q%2 != 0)
			continue;
		q /= 2;
                count++;
		}
        cout << p*q << endl;
	return 0;
}
