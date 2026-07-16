package com.mycompany.folderrosalesd3.model.semana02;

public class S2E4Model {
    private double donacionTotal;

    public S2E4Model() {
    }

    public S2E4Model(double donacionTotal) {
        this.donacionTotal = donacionTotal;
    }

    public double getDonacionTotal() {
        return this.donacionTotal;
    }

    // TAREA ÚNICA: Calcular el monto de Medicina General (45% del total)
    public double calcularMedicinaGeneral() {
        return this.donacionTotal * 0.45;
    }

    // TAREA ÚNICA: Calcular el monto de Ginecología (80% de Medicina General)
    public double calcularGinecologia() {
        return calcularMedicinaGeneral() * 0.80;
    }

    // TAREA ÚNICA: Calcular el monto de Pediatría (20% de Medicina General + Ginecología)
    public double calcularPediatria() {
        double subtotal = calcularMedicinaGeneral() + calcularGinecologia();
        return subtotal * 0.20;
    }

    // TAREA ÚNICA: Calcular el monto restante para Traumatología
    public double calcularTraumatologia() {
        double asignado = calcularMedicinaGeneral() + calcularGinecologia() + calcularPediatria();
        return this.donacionTotal - asignado;
    }
}