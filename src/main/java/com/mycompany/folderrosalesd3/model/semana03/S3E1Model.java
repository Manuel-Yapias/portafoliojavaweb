package com.mycompany.folderrosalesd3.model.semana03;

public class S3E1Model {
    private double precioProducto;
    private int cantidadUnidades;

    public S3E1Model() {
    }

    public S3E1Model(double precioProducto, int cantidadUnidades) {
        this.precioProducto = precioProducto;
        this.cantidadUnidades = cantidadUnidades;
    }

    public double getPrecioProducto() {
        return this.precioProducto;
    }

    public int getCantidadUnidades() {
        return this.cantidadUnidades;
    }

    // TAREA ÚNICA: Calcular el importe de la compra (precio * cantidad)
    public double calcularImporteCompra() {
        return this.precioProducto * this.cantidadUnidades;
    }

    // TAREA ÚNICA: Calcular el importe del descuento (11% sobre la compra)
    public double calcularDescuento() {
        return calcularImporteCompra() * 0.11;
    }

    // TAREA ÚNICA: Calcular el importe a pagar (compra - descuento)
    public double calcularImporteAPagar() {
        return calcularImporteCompra() - calcularDescuento();
    }

    // TAREA ÚNICA: Calcular obsequio (2 caramelos por cada unidad adquirida)
    public int calcularCaramelosObsequio() {
        return this.cantidadUnidades * 2;
    }
}