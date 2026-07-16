package com.mycompany.folderrosalesd3.model.semana03;

public class S3E3Model {
    private double horasTrabajadas;
    private double tarifaHoraria;

    public S3E3Model() {
    }

    public S3E3Model(double horasTrabajadas, double tarifaHoraria) {
        this.horasTrabajadas = horasTrabajadas;
        this.tarifaHoraria = tarifaHoraria;
    }

    public double getHorasTrabajadas() {
        return this.horasTrabajadas;
    }

    public double getTarifaHoraria() {
        return this.tarifaHoraria;
    }

    // TAREA ÚNICA: Calcular el sueldo básico (horas * tarifa)
    public double calcularSueldoBasico() {
        return this.horasTrabajadas * this.tarifaHoraria;
    }

    // TAREA ÚNICA: Calcular la bonificación (20% del sueldo básico)
    public double calcularBonificacion() {
        return calcularSueldoBasico() * 0.20;
    }

    // TAREA ÚNICA: Calcular el sueldo bruto (básico + bonificación)
    public double calcularSueldoBruto() {
        return calcularSueldoBasico() + calcularBonificacion();
    }

    // TAREA ÚNICA: Calcular el descuento (10% del sueldo bruto)
    public double calcularDescuento() {
        return calcularSueldoBruto() * 0.10;
    }

    // TAREA ÚNICA: Calcular el sueldo neto final a pagar (bruto - descuento)
    public double calcularSueldoNeto() {
        return calcularSueldoBruto() - calcularDescuento();
    }
}