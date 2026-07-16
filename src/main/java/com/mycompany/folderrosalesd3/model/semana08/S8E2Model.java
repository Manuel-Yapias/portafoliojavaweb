package com.mycompany.folderrosalesd3.model.semana08;

public class S8E2Model {
    private double capitalInicial;
    private double tasaInteres; // En porcentaje (ej: 8% -> 0.08)
    private double tiempoAnios;

    public S8E2Model(double capitalInicial, double tasaInteres, double tiempoAnios) {
        this.capitalInicial = capitalInicial;
        this.tasaInteres = tasaInteres / 100.0;
        this.tiempoAnios = tiempoAnios;
    }

    // Calcula el monto acumulado de forma continua usando la fórmula: A = P * e^(r * t)
    public double calcularMontoAcumulado() {
        return this.capitalInicial * Math.exp(this.tasaInteres * this.tiempoAnios);
    }

    // Calcula la ganancia neta generada
    public double calcularGananciaNeta() {
        return calcularMontoAcumulado() - this.capitalInicial;
    }

    public double getCapitalInicial() {
        return capitalInicial;
    }

    public double getTasaInteres() {
        return tasaInteres * 100.0;
    }

    public double getTiempoAnios() {
        return tiempoAnios;
    }
}