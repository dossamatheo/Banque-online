package model;

import java.sql.Timestamp;

public class Transaction {
    private int id;
    private double montant;
    private String typeTransaction; // VIREMENT, DEPOT ou RETRAIT
    private Timestamp dateTransaction; // Date automatique
    private int compteEmetteurId;      // Qui envoie
    private int compteBeneficiaireId;  // Qui reçoit

    public Transaction() {}

    // Constructeur pour créer une nouvelle transaction (sans ID ni date, car gérés par la base)
    public Transaction(double montant, String typeTransaction, int compteEmetteurId, int compteBeneficiaireId) {
        this.montant = montant;
        this.typeTransaction = typeTransaction;
        this.compteEmetteurId = compteEmetteurId;
        this.compteBeneficiaireId = compteBeneficiaireId;
    }

    // Constructeur complet (pour la lecture depuis la base)
    public Transaction(int id, double montant, String typeTransaction, Timestamp dateTransaction, int compteEmetteurId, int compteBeneficiaireId) {
        this.id = id;
        this.montant = montant;
        this.typeTransaction = typeTransaction;
        this.dateTransaction = dateTransaction;
        this.compteEmetteurId = compteEmetteurId;
        this.compteBeneficiaireId = compteBeneficiaireId;
    }

    // Getters
    public int getId() { return id; }
    public double getMontant() { return montant; }
    public String getTypeTransaction() { return typeTransaction; }
    public Timestamp getDateTransaction() { return dateTransaction; }
    public int getCompteEmetteurId() { return compteEmetteurId; }
    public int getCompteBeneficiaireId() { return compteBeneficiaireId; }
}