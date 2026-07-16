package com.mycompany.folderrosalesd3.model.semana02;

public class S2E5Model {
    // El sueldo básico mensual es fijo: S/. 300
    private static final double SUELDO_BASICO_CONSTANTE = 300.0;
    private double importeVendido;

    public S2E5Model() {
    }

    public S2E5Model(double importeVendido) {
        this.importeVendido = importeVendido;
    }

    public double getImporteVendido() {
        return this.importeVendido;
    }

    // TAREA ÚNICA: Retornar el sueldo básico mensual fijo
    public double obtenerSueldoBasico() {
        return SUELDO_BASICO_CONSTANTE;
    }

    // TAREA ÚNICA: Calcular la comisión por ventas (9% del importe vendido)
    public double calcularComision() {
        return this.importeVendido * 0.09;
    }

    // TAREA ÚNICA: Calcular el sueldo bruto (sueldo básico fijo + comisión)
    public double calcularSueldoBruto() {
        return obtenerSueldoBasico() + calcularComision();
    }

    // TAREA ÚNICA: Calcular el descuento (11% del sueldo bruto)
    public double calcularDescuento() {
        return calcularSueldoBruto() * 0.11;
    }

    // TAREA ÚNICA: Calcular el sueldo neto final a pagar
    public double calcularSueldoNeto() {
        return calcularSueldoBruto() - calcularDescuento();
    }
}