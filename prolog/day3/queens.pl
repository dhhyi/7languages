% four_queens(Board) :-
%     % Board = [(X1, Y1), (X2, Y2), (X3, Y3), (X4, Y4)],
%     Board = [X1, X2, X3, X4, Y1, Y2, Y3, Y4],
%     fd_domain([X1, X2, X3, X4, Y1, Y2, Y3, Y4], 1, 4),
%     fd_all_different([X1, X2, X3, X4]),
%     fd_all_different([Y1, Y2, Y3, Y4]),
%     S1 is X1 + Y1, D1 is X1 - Y1,
%     S2 is X2 + Y2, D2 is X2 - Y2,
%     S3 is X3 + Y3, D3 is X3 - Y3,
%     S4 is X4 + Y4, D4 is X4 - Y4,
%     fd_all_different([S1, S2, S3, S4]),
%     fd_all_different([D1, D2, D3, D4]).

four_queens(Board) :-
    length(Board, 4),
    valid_board(Board),
    rows(Board, Rows),
    cols(Board, Cols),
    diags1(Board, Diags1),
    diags2(Board, Diags2),
    fd_all_different(Rows),
    fd_all_different(Cols),
    fd_all_different(Diags1),
    fd_all_different(Diags2).

valid_queen((Row, Col)) :-
    Range = [1, 2, 3, 4],
    member(Row, Range), member(Col, Range).

valid_board([]).
valid_board([Head|Tail]) :-
    valid_queen(Head),
    valid_board(Tail).

rows([], []).
rows([(Row, _)|QueensTail], [Row|RowsTail]) :- 
    rows(QueensTail, RowsTail).

cols([], []).
cols([(_, Col)|QueensTail], [Col|ColsTail]) :-
    cols(QueensTail, ColsTail).

diags1([], []).
diags1([(Row, Col)|QueensTail], [Diagonal|DiagonalsTail]) :-
    Diagonal is Col - Row,
    diags1(QueensTail, DiagonalsTail).

diags2([], []).
diags2([(Row, Col)|QueensTail], [Diagonal|DiagonalsTail]) :-
    Diagonal is Col + Row,
    diags2(QueensTail, DiagonalsTail).

% four_queens([(1,A),(2,B),(3,C),(4,D)])
