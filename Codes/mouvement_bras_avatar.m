armPositions = {};  % Cellule pour stocker les positions du bras
currentIndex = 1;  % Index actuel dans la liste des positions
moveSpeed = 0.5;  % Vitesse de déplacement du bras

% Charger les positions du bras à partir du fichier CSV
csvData = 'CSV.csv';  % Remplacez par le chemin correct de votre fichier CSV

% Charger les positions du bras à partir du fichier CSV
fid = fopen(csvData, 'r');
csvLines = textscan(fid, '%f%f%f', 'Delimiter', ',');
fclose(fid);

% Parcourir les lignes du fichier CSV et extraire les positions
for i = 1:numel(csvLines{1})
    x = csvLines{1}(i);
    y = csvLines{2}(i);
    z = csvLines{3}(i);
    
    % Ajouter la position à la cellule des positions du bras
    armPositions{end+1} = [x, y, z];
end

% Démarrer le mouvement du bras
timerObj = timer('ExecutionMode', 'fixedRate', 'Period', moveSpeed, 'TimerFcn', @moveArm);
start(timerObj);

% Fonction de mouvement du bras
function moveArm(~, ~)
    persistent currentIndex  % Déclarer currentIndex en tant que variable persistante
    
    % Vérifier si currentIndex n'est pas initialisé
    if isempty(currentIndex)
        currentIndex = 1;
    end
    
    % Vérifier si toutes les positions ont été atteintes
    if currentIndex > numel(armPositions)
        stop(timerObj);  % Arrêter le mouvement du bras
        return;
    end
    
    % Obtenir la position actuelle du bras
    currentPosition = getPosition();
    
    % Obtenir la prochaine position du bras dans la cellule des positions
    nextPosition = armPositions{currentIndex};
    
    % Déplacer progressivement le bras vers la prochaine position
    newPosition = lerpVector(currentPosition, nextPosition, moveSpeed);
    setPosition(newPosition);
    
    % Passer à la prochaine position dans la cellule des positions
    currentIndex = currentIndex + 1;
end

% Fonction pour obtenir la position actuelle du bras
function position = getPosition()
    % Code pour obtenir la position actuelle du bras dans MATLAB
    % Remplacez cette fonction par votre propre code pour obtenir la position actuelle du bras
    position = [0, 0, 0];  % Exemple de position
end

% Fonction pour définir la position du bras
function setPosition(position)
    % Code pour définir la position du bras dans MATLAB
    % Remplacez cette fonction par votre propre code pour définir la position du bras
    disp(position);  % Affichage de la position à titre d'exemple
end

% Fonction pour effectuer une interpolation linéaire entre deux vecteurs
function interpolatedVector = lerpVector(vector1, vector2, t)
    interpolatedVector = vector1 + t * (vector2 - vector1);
end
