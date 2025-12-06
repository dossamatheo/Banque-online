package model;

public class CompteBancaire {
    private int id;
    private String numeroCompte;
    private double solde;
    private int clientId;

    public CompteBancaire(int id, String numeroCompte, double solde, int clientId) {
        this.id = id;
        this.numeroCompte = numeroCompte;
        this.solde = solde;
        this.clientId = clientId;
    }

    public int getId() { return id; }
    public String getNumeroCompte() { return numeroCompte; }
    public double getSolde() { return solde; }
    public int getClientId() { return clientId; }
}