CREATE TABLE Utilisateur (
    id INT AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    mot_de_passe VARCHAR(255) NOT NULL,
    ville VARCHAR(100) NOT NULL,
    code_postal VARCHAR(20),
    adresse TEXT,
    role ENUM('admin', 'particulier', 'professionnel') NOT NULL DEFAULT 'particulier',
    PRIMARY KEY (id),
    UNIQUE (email)
);

CREATE TABLE Marque (
    id INT AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Modele (
    id INT AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    marque_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (marque_id) REFERENCES Marque(id)
);

CREATE TABLE Voiture (
    id INT AUTO_INCREMENT,
    prix DECIMAL(10,2) NOT NULL,
    type ENUM('Manuelle', 'Séquentielle', 'Automatique') NOT NULL,
    energie VARCHAR(100) NOT NULL DEFAULT 'Autre',
    categorie VARCHAR(50) NOT NULL DEFAULT 'Autre',
    kilometrage INT NOT NULL,
    provenance VARCHAR(50) NOT NULL DEFAULT 'France',
    annee DATE NOT NULL,
    mise_en_circulation DATE NOT NULL,
    premiere_main ENUM('oui', 'non') NOT NULL DEFAULT 'non',
    nombre_portes INT NOT NULL DEFAULT 5,
    nombre_places INT NOT NULL DEFAULT 5,
    couleur VARCHAR(50) NOT NULL,
    sellerie VARCHAR(50) NOT NULL,
    consommation DECIMAL(5,1) NOT NULL,
    marque_id INT NOT NULL,
    modele_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (marque_id) REFERENCES Marque(id),
    FOREIGN KEY (modele_id) REFERENCES Modele(id)
);

CREATE TABLE Image (
    id INT AUTO_INCREMENT,
    url TEXT NOT NULL,
    type ENUM('jpg', 'png', 'webp') NOT NULL,
    utilisateur_id INT,
    voiture_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (utilisateur_id) REFERENCES Voiture(id),
    FOREIGN KEY (voiture_id) REFERENCES Voiture(id)
);

CREATE TABLE Annonce (
    id INT AUTO_INCREMENT,
    titre VARCHAR(50) NOT NULL,
    description TEXT,
    vues INT NOT NULL DEFAULT 0,
    statut ENUM('active', 'archive', 'vendue') NOT NULL DEFAULT 'active',
    date_publication DATETIME,
    date_reservation DATETIME,
    date_achat DATETIME,
    utilisateur_id INT NOT NULL,
    voiture_id INT NOT NULL,
    acheteur_id INT,
    PRIMARY KEY (id),
    UNIQUE (utilisateur_id),
    UNIQUE (voiture_id),
    FOREIGN KEY (utilisateur_id) REFERENCES Utilisateur(id),
    FOREIGN KEY (voiture_id) REFERENCES Voiture(id),
    FOREIGN KEY (acheteur_id) REFERENCES Utilisateur(id)
);
