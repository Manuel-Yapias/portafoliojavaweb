package com.mycompany.folderrosalesd3.model;

public class S01E06Model {
    private int n1, n2;
    public S01E06Model(int n1, int n2) { this.n1 = n1; this.n2 = n2; }
    public int getCociente() { return n1 / n2; }
    public int getResiduo() { return n1 % n2; }
}