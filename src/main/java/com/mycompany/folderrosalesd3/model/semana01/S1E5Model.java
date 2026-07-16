package com.mycompany.folderrosalesd3.model.semana01;

public class S1E5Model {
    private double lado;

    public S1E5Model(double lado) {
        this.lado = lado;
    }

    // TAREA ÚNICA: Calcular el área total del cubo (6 * l^2)
    public double calcularArea() {
        return 6 * Math.pow(this.lado, 2);
    }

    // TAREA ÚNICA: Calcular el volumen del cubo (l^3)
    public double calcularVolumen() {
        return Math.pow(this.lado, 3);
    }
}