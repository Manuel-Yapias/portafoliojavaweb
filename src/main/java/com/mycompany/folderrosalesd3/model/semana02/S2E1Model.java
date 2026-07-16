package com.mycompany.folderrosalesd3.model.semana02;

public class S2E1Model {
    private double precio;
    private int cantidad;

    public S2E1Model() {
    }

    public S2E1Model(double precio, int cantidad) {
        this.precio = precio;
        this.cantidad = cantidad;
    }

    public double getPrecio() {
        return this.precio;
    }

    public int getCantidad() {
        return this.cantidad;
    }

    // TAREA ÚNICA: Calcular el importe base de la compra
    public double calcularImporteCompra() {
        return this.precio * this.cantidad;
    }

    // TAREA ÚNICA: Calcular el descuento del 11% sobre el importe de la compra
    public double calcularDescuento() {
        return calcularImporteCompra() * 0.11;
    }

    // TAREA ÚNICA: Calcular el importe neto a pagar final
    public double calcularImportePagar() {
        return calcularImporteCompra() - calcularDescuento();
    }

    // TAREA ÚNICA: Calcular la cantidad de caramelos de obsequio (2 por unidad)
    public int calcularCaramelosObsequio() {
        return this.cantidad * 2;
    }
}