package com.mycompany.folderrosalesd3.model;

public class S01E04Model {
    private double r, h;
    public S01E04Model(double r, double h) { this.r = r; this.h = h; }
    public double calcularAreaTotal() { return 2 * Math.PI * r * (r + h); }
    public double calcularVolumen() { return Math.PI * Math.pow(r, 2) * h; }
}