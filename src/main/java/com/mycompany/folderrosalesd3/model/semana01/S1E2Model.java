package com.mycompany.folderrosalesd3.model.semana01;

public class S1E2Model {
    private double radio;
    private final double PI = 3.1416; // Según fórmula provista

    public S1E2Model(double radio) {
        this.radio = radio;
    }

    // TAREA ÚNICA: Calcular el área de la circunferencia
    public double calcularArea() {
        return PI * Math.pow(this.radio, 2);
    }

    // TAREA ÚNICA: Calcular la longitud de la circunferencia
    public double calcularLongitud() {
        return 2 * PI * this.radio;
    }
}
