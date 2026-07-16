package com.mycompany.folderrosalesd3.model.semana01;

public class S1E4Model {
    private double radio;
    private double altura;

    public S1E4Model(double radio, double altura) {
        this.radio = radio;
        this.altura = altura;
    }

    // TAREA ÚNICA: Calcular el área total del cilindro
    public double calcularArea() {
        return 2 * Math.PI * this.radio * (this.radio + this.altura);
    }

    // TAREA ÚNICA: Calcular el volumen del cilindro
    public double calcularVolumen() {
        return Math.PI * Math.pow(this.radio, 2) * this.altura;
    }
}