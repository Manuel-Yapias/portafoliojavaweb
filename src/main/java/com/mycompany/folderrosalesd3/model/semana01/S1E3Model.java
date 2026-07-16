package com.mycompany.folderrosalesd3.model.semana01;

public class S1E3Model {
    private double baseMenor;
    private double baseMayor;
    private double altura;

    public S1E3Model(double baseMenor, double baseMayor, double altura) {
        this.baseMenor = baseMenor;
        this.baseMayor = baseMayor;
        this.altura = altura;
    }

    // TAREA ÚNICA: Realizar el cálculo del área según la fórmula de la guía
    public double calcularArea() {
        return ((this.baseMenor + this.baseMayor) * this.altura) / 2.0;
    }
}