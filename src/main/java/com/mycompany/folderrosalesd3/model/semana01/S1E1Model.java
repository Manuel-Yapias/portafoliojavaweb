package com.mycompany.folderrosalesd3.model.semana01;

public class S1E1Model {
    private double base;
    private double altura;

    public S1E1Model(double base, double altura) {
        this.base = base;
        this.altura = altura;
    }

    // Método ÚNICO para calcular el área
    public double calcularArea() {
        return this.base * this.altura;
    }

    // Método ÚNICO para calcular el perímetro
    public double calcularPerimetro() {
        return 2 * (this.base + this.altura);
    }
}