sudoku(Puzzle, Solution) :-
    Solution = Puzzle,
    Puzzle = [
        S11, S12, S13, S14,
        S21, S22, S23, S24,
        S31, S32, S33, S34,
        S41, S42, S43, S44
    ],
    fd_domain(Puzzle, 1, 4),
    % Rows
    fd_all_different([S11, S12, S13, S14]),
    fd_all_different([S21, S22, S23, S24]),
    fd_all_different([S31, S32, S33, S34]),
    fd_all_different([S41, S42, S43, S44]),
    % Columns
    fd_all_different([S11, S21, S31, S41]),
    fd_all_different([S12, S22, S32, S42]),
    fd_all_different([S13, S23, S33, S43]),
    fd_all_different([S14, S24, S34, S44]),
    % Squares
    fd_all_different([S11, S12, S21, S22]),
    fd_all_different([S13, S14, S23, S24]),
    fd_all_different([S31, S32, S41, S42]),
    fd_all_different([S33, S34, S43, S44]).

% sudoku([_,_,2,3, _,_,_,_, _,_,_,_, 3,4,_,_], Solution)
% sudoku([_,_,4,_, _,1,_,3, _,_,1,_, 1,_,_,4], Solution)
