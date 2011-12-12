lists:sum([N*N + N*N - (N-1) + N*N - 2*(N-1) + N*N - 3*(N-1) || N <-
              lists:seq(3, 1001, 2) ]) + 1.
