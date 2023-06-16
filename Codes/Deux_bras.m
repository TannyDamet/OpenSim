% Coordonnées initiales des bras
x1 = [0, 0, 0]; % Coordonnées x du premier bras
y1 = [0, 0, 0]; % Coordonnées y du premier bras
z1 = [0, 0, 0]; % Coordonnées z du premier bras

x2 = [0, 0, 0]; % Coordonnées x du deuxième bras
y2 = [0, 0, 0]; % Coordonnées y du deuxième bras
z2 = [0, 0, 0]; % Coordonnées z du deuxième bras

% Distance entre les épaules des deux bras
distance_epaules = 5;

% Coordonnées initiales des épaules
x1(1) = -distance_epaules/2; % Coordonnée x de l'épaule du premier bras
x2(1) = distance_epaules/2; % Coordonnée x de l'épaule du deuxième bras

% Création de la figure
figure;
axis([-10 10 -10 10 -10 10]); % Définition des limites de l'axe x, y et z
grid on;
view(3);

% Animation
for t = 0:0.1:2*pi % Variation du temps (angle)
    % Calcul des nouvelles coordonnées pour le premier bras
    x1(2) = x1(1) + 2*cos(t); % Mouvement de l'épaule
    x1(3) = x1(2) + 3*cos(t); % Mouvement du coude
    y1(2) = 2*sin(t); % Mouvement de l'épaule
    y1(3) = y1(2) + 3*sin(t); % Mouvement du coude
    z1(3) = 3*sin(t); % Mouvement du coude
    
    % Calcul des nouvelles coordonnées pour le deuxième bras
    x2(2) = x2(1) + 2*cos(t + pi); % Mouvement de l'épaule (décalage de pi)
    x2(3) = x2(2) + 3*cos(t + pi); % Mouvement du coude (décalage de pi)
    y2(2) = 2*sin(t + pi); % Mouvement de l'épaule (décalage de pi)
    y2(3) = y2(2) + 3*sin(t + pi); % Mouvement du coude (décalage de pi)
    z2(3) = 3*sin(t + pi); % Mouvement du coude (décalage de pi)
    
    % Affichage des bras
    plot3(x1, y1, z1, 'bo-', 'LineWidth', 2); % Premier bras (ligne bleue avec des cercles)
    hold on;
    plot3(x1(1), y1(1), z1(1), 'ro', 'MarkerSize', 10); % Point rouge pour l'épaule du premier bras
    plot3(x1(2), y1(2), z1(2), 'ro', 'MarkerSize', 10); % Point rouge pour le coude du premier bras
    
    plot3(x2, y2, z2, 'go-', 'LineWidth', 2); % Deuxième bras (ligne verte avec des cercles)
    plot3(x2(1), y2(1), z2(1), 'ro', 'MarkerSize', 10); % Point rouge pour l'épaule du deuxième bras
    plot3(x2(2), y2(2), z2(2), 'ro', 'MarkerSize', 10); % Point rouge pour le coude du deuxième bras
    
    % Trait jaune entre les épaules
    line([x1(1) x2(1)], [y1(1) y2(1)], [z1(1) z2(1)], 'Color', 'yellow', 'LineWidth', 2);
    
    hold off;
    
    % Définition des limites de l'axe x, y et z (repère fixe)
    axis([-10 10 -10 10 -10 10]);
    
    % Titre et noms des axes
    title('Mouvement des bras');
    xlabel('Axe des X');
    ylabel('Axe des Y');
    zlabel('Axe des Z');
    
    % Pause pour contrôler la vitesse de l'animation
    pause(0.05);
    
    % Effacement des bras précédents
    if t ~= 2*pi
        cla;
    end
end
