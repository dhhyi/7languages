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
    member(C1, [red, green, yellow, blue, white]),
    member(C2, [red, green, yellow, blue, white]),
    member(C3, [red, green, yellow, blue, white]),
    member(C4, [red, green, yellow, blue, white]),
    member(C5, [red, green, yellow, blue, white]),
    C1 \= C2, C1 \= C3, C1 \= C4, C1 \= C5,
    C2 \= C3, C2 \= C4, C2 \= C5,
    C3 \= C4, C3 \= C5,
    C4 \= C5,
    % All nationalities different
    member(N1, [norwegian, dane, brit, swede, german]),
    member(N2, [norwegian, dane, brit, swede, german]),
    member(N3, [norwegian, dane, brit, swede, german]),
    member(N4, [norwegian, dane, brit, swede, german]),
    member(N5, [norwegian, dane, brit, swede, german]),
    N1 \= N2, N1 \= N3, N1 \= N4, N1 \= N5,
    N2 \= N3, N2 \= N4, N2 \= N5,
    N3 \= N4, N3 \= N5,
    N4 \= N5,
    % All drinks different
    member(B1, [milk, tea, coffee, beer, water]),
    member(B2, [milk, tea, coffee, beer, water]),
    member(B3, [milk, tea, coffee, beer, water]),
    member(B4, [milk, tea, coffee, beer, water]),
    member(B5, [milk, tea, coffee, beer, water]),
    B1 \= B2, B1 \= B3, B1 \= B4, B1 \= B5,
    B2 \= B3, B2 \= B4, B2 \= B5,
    B3 \= B4, B3 \= B5,
    B4 \= B5,
    % All smokes different
    member(S1, [pallmall, dunhill, prince, bluemaster, blends]),
    member(S2, [pallmall, dunhill, prince, bluemaster, blends]),
    member(S3, [pallmall, dunhill, prince, bluemaster, blends]),
    member(S4, [pallmall, dunhill, prince, bluemaster, blends]),
    member(S5, [pallmall, dunhill, prince, bluemaster, blends]),
    S1 \= S2, S1 \= S3, S1 \= S4, S1 \= S5,
    S2 \= S3, S2 \= S4, S2 \= S5,
    S3 \= S4, S3 \= S5,
    S4 \= S5,
    % All pets different
    member(P1, [dogs, birds, cats, horses, fish]),
    member(P2, [dogs, birds, cats, horses, fish]),
    member(P3, [dogs, birds, cats, horses, fish]),
    member(P4, [dogs, birds, cats, horses, fish]),
    member(P5, [dogs, birds, cats, horses, fish]),
    P1 \= P2, P1 \= P3, P1 \= P4, P1 \= P5,
    P2 \= P3, P2 \= P4, P2 \= P5,
    P3 \= P4, P3 \= P5,
    P4 \= P5,
    % The Brit lives in the red house
    member((red, brit, _, _, _), Neighbourhood),
    % The Swede keeps dogs as pets
    member((_, swede, _, _, dogs), Neighbourhood),
    write('.'),
    % The Dane drinks tea
    member((_, dane, tea, _, _), Neighbourhood),
    % The green house’s owner drinks coffee
    member((green, _, coffee, _, _), Neighbourhood),
    write('#'),
    % The person who smokes Pall Mall rears birds
    member((_, _, _, pallmall, birds), Neighbourhood),
    % The owner of the yellow house smokes Dunhill
    member((yellow, _, _, dunhill, _), Neighbourhood),
    % The owner who smokes BlueMaster drinks beer
    member((_, _, beer, bluemaster, _), Neighbourhood),
    % The German smokes Prince
    member((_, german, _, prince, _), Neighbourhood),
    write('-'),
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