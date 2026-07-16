package com.mycompany.folderrosalesd3.model;

public class S01E01Model {
    private double b, h;
    public S01E01Model(double b, double h) { this.b = b; this.h = h; }
    public double calcularArea() { return b * h; }
    public double calcularPerimetro() { return 2 * (b + h); }
}