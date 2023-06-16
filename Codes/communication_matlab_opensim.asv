clc; close all; clear all;

% Lire le fichier CSV contenant les coordonnées
coordinates = readmatrix('coordonnees.csv');

% Établir une connexion TCP/IP avec Hippo OpenSim Viewer
client = tcpclient('127.0.0.1', 9000);  % Remplacez 'localhost' et 1234 par l'adresse IP et le port d'Hippo OpenSim Viewer

% Envoyer les coordonnées des bras à Hippo OpenSim Viewer
for i = 1:size(coordinates, 1)
    % Récupérer les coordonnées du bras de la ligne courante
    x1 = coordinates(i, 1);
    y1 = coordinates(i, 2);
    z1 = coordinates(i, 3);
    x2 = coordinates(i, 4);
    y2 = coordinates(i, 5);
    z2 = coordinates(i, 6);
    
    % Envoyer les coordonnées des bras à Hippo OpenSim Viewer
    message = sprintf('%f,%f,%f,%f,%f,%f\n', x1, y1, z1, x2, y2, z2);
    write(client, message, "char");
end

% Fermer la connexion TCP/IP
delete(client);
