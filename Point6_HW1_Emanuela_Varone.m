% Holonomic Analysis of Raibert's Hopper Robot
clear; clc;

% Symbolic variables definition
syms theta psi I real                   % State variables  
syms theta_dot psi_dot I_dot real       % Derivatives of state variables
syms m l d real                         % Physical parameters of the system

% State vector definition
q = [theta; psi; I]; 
q_dot = [theta_dot; psi_dot; I_dot];

% 1. Pfaffian Constraint
A = [(I + m*(l + d)^2), m*(l + d)^2, 0];
constraint = A * q_dot;

fprintf('================================================\n');
fprintf(' HOLONOMY ANALYSIS - RAIBERT''S HOPPER ROBOT \n');
fprintf('================================================\n\n');

fprintf('1. PFAFFIAN CONSTRAINT:\n');
fprintf('   (I + m*(l+d)^2)*θ_dot + m*(l+d)^2*ψ_dot = 0\n\n');

% 2. Null Space Computation
G = null(A);
fprintf('\n  2. NULL SPACE (G):\n');
for i = 1:size(G,2)
    fprintf('   g%d = [%s; %s; %s]\n', i, ...
            string(G(1,i)), string(G(2,i)), string(G(3,i)));
end

G_rank = rank(G);
fprintf('\n   Rank of G: %d\n', G_rank);
fprintf('\n   Null space dimension: %d\n', size(G,2));

if G_rank ~= size(G,2)
    fprintf(' WARNING: G columns are not linearly independent!\n');
end

% 3. Holonomy Test
if size(G,2) == 2
    g1 = G(:,1);
    g2 = G(:,2);
    
    % Lie Bracket Computation
    Lie = jacobian(g2,q)*g1 - jacobian(g1,q)*g2;
    
    fprintf('\n  3. LIE BRACKET:\n');
    fprintf('   [g1,g2] = [%s; %s; %s]\n\n', ...
            string(Lie(1)), string(Lie(2)), string(Lie(3)));
    
    % Extended Distribution Matrix
    Delta = [G Lie];
    delta_rank = rank(Delta);
    fprintf('   Distribution matrix rank: %d\n', delta_rank);
    
    fprintf('\n  4. HOLONOMY TEST:\n');  
    % Explanation of the condition
    fprintf('\n   Explanation:\n');
    fprintf('   - The system is nonholonomic if the Lie bracket introduces new independent directions (delta_rank > rank(G))\n');
    fprintf('   - The system is holonomic if all Lie brackets remain within the original distribution (delta_rank = rank(G))\n\n');
    
    % Test 
    if delta_rank > G_rank
        fprintf(' CONCLUSION: since delta_rank > rank(G), then SYSTEM is NONHOLONOMIC\n\n');
    else
        fprintf(' CONCLUSION: since delta_rank = rank(G), then SYSTEM is HOLONOMIC \n\n');
    end

end

% 4. Physical Interpretation
fprintf('5. PHYSICAL INTERPRETATION:\n');
fprintf('   - The analysis shows that:\n');
if delta_rank > G_rank
    fprintf('     * Non-integrable constraints exist\n');
    fprintf('     * The system cannot instantaneously move in certain directions, but can eventually reach any configuration\n');
else
    fprintf('     * All constraints are integrable\n');
    fprintf('     * The system can move freely in any direction in space\n');
end

