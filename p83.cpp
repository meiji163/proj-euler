#include <iostream>
#include <queue>
#include <vector>
#include <algorithm>
#include <fstream>
using namespace std;

const int size = 80;
const int INF = 100000000;

int min_path(int a[size][size]){
//Computes minimum path weight on size x size grid starting from (0,0) and ending on (size, size). 

	int d[size][size]; //stores minimum length path to (i,j)
	bool processed[size][size];
	for ( int i =0; i< size; i++){
		for ( int j=0; j< size; j++){
			d[i][j] = INF;
			processed[i][j] = false;
		}
	}
	d[0][0]=a[0][0]; 
	priority_queue<vector<int> >  q;
	vector<int> st{-a[0][0], 0, 0};
	q.push(st);
        //Runs DFS 
	while (!q.empty()){
		vector<int> b = q.top();	
		q.pop();
		int x = b[1];
		int y = b[2];
		if (processed[x][y])	
			continue;
		processed[x][y] = true;
		if ( x > 0){
			if (d[x][y] + a[x-1][y] < d[x-1][y]){
				d[x-1][y] = d[x][y] + a[x-1][y];
				vector<int> up{-d[x-1][y],x-1,y};
				q.push(up);
			}
		}
		if ( x < size - 1 ){
			if (d[x][y] + a[x+1][y] < d[x+1][y]){
				d[x+1][y] = d[x][y] + a[x+1][y];
				vector<int> down{-d[x+1][y],x+1,y};
				q.push(down);
			}
		}
		if ( y< size -1 ){
			if (d[x][y] + a[x][y+1] < d[x][y+1]){
				d[x][y+1] = d[x][y] + a[x][y+1];
				vector<int>  right{-d[x][y+1],x,y+1};
				q.push(right);
			}
		}
		if ( y > 0){
			if (d[x][y] + a[x][y-1] < d[x][y-1]){
				d[x][y-1] = d[x][y] + a[x][y-1];
				vector<int> left{-d[x][y-1],x,y-1};
				q.push(left);
			}
		}
	}
	return d[size-1][size-1];
}

int main(){
	ifstream matrix;
	matrix.open("p083_matrix.txt");
	int arr[size][size];
	char c;
	for (int i=0; i<size; i++){
		for (int j=0; j<size; j++){
			matrix >> arr[i][j];
			matrix.get(c);
		}
	}
	cout << min_path( arr ) << endl;
}


