package com.mycompany.folderrosalesd3.model.semana01;

public class S1E10Model {
    private double montoInvertir;

    public S1E10Model(double montoInvertir) {
        this.montoInvertir = montoInvertir;
    }

    public double getMontoInvertir() {
        return this.montoInvertir;
    }

    // TAREA ÚNICA: Calcular Alquiler (23%)
    public double calcularAlquiler() {
        return this.montoInvertir * 0.23;
    }

    // TAREA ÚNICA: Calcular Publicidad (7%)
    public double calcularPublicidad() {
        return this.montoInvertir * 0.07;
    }

    // TAREA ÚNICA: Calcular Transporte (26%)
    public double calcularTransporte() {
        return this.montoInvertir * 0.26;
    }

    // TAREA ÚNICA: Calcular Servicios Feriales (12%)
    public double calcularServicios() {
        return this.montoInvertir * 0.12;
    }

    // TAREA ÚNICA: Calcular Decoración (21%)
    public double calcularDecoracion() {
        return this.montoInvertir * 0.21;
    }

    // TAREA ÚNICA: Calcular Gastos Varios (11%)
    public double calcularGastosVarios() {
        return this.montoInvertir * 0.11;
    }
}