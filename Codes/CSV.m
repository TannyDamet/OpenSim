% Création de données pour le fichier CSV
data = [0 0 0; 1 1 1; 2 2 2; 3 3 3; 4 4 4; 5 5 5; 6 6 6; 7 7 7; 8 8 8; 9 9 9];

% Nom du fichier CSV à créer
filename = 'CSV.csv';

% Écriture de la matrice de données dans le fichier CSV
writematrix(data, filename);
