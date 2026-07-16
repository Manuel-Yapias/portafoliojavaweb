package com.mycompany.folderrosalesd3.model.semana03;

public class S3E5Model {
    private double importeVendido;
    private static final double SUELDO_BASICO = 300.0; // Sueldo básico mensual de S/.300 fijo

    public S3E5Model() {
    }

    public S3E5Model(double importeVendido) {
        this.importeVendido = importeVendido;
    }

    public double getImporteVendido() {
        return this.importeVendido;
    }

    public double getSueldoBasico() {
        return SUELDO_BASICO;
    }

    // TAREA ÚNICA: Calcular comisión por ventas (9% del importe total vendido)
    public double calcularComision() {
        return this.importeVendido * 0.09;
    }

    // TAREA ÚNICA: Calcular sueldo bruto (Sueldo básico + comisión)
    public double calcularSueldoBruto() {
        return SUELDO_BASICO + calcularComision();
    }

    // TAREA ÚNICA: Calcular descuento (11% del sueldo bruto)
    public double calcularDescuento() {
        return calcularSueldoBruto() * 0.11;
    }

    // TAREA ÚNICA: Calcular sueldo neto (Sueldo bruto - descuento)
    public double calcularSueldoNeto() {
        return calcularSueldoBruto() - calcularDescuento();
    }
}