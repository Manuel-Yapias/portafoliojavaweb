package com.mycompany.folderrosalesd3.model.semana08;

public class S8E1Model {
    private double catetoA;
    private double catetoB;

    public S8E1Model(double catetoA, double catetoB) {
        this.catetoA = catetoA;
        this.catetoB = catetoB;
    }

    public double calcularHipotenusaDirecta() {
        return Math.hypot(catetoA, catetoB);
    }

    public double getCatetoA() { return catetoA; }
    public double getCatetoB() { return catetoB; }
}