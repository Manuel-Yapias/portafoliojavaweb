package com.mycompany.folderrosalesd3.model.semana03;

public class S3E2Model {
    private double precioProducto;
    private int cantidadUnidades;

    public S3E2Model() {
    }

    public S3E2Model(double precioProducto, int cantidadUnidades) {
        this.precioProducto = precioProducto;
        this.cantidadUnidades = cantidadUnidades;
    }

    public double getPrecioProducto() {
        return this.precioProducto;
    }

    public int getCantidadUnidades() {
        return this.cantidadUnidades;
    }

    // TAREA ÚNICA: Calcular el importe base de la compra
    public double calcularImporteCompra() {
        return this.precioProducto * this.cantidadUnidades;
    }

    // TAREA ÚNICA: Calcular el primer descuento (10% del importe compra)
    public double calcularPrimerDescuento() {
        return calcularImporteCompra() * 0.10;
    }

    // TAREA ÚNICA: Calcular el segundo descuento (10% de lo que queda tras el primer descuento)
    public double calcularSegundoDescuento() {
        double resto = calcularImporteCompra() - calcularPrimerDescuento();
        return resto * 0.10;
    }

    // TAREA ÚNICA: Calcular el descuento total acumulado (Descuento 1 + Descuento 2)
    public double calcularDescuentoTotal() {
        return calcularPrimerDescuento() + calcularSegundoDescuento();
    }

    // TAREA ÚNICA: Calcular el importe final neto a pagar
    public double calcularImporteAPagar() {
        return calcularImporteCompra() - calcularDescuentoTotal();
    }
}