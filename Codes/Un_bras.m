% Coordonnées initiales du bras
x = [0 0 0]; % Coordonnée x de chaque articulation
y = [0 0 0]; % Coordonnée y de chaque articulation
z = [0 0 0]; % Coordonnée z de chaque articulation

% Création de la figure
figure;
axis([-10 10 -10 10 -10 10]); % Définition des limites de l'axe x, y et z
grid on;
view(3);

% Animation
for t = 0:0.1:2*pi % Variation du temps (angle)
    % Calcul des nouvelles coordonnées
    x(2) = 2*cos(t); % Mouvement de l'épaule
    x(3) = x(2) + 3*cos(t); % Mouvement du coude
    y(2) = 2*sin(t); % Mouvement de l'épaule
    y(3) = y(2) + 3*sin(t); % Mouvement du coude
    z(3) = 3*sin(t); % Mouvement du coude
    
    % Affichage du bras
    plot3(x, y, z, 'bo-', 'LineWidth', 2); % Ligne bleue avec des cercles
    hold on;
    plot3(x(1), y(1), z(1), 'ro', 'MarkerSize', 10); % Point rouge pour l'épaule
    plot3(x(2), y(2), z(2), 'ro', 'MarkerSize', 10); % Point rouge pour le coude
    hold off;
    
    % Définition des limites de l'axe x, y et z (repère fixe)
    axis([-10 10 -10 10 -10 10]);
    
    % Titre et noms des axes
    title('Mouvement du bras');
    xlabel('Axe des X');
    ylabel('Axe des Y');
    zlabel('Axe des Z');
    
    % Pause pour contrôler la vitesse de l'animation
    pause(0.05);
    
    % Effacement du bras précédent
    if t ~= 2*pi
        cla;
    end
end

