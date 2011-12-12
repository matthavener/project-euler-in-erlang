#include <stdio.h>

int main(int argc, char **argv)
{
    const int N = 21;
    unsigned long long matrix[N][N];
    int i, j, c;

    for (i = 0; i < N; i++)
        for (j = 0; j < N; j++)
            matrix[i][j] = 0;

    matrix[0][0] = 1;

#if 0
    for (c = 0; c < (N*N); c++)
    {
#endif
        for (i = 0; i < N; i++)
        {
            for (j = 0; j < N; j++)
            {
                if ((i + 1) < N)
                    matrix[i+1][j] += matrix[i][j];
                if ((j + 1) < N)
                    matrix[i][j+1] += matrix[i][j];
            }
        }
#if 0
        for (i = 0; i < N; i++)
        {
            for (j = 0; j < N; j++)
                printf("%d ", matrix[i][j]);
            printf("\n");
        }
    }
#endif

    printf("%lld\n", matrix[N-1][N-1]);
    return 0;
}
