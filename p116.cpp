#include <iostream>
using namespace std;

long int binom( int n, int k ){
    long int res = 1;
    if (k > n-k)
        k = n-k;
    for (int i = 0; i< k; ++i){
        res *= n-i;
        res /= i+1;
    }
    return res;
}

//number of tilings of nx1 domino with kx1 and 1x1 dominoes, using at least one kx1 domino.
long int num_tilings( int n, int k ){
    long int res = 0; 
    for( int i =1; k*i<= n; i++ ){
        res += binom(n-i*k +i, i);
    }
    return res;
}

int main(){
    int N = 50;
    long int ans = num_tilings(N,2)+num_tilings(N,3)+num_tilings(N,4);
    cout << ans << endl;
}
