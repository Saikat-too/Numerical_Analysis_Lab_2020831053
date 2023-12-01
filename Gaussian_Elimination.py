import numpy as np

def gauss_elimination(a_matrix,v_matrix):

    n = len(v_matrix)
    m=n-1
    i=0
    j=i-1
    a=np.zeros(n)

    augmented_matrix=np.concatenate((a_matrix,v_matrix),axis=1,dtype=float)
    for j in range(i+1,n):
        scaling_factor=augmented_matrix[j][i]/augmented_matrix[i][i]
        augmented_matrix[j]=augmented_matrix[j]-(scaling_factor*augmented_matrix[i])

        i=i+1

    a[m]=augmented_matrix[m][n]/augmented_matrix[m][m]

    for k in range(n-2,-1,-1):
        a[k]=augmented_matrix[k][n]

        for j in range(k+1,n):
            a[k]=a[k]-augmented_matrix[k][j]*a[j]
            
        a[k]=a[k]/augmented_matrix[k][k]

    for ans in range(n):
        print(f"a{ans+1} is {a[ans]}")

    t=6
    velocity = a[0]*6*6+a[1]*6+a[2]
    print(f"The velocity is {velocity} ")


    










a_matrix = np.array([[25,5,1],[64,8,1],[144,12,1]])
v_matrix = np.array([[106.8],[177.2],[279.2]])
gauss_elimination(a_matrix,v_matrix)


