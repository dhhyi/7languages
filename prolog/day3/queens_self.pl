four_queens(Board) :-
    % layout constraints
    member(Y1, [1,2,3,4]), member(Y2, [1,2,3,4]),
    member(Y3, [1,2,3,4]), member(Y4, [1,2,3,4]),
    Board = [(1, Y1), (2, Y2), (3, Y3), (4, Y4)],
    % Rows
    fd_all_different([Y1, Y2, Y3, Y4]),
    % Diag north-east
    S1 is 1 + Y1, S2 is 2 + Y2, S3 is 3 + Y3, S4 is 4 + Y4,
    fd_all_different([S1, S2, S3, S4]),
    % Diag south-east
    D1 is 1 - Y1, D2 is 2 - Y2, D3 is 3 - Y3, D4 is 4 - Y4,
    fd_all_different([D1, D2, D3, D4]).
