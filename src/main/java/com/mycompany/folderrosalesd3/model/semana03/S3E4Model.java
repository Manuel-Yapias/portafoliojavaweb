package com.mycompany.folderrosalesd3.model.semana03;

public class S3E4Model {
    private double precioPasaje;
    private int cantidadPasajes;

    public S3E4Model() {
    }

    public S3E4Model(double precioPasaje, int cantidadPasajes) {
        this.precioPasaje = precioPasaje;
        this.cantidadPasajes = cantidadPasajes;
    }

    public double getPrecioPasaje() {
        return this.precioPasaje;
    }

    public int getCantidadPasajes() {
        return this.cantidadPasajes;
    }

    // TAREA ÚNICA: Calcular el importe de la compra (precio * cantidad)
    public double calcularImporteCompra() {
        return this.precioPasaje * this.cantidadPasajes;
    }

    // TAREA ÚNICA: Calcular el descuento del 7% sobre la compra
    public double calcularDescuento() {
        return calcularImporteCompra() * 0.07;
    }

    // TAREA ÚNICA: Calcular el importe final neto a pagar
    public double calcularImporteAPagar() {
        return calcularImporteCompra() - calcularDescuento();
    }

    // TAREA ÚNICA: Calcular obsequio de chocolates (3 por cada pasaje adquirido)
    public int calcularChocolatesObsequio() {
        return this.cantidadPasajes * 3;
    }
}