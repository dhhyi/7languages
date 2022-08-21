% There are five houses, each painted a different color. In each house lives a person with a different nationality. These five owners drink a certain type of beverage, smoke a certain brand of cigar, and keep a certain pet. No owners have the same pet, smoke the same cigar, or drink the same beverage.

% The question is, who owns the fish?

% Here are the clues:

% The Brit lives in the red house
% The Swede keeps dogs as pets
% The Dane drinks tea
% The green house is on the left of the white house
% The green house’s owner drinks coffee
% The person who smokes Pall Mall rears birds
% The owner of the yellow house smokes Dunhill
% The man living in the center house drinks milk
% The Norwegian lives in the first house
% The man who smokes blends lives next to the one who keeps cats
% The man who keeps horses lives next to the man who smokes Dunhill
% The owner who smokes BlueMaster drinks beer
% The German smokes Prince
% The Norwegian lives next to the blue house
% The man who smokes blend has a neighbor who drinks water

einstein(Neighbourhood) :-
    % (Color, Nationality, Beverage, Smoke, Pet)
    Neighbourhood = [(C1, N1, B1, S1, P1), (C2, N2, B2, S2, P2), (C3, N3, B3, S3, P3), (C4, N4, B4, S4, P4), (C5, N5, B5, S5, P5)],
    % The Norwegian lives in the first house
    N1 = norwegian,
    % The man living in the center house drinks milk
    B3 = milk,
    % The Norwegian lives next to the blue house
    % neighbor((_, norwegian, _, _, _), (blue, _, _, _, _), Neighbourhood),
    C2 = blue,
    % All colours different
    permutation([red, green, yellow, white], [C1, C3, C4, C5]),
    % All nationalities different
    permutation([dane, brit, swede, german], [N2, N3, N4, N5]),
    % All drinks different
    permutation([tea, coffee, beer, water], [B1, B2, B4, B5]),
    % All smokes different
    permutation([pallmall, dunhill, prince, bluemaster, blends], [S1, S2, S3, S4, S5]),
    % All pets different
    permutation([dogs, birds, cats, horses, fish], [P1, P2, P3, P4, P5]),
    % The Brit lives in the red house
    member((red, brit, _, _, _), Neighbourhood),
    % The Swede keeps dogs as pets
    member((_, swede, _, _, dogs), Neighbourhood),
    % The Dane drinks tea
    member((_, dane, tea, _, _), Neighbourhood),
    % The green house’s owner drinks coffee
    member((green, _, coffee, _, _), Neighbourhood),
    % The person who smokes Pall Mall rears birds
    member((_, _, _, pallmall, birds), Neighbourhood),
    % The owner of the yellow house smokes Dunhill
    member((yellow, _, _, dunhill, _), Neighbourhood),
    % The owner who smokes BlueMaster drinks beer
    member((_, _, beer, bluemaster, _), Neighbourhood),
    % The German smokes Prince
    member((_, german, _, prince, _), Neighbourhood),
    % The green house is on the left of the white house
    sublist([(green, _, _, _, _), (white, _, _, _, _)], Neighbourhood),
    % The man who smokes blends lives next to the one who keeps cats
    neighbor((_, _, _, blends, _), (_, _, _, _, cats), Neighbourhood),
    % The man who keeps horses lives next to the man who smokes Dunhill
    neighbor((_, _, _, _, horses), (_, _, _, dunhill, _), Neighbourhood),
    % The man who smokes blend has a neighbor who drinks water
    neighbor((_, _, _, blends, _), (_, _, water, _, _), Neighbourhood).

neighbor(A, B, Neighbourhood) :-
    sublist([A, B], Neighbourhood); sublist([B, A], Neighbourhood).

% einstein(X).
% X = [
%     (green,norwegian,coffee,pallmall,birds),
%     (blue,swede,beer,bluemaster,dogs),
%     (red,brit,milk,blends,horses),
%     (yellow,dane,tea,dunhill,cats),
%     (white,german,water,prince,fish)
% ]
% ...
