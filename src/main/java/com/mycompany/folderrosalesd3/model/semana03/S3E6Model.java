package com.mycompany.folderrosalesd3.model.semana03;

public class S3E6Model {
    private double horasTrabajadas;
    private double tarifaHoraria;

    public S3E6Model() {
    }

    public S3E6Model(double horasTrabajadas, double tarifaHoraria) {
        this.horasTrabajadas = horasTrabajadas;
        this.tarifaHoraria = tarifaHoraria;
    }

    public double getHorasTrabajadas() {
        return this.horasTrabajadas;
    }

    public double getTarifaHoraria() {
        return this.tarifaHoraria;
    }

    // TAREA ÚNICA: Calcular sueldo bruto (horas * tarifa)
    public double calcularSueldoBruto() {
        return this.horasTrabajadas * this.tarifaHoraria;
    }

    // TAREA ÚNICA: Calcular descuento por ESSALUD (9% del sueldo bruto)
    public double calcularDescuentoEssalud() {
        return calcularSueldoBruto() * 0.09;
    }

    // TAREA ÚNICA: Calcular descuento por AFP (10% del sueldo bruto)
    public double calcularDescuentoAfp() {
        return calcularSueldoBruto() * 0.10;
    }

    // TAREA ÚNICA: Calcular el descuento total (ESSALUD + AFP)
    public double calcularDescuentoTotal() {
        return calcularDescuentoEssalud() + calcularDescuentoAfp();
    }

    // TAREA ÚNICA: Calcular el sueldo neto final (Sueldo bruto - descuento total)
    public double calcularSueldoNeto() {
        return calcularSueldoBruto() - calcularDescuentoTotal();
    }
}