package com.mycompany.folderrosalesd3.model;

public class S01E02Model {
    private double r;
    public S01E02Model(double r) { this.r = r; }
    public double calcularArea() { return 3.1416 * Math.pow(r, 2); }
    public double calcularCircunferencia() { return 2 * 3.1416 * r; }
}