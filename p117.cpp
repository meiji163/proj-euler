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


//number of tilings of nx1 domino with a total of m 2x1, 3x1, or 4x1 tiles. 
long int num_tilings( int n, int m){ 
    long int res = 0;
    int k;
    //using i 2x1 tiles, j 3x1 tiles, and k 4x1 tiles
    for( int i = 0; i<= n/2; i++){
        for (int j = 0; j<= n/3; j++){
            k = m-i-j;
            if (k < 0 || 4*k + 3*j + 2*i > n)
                continue;
            res += binom(n-i-2*j-3*k, i)*binom(n-2*i-2*j-3*k, j)*binom(n-2*i-3*j-3*k,k);
        } 
    }
    return res;
}

long int tot_234_tilings( int n ){
    long int res = 0;
    for (int i = 1; i<=n/2; i++){
        res += num_tilings(n,i);
    }
    return ++res;
}

int main(){
    cout << tot_234_tilings(50) << endl;
}
