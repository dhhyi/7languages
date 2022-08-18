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
