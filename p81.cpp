#include <iostream>
#include <algorithm>
#include <fstream>
using namespace std;

int main(){
	ifstream matrix;
	matrix.open("p081_matrix.txt");
	int arr[80][80];
	int m[80][80];
	char c;
	for (int i=0; i<80; i++){
		for (int j=0; j<80; j++){
			matrix >> arr[i][j];
			matrix.get(c);
		}
	}
        // m[i][j] is the minimal path length ending at (i,j) in the matrix.
        // Runs dp to find m[79][79]
	for (int i=0; i<80; i++){
		for (int j=0; j<80; j++){
			if (i==0 && j==0)
				m[i][j] = arr[i][j];
			else if (i == 0)
				m[i][j] = arr[i][j]+m[i][j-1];
			else if (j == 0)
				m[i][j] = arr[i][j]+m[i-1][j];
			else
				m[i][j] = min(m[i-1][j],m[i][j-1]) + arr[i][j];
		}
	}		
	
	cout << m[79][79] << endl;

	return 0;
}
