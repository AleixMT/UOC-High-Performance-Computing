#include <stdlib.h>

#define SIZE 800

int main() {

    float matrixa[SIZE][SIZE], matrixb[SIZE][SIZE], mresult[SIZE][SIZE];
    int i, j, k;

    /* Initialize the Matrix arrays */
    #pragma omp parallel for
    for (i = 0; i < SIZE * SIZE; i++)
    {
        mresult[0][i] = 0.0;
        matrixa[0][i] = matrixb[0][i] = rand() * (float) 1.1;
    }

    /* Matrix-Matrix multiply */
    #pragma omp parallel shared(mresult, matrixa, matrixb) private(i)
    {
        #pragma omp for
        for (i = 0; i < SIZE; i++)
        {
            for (j = 0; j < SIZE; j++)
            {
                for (k = 0; k < SIZE; k++)
                {
                    mresult[i][j] = mresult[i][j] + matrixa[i][k] * matrixb[k][j];
                }
            }
        }
    }
}
