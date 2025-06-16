% Define generators for the hexagon
gen_hexagon = [5 0; -5 0; 0 5; 0 -5; 3 4; -3 -4];

% Define generators for the square
gen_square = [0 8; 0 -8; 8 0; -8 0];

% Combine generators for both shapes
gen_combined = [gen_hexagon, zeros(2,2); zeros(2,2), gen_square];