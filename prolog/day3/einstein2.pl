% The following version of the puzzle appeared in Life International in 1962:

% There are five houses.
% The Englishman lives in the red house.
% The Spaniard owns the dog.
% Coffee is drunk in the green house.
% The Ukrainian drinks tea.
% The green house is immediately to the right of the ivory house.
% The Old Gold smoker owns snails.
% Kools are smoked in the yellow house.
% Milk is drunk in the middle house.
% The Norwegian lives in the first house.
% The man who smokes Chesterfields lives in the house next to the man with the fox.
% Kools are smoked in the house next to the house where the horse is kept.
% The Lucky Strike smoker drinks orange juice.
% The Japanese smokes Parliaments.
% The Norwegian lives next to the blue house.
% Now, who drinks water? Who owns the zebra?

% In the interest of clarity, it must be added that each of the five houses is painted a different color, and their inhabitants are of different national extractions, own different pets, drink different beverages and smoke different brands of American cigarets [sic]. One other thing: in statement 6, right means your right.

einstein(Neighbourhood) :-
    % (Color, Nationality, Beverage, Smoke, Pet)
    Neighbourhood = [(C1, N1, B1, S1, P1), (C2, N2, B2, S2, P2), (C3, N3, B3, S3, P3), (C4, N4, B4, S4, P4), (C5, N5, B5, S5, P5)],
    % All colours different
    permutation([red, green, ivory, yellow], [C1, C3, C4, C5]),
    % All nationalities different
    permutation([englishman, spaniard, ukranian, japanese], [N2, N3, N4, N5]),
    % All drinks different
    permutation([coffee, tea, orangejuice, water], [B1, B2, B4, B5]),
    % All smokes different
    permutation([oldgold, kools, chesterfields, luckystrike, parliaments], [S1, S2, S3, S4, S5]),
    % All pets different
    permutation([zebra, dog, snails, fox, horse], [P1, P2, P3, P4, P5]),
    % Milk is drunk in the middle house.
    B3 = milk,
    % The Norwegian lives in the first house.
    N1 = norwegian,
    % The Norwegian lives next to the blue house.
    C2 = blue,
    % The Englishman lives in the red house.
    member((red, englishman, _, _, _), Neighbourhood),
    % The Spaniard owns the dog.
    member((_, spaniard, _, _, dog), Neighbourhood),
    % Coffee is drunk in the green house.
    member((green, _, coffee, _, _), Neighbourhood),
    % The Ukrainian drinks tea.
    member((_, ukranian, tea, _, _), Neighbourhood),
    % The green house is immediately to the right of the ivory house.
    inorder((ivory, _, _, _, _), (green, _, _, _, _), Neighbourhood),
    % The Old Gold smoker owns snails.
    member((_, _, _, oldgold, snails), Neighbourhood),
    % Kools are smoked in the yellow house.
    member((yellow, _, _, kools, _), Neighbourhood),
    % The man who smokes Chesterfields lives in the house next to the man with the fox.
    neighbor((_, _, _, chesterfields, _), (_, _, _, _, fox), Neighbourhood),
    % Kools are smoked in the house next to the house where the horse is kept.
    neighbor((_, _, _, kools, _), (_, _, _, _, horse), Neighbourhood),
    % The Lucky Strike smoker drinks orange juice.
    member((_, _, orangejuice, luckystrike, _), Neighbourhood),
    % The Japanese smokes Parliaments.
    member((_, japanese, _, parliaments, _), Neighbourhood).

neighbor(A, B, Neighbourhood) :-
    inorder(A, B, Neighbourhood).
neighbor(A, B, Neighbourhood) :-
    inorder(B, A, Neighbourhood).

inorder(X, Y, [X, Y|_]).
inorder(X, Y, [_|List]) :- inorder(X, Y, List).

% einstein(X).
% X = [
%     (yellow,norwegian,water,kools,fox),
%     (blue,ukranian,tea,chesterfields,horse),
%     (red,englishman,milk,oldgold,snails),
%     (ivory,spaniard,orangejuice,luckystrike,dog),
%     (green,japanese,coffee,parliaments,zebra)
% ]
