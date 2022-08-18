four_queens(Board) :-
    Board = [(1, Y1), (2, Y2), (3, Y3), (4, Y4)],
    fd_domain([Y1, Y2, Y3, Y4], 1, 4),
    fd_all_different([Y1, Y2, Y3, Y4]),
    S1 is 1 + Y1, D1 is 1 - Y1,
    S2 is 2 + Y2, D2 is 2 - Y2,
    S3 is 3 + Y3, D3 is 3 - Y3,
    S4 is 4 + Y4, D4 is 4 - Y4,
    fd_all_different([S1, S2, S3, S4]),
    fd_all_different([D1, D2, D3, D4]),
    fd_domain([S1, S2, S3, S4], 2, 8),
    fd_domain([D1, D2, D3, D4], -3, 3).
