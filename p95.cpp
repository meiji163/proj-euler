#include <iostream>
#include <utility>
#include <functional>
#include <map>
#include <vector>
#include <math.h>
using namespace std;

const unsigned int M = 1000000; 
int arr[M+1];
bool vis[M+1];

void sieve(){
    //sieve to fill array so arr[i] = smallest prime factor of n
    memset(vis, false, sizeof(vis));
    for (int i = 2; i <= M; i++){
        if (!vis[i]){
            vis[i] = true;
            arr[i] = i;
            for (int j = i; j*i <= M; j++){
                if (!vis[i*j]){
                    vis[i*j] = true;
                    arr[i*j] = i;
                }
            }
        }
    }
}

int aliquot(int n){
    //sum of proper divisors of n
    if (n > M || n < 2)
        return 0;
    else if (arr[n] == 1)
        return 1;

    int orig = n;
    unsigned long long int sum = 1;
    unsigned long long int fac;
    int p;
    //prime factorization n = p1^e1*...*pk^ek
    //then sum of divisors = (p1^(e1+1)-1)/(p1-1)*...*(pk^(ek+1)-1)/(pk-1)
    while ( n > 1){ 
        p = arr[n];
        fac = p;
        while (arr[n] == p && p>1){
            n /= p;
            fac *= p;
        }
        if (p > 1){ 
            sum *= (fac - 1)/(p-1);
        }
    } 
    vis[n] = true;
    return sum - orig;
}

pair<int, int> cycle(int n){
    //Brent's cycle-detection algorithm
    // returns (period, first term of cycle)
    pair<int,int> out;
    int ex = 1;
    int p = 1;
    int tort = n;
    int hare = aliquot(n);
    while (tort != hare){
        if (ex == p){
            tort = hare;
            ex *= 2;
            p = 0;
        }
        hare = aliquot(hare);
        p++;
        if (hare == 0 || tort == 0){
            //sequence goes to 0
            out.first = 0;
            out.second = n;
            return out; 
        }
    }

    tort = n;
    hare = n;
    for (int i=0; i < p; ++i){
        hare = aliquot(hare);
    }
    int mu = 0;
    while (tort != hare){
        tort = aliquot(tort);
        hare = aliquot(hare);
        mu++;
    } 
    out.first = p; 
    out.second = tort;
    return out;
}

int main(int argc, char *argv[]){
    sieve();
    pair<int,int> c; 
    int p;
    if (argc == 3){
        int n = stoi(argv[1]);
        int len = stoi(argv[2]);
        for (int i = 0; i< len; ++i){
            cout << n << endl;
            n = aliquot(n);
        }
    }else{
        int max = 0;
        int start;
        memset(vis, false, sizeof(vis));
        for (int i = 2; i <= M; ++i){
            if (!vis[i]){
                c = cycle(i);
                p = c.first;
                if (p> max){
                    max = p;
                    start = c.second;
                }
            }
        }
        for (int i = 0; i<max; ++i){
            cout << start << " ";
            start = aliquot(start);
        }
        cout << endl;
    }
} 
