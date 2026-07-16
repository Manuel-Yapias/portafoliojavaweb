package com.mycompany.folderrosalesd3.model.semana06;

public class S6E1Model {
    private String tipoChocolate;
    private int cantidad;
    
    // Resultados de los cálculos
    private double precioUnitario;
    private double importeCompra;
    private double porcentajeDescuento;
    private double importeDescuento;
    private double importePagar;
    private int caramelosObsequio;

    // Constructor vacío
    public S6E1Model() {}

    // Constructor con datos iniciales
    public S6E1Model(String tipoChocolate, int cantidad) {
        this.tipoChocolate = tipoChocolate;
        this.cantidad = cantidad;
        procesarTransaccion();
    }

    /**
     * Coordina el procesamiento de la compra aplicando las reglas del negocio.
     */
    private void procesarTransaccion() {
        this.precioUnitario = obtenerPrecioUnitario(this.tipoChocolate);
        this.importeCompra = calcularImporteCompra(this.precioUnitario, this.cantidad);
        this.porcentajeDescuento = obtenerPorcentajeDescuento(this.cantidad);
        this.importeDescuento = calcularImporteDescuento(this.importeCompra, this.porcentajeDescuento);
        this.importePagar = calcularImportePagar(this.importeCompra, this.importeDescuento);
        this.caramelosObsequio = calcularCaramelosObsequio(this.importePagar, this.cantidad);
    }

    /**
     * Determina el precio según la tabla de tipos de chocolate.
     */
    public double obtenerPrecioUnitario(String tipo) {
        if (tipo == null) return 0.0;
        switch (tipo.trim().toLowerCase()) {
            case "primor": return 8.50;
            case "dulzura": return 10.00;
            case "tentacion": return 7.00;
            case "explosion": return 12.50;
            default: return 0.0;
        }
    }

    /**
     * Calcula el importe bruto (importe de la compra).
     */
    public double calcularImporteCompra(double precio, int cant) {
        return precio * cant;
    }

    /**
     * Determina el porcentaje de descuento basado en la cantidad de chocolates.
     */
    public double obtenerPorcentajeDescuento(int cant) {
        if (cant < 5) {
            return 4.0;
        } else if (cant < 10) {
            return 6.5;
        } else if (cant < 15) {
            return 9.0;
        } else {
            return 11.5;
        }
    }

    /**
     * Calcula el monto deducido del importe de compra.
     */
    public double calcularImporteDescuento(double compra, double porcentaje) {
        return compra * (porcentaje / 100.0);
    }

    /**
     * Calcula el importe final a pagar neto.
     */
    public double calcularImportePagar(double compra, double descuento) {
        return compra - descuento;
    }

    /**
     * Determina la cantidad de caramelos de obsequio.
     * Si el importe a pagar es NO MENOR (>=) de S/. 250, obsequia 3 por chocolate.
     * De lo contrario, obsequia 2 por chocolate.
     */
    public int calcularCaramelosObsequio(double pagar, int cant) {
        int caramelosPorChocolate = (pagar >= 250.0) ? 3 : 2;
        return caramelosPorChocolate * cant;
    }

    // Getters y Setters
    public String getTipoChocolate() { return tipoChocolate; }
    public void setTipoChocolate(String tipoChocolate) { this.tipoChocolate = tipoChocolate; }

    public int getCantidad() { return cantidad; }
    public void setCantidad(int cantidad) { this.cantidad = cantidad; }

    public double getPrecioUnitario() { return precioUnitario; }
    public double getImporteCompra() { return importeCompra; }
    public double getPorcentajeDescuento() { return porcentajeDescuento; }
    public double getImporteDescuento() { return importeDescuento; }
    public double getImportePagar() { return importePagar; }
    public int getCaramelosObsequio() { return caramelosObsequio; }
}   