#!/usr/bin/python3
import numpy as np

labels = {'GGG':0 ,'GGR':1 ,'GRR':2, 'RGG':3, 'RGR':4, 'RRG':5, 'RRR':6}

#adjaceny matrix
A = np.matrix('1 1 0 0 0 0 0 ;\
                0 0 1 0 0 0 0;\
                0 0 0 0 0 0 1;\
                1 1 0 0 0 0 0;\
                0 0 1 0 0 0 0;\
                0 0 0 1 1 0 0;\
                0 0 0 0 0 1 1')

if __name__ == "__main__":
    n = 50 
    P = A**(n-3)
    n_path = 0
    for i in ['GGG','GGR','GRR','RRR']: #valid starting states
        for j in ['GGG','RGG','RRG','RRR']: #valid ending states
            n_path+=P[labels[i], labels[j]]
    print(n_path)
