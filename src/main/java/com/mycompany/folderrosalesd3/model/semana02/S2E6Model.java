package com.mycompany.folderrosalesd3.model.semana02;

public class S2E6Model {
    private double horasTrabajadas;
    private double tarifaHoraria;

    public S2E6Model() {
    }

    public S2E6Model(double horasTrabajadas, double tarifaHoraria) {
        this.horasTrabajadas = horasTrabajadas;
        this.tarifaHoraria = tarifaHoraria;
    }

    public double getHorasTrabajadas() {
        return this.horasTrabajadas;
    }

    public double getTarifaHoraria() {
        return this.tarifaHoraria;
    }

    // TAREA ÚNICA: Calcular el sueldo bruto (horas * tarifa)
    public double calcularSueldoBruto() {
        return this.horasTrabajadas * this.tarifaHoraria;
    }

    // TAREA ÚNICA: Calcular el descuento de ESSALUD (9% del sueldo bruto)
    public double calcularDescuentoEssalud() {
        return calcularSueldoBruto() * 0.09;
    }

    // TAREA ÚNICA: Calcular el descuento de AFP (10% del sueldo bruto)
    public double calcularDescuentoAfp() {
        return calcularSueldoBruto() * 0.10;
    }

    // TAREA ÚNICA: Calcular el descuento total (ESSALUD + AFP)
    public double calcularDescuentoTotal() {
        return calcularDescuentoEssalud() + calcularDescuentoAfp();
    }

    // TAREA ÚNICA: Calcular el sueldo neto final a pagar
    public double calcularSueldoNeto() {
        return calcularSueldoBruto() - calcularDescuentoTotal();
    }
}