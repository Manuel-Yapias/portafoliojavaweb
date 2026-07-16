package com.mycompany.folderrosalesd3.model.semana02;

public class S2E3Model {
    private double horasTrabajadas;
    private double tarifaHoraria;

    public S2E3Model() {
    }

    public S2E3Model(double horasTrabajadas, double tarifaHoraria) {
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

    // TAREA ÚNICA: Calcular la bonificación del 20% sobre el sueldo básico
    public double calcularBonificacion() {
        return calcularSueldoBasico() * 0.20;
    }

    // TAREA ÚNICA: Calcular el sueldo bruto (básico + bonificación)
    public double calcularSueldoBruto() {
        return calcularSueldoBasico() + calcularBonificacion();
    }

    // TAREA ÚNICA: Calcular el descuento del 10% sobre el sueldo bruto
    public double calcularDescuento() {
        return calcularSueldoBruto() * 0.10;
    }

    // TAREA ÚNICA: Calcular el sueldo neto final a pagar
    public double calcularSueldoNeto() {
        return calcularSueldoBruto() - calcularDescuento();
    }
}