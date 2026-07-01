package com.mycompany.folderrosalesd3.model;

public class S01E05Model {
    private double l;
    public S01E05Model(double l) { this.l = l; }
    public double calcularArea() { return 6 * Math.pow(l, 2); }
    public double calcularVolumen() { return Math.pow(l, 3); }
}