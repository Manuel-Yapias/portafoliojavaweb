package com.mycompany.folderrosalesd3.model.semana01;

public class S1E9Model {
    private double montoTotal;

    public S1E9Model(double montoTotal) {
        this.montoTotal = montoTotal;
    }

    public double getMontoTotal() {
        return this.montoTotal;
    }

    // TAREA ÚNICA: Calcular lo asignado a Josué (27% del total)
    public double calcularJosue() {
        return this.montoTotal * 0.27;
    }

    // TAREA ÚNICA: Calcular lo asignado a Tamar (85% de lo de Josué)
    public double calcularTamar() {
        return calcularJosue() * 0.85;
    }

    // TAREA ÚNICA: Calcular lo asignado a Daniel (25% del total)
    public double calcularDaniel() {
        return this.montoTotal * 0.25;
    }

    // TAREA ÚNICA: Calcular lo asignado a Caleb (23% de la suma de Josué y Daniel)
    public double calcularCaleb() {
        return (calcularJosue() + calcularDaniel()) * 0.23;
    }

    // TAREA ÚNICA: Calcular lo asignado a David (El sobrante total)
    public double calcularDavid() {
        double asignadoAcumulado = calcularJosue() + calcularTamar() + calcularDaniel() + calcularCaleb();
        return this.montoTotal - asignadoAcumulado;
    }
}