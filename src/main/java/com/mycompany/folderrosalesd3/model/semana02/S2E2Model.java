package com.mycompany.folderrosalesd3.model.semana02;

public class S2E2Model {
    private double precio;
    private int cantidad;

    public S2E2Model() {
    }

    public S2E2Model(double precio, int cantidad) {
        this.precio = precio;
        this.cantidad = cantidad;
    }

    public double getPrecio() {
        return this.precio;
    }

    public int getCantidad() {
        return this.cantidad;
    }

    // TAREA ÚNICA: Calcular el importe bruto de la compra
    public double calcularImporteCompra() {
        return this.precio * this.cantidad;
    }

    // TAREA ÚNICA: Calcular el primer descuento (7% sobre el importe total de compra)
    public double calcularPrimerDescuento() {
        return calcularImporteCompra() * 0.07;
    }

    // TAREA ÚNICA: Calcular el segundo descuento (7% sobre la diferencia)
    public double calcularSegundoDescuento() {
        double saldoRestante = calcularImporteCompra() - calcularPrimerDescuento();
        return saldoRestante * 0.07;
    }

    // TAREA ÚNICA: Calcular la suma de ambos descuentos sucesivos
    public double calcularDescuentoTotal() {
        return calcularPrimerDescuento() + calcularSegundoDescuento();
    }

    // TAREA ÚNICA: Calcular el importe neto a pagar final
    public double calcularImportePagar() {
        return calcularImporteCompra() - calcularDescuentoTotal();
    }
}