CREATE DATABASE IF NOT EXISTS minibank;
USE minibank;

/*table utilisateurs*/
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,/*on ne peut pas avoir deux personnes de mm username*/
    password VARCHAR(255) NOT NULL, /*255 parce qu'il faudra crypter le mdp*/
    role ENUM('ADMIN', 'USER') NOT NULL DEFAULT 'USER' /*on n'aura que admin et user (user par def) comme val*/
);

/*table clients*/
CREATE TABLE clients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,/*pour pas qu'on ai 2 clients avec le même mail*/
    telephone VARCHAR(20),
    user_id INT UNIQUE, /*un user ne correspond qu'à un seul client*/
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

/*table comptes bancaires*/
CREATE TABLE comptes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero_compte VARCHAR(20) UNIQUE NOT NULL,/*numéro de compte unique*/
    solde DECIMAL(15, 2) NOT NULL DEFAULT 0.00,/*15 chiffres avant la virgule et 2 apres*/
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    client_id INT NOT NULL,/*je n'ai pas mis UNIQUE car je suppose qu'un client peut avoir plusieurs compte*/
    FOREIGN KEY (client_id) REFERENCES clients(id) ON DELETE CASCADE
);

/*table transactions*/
CREATE TABLE transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    montant DECIMAL(15, 2) NOT NULL,
    type_transaction ENUM('VIREMENT', 'DEPOT', 'RETRAIT') NOT NULL,
    date_transaction TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    compte_emetteur_id INT, /*compte qui envoie l'argent*/ 
    compte_beneficiaire_id INT, /*compte qui reçoit l'argent*/
    FOREIGN KEY (compte_emetteur_id) REFERENCES comptes(id),
    FOREIGN KEY (compte_beneficiaire_id) REFERENCES comptes(id)
);
