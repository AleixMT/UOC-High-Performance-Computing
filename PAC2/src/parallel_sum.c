#include <omp.h> 
#include <stdio.h> 
#include <stdlib.h>

#define N 2000000

int main (int argc, char *argv[])
{
    // Initialize vector
    int valors[N];
    long long int sum = 0;
    for (int i = 0; i < N; i++)
    {
        valors[i] = rand();
    }

    // Perform reduction operation on sum variable
    #pragma omp parallel for reduction(+:sum)
    for (int i = 0; i < N; i++) {
        sum += valors[i];
    }

    printf("The sum is %lld\n", sum);
}
