package com.mycompany.folderrosalesd3.model;

public class S01E03Model {
    private double B, b, h;
    public S01E03Model(double B, double b, double h) { this.B = B; this.b = b; this.h = h; }
    public double calcularArea() { return ((b + B) * h) / 2; }
}