package com.mycompany.folderrosalesd3.model.semana06;

public class S6E2Model {
    private String ruta;       // "huanuco" o "huancayo"
    private String calidad;    // "A", "B" o "C"
    private int cantidad;

    // Resultados de los cálculos
    private double precioUnitario;
    private double importeCompra;
    private double porcentajeDescuento;
    private double importeDescuento;
    private double importePagar;

    public S6E2Model() {}

    public S6E2Model(String ruta, String calidad, int cantidad) {
        this.ruta = ruta;
        this.calidad = calidad;
        this.cantidad = cantidad;
        procesarTransaccion();
    }

    private void procesarTransaccion() {
        this.precioUnitario = obtenerPrecioUnitario(this.ruta, this.calidad);
        this.importeCompra = calcularImporteCompra(this.precioUnitario, this.cantidad);
        this.porcentajeDescuento = calcularPorcentajeDescuento(this.calidad, this.cantidad);
        this.importeDescuento = calcularImporteDescuento(this.importeCompra, this.porcentajeDescuento);
        this.importePagar = calcularImportePagar(this.importeCompra, this.importeDescuento);
    }

    /**
     * Determina la tarifa según la matriz de ruta y calidad del servicio.
     */
    public double obtenerPrecioUnitario(String rutaSeleccionada, String calidadSeleccionada) {
        if (rutaSeleccionada == null || calidadSeleccionada == null) return 0.0;
        
        String r = rutaSeleccionada.trim().toLowerCase();
        String c = calidadSeleccionada.trim().toUpperCase();

        if (r.equals("huanuco")) {
            switch (c) {
                case "A": return 45.0;
                case "B": return 35.0;
                case "C": return 30.0;
                default: return 0.0;
            }
        } else if (r.equals("huancayo")) {
            switch (c) {
                case "A": return 38.0;
                case "B": return 33.0;
                case "C": return 28.0;
                default: return 0.0;
            }
        }
        return 0.0;
    }

    public double calcularImporteCompra(double precio, int cant) {
        return precio * cant;
    }

    /**
     * Aplica 5% de descuento solo si la calidad es 'A' y la cantidad supera las 4 unidades.
     */
    public double calcularPorcentajeDescuento(String calidadSeleccionada, int cant) {
        if (calidadSeleccionada != null && calidadSeleccionada.trim().toUpperCase().equals("A") && cant > 4) {
            return 5.0; // 5% de descuento
        }
        return 0.0;
    }

    public double calcularImporteDescuento(double compra, double porcentaje) {
        return compra * (porcentaje / 100.0);
    }

    public double calcularImportePagar(double compra, double descuento) {
        return compra - descuento;
    }

    // Getters y Setters
    public String getRuta() { return ruta; }
    public void setRuta(String ruta) { this.ruta = ruta; }

    public String getCalidad() { return calidad; }
    public void setCalidad(String calidad) { this.calidad = calidad; }

    public int getCantidad() { return cantidad; }
    public void setCantidad(int cantidad) { this.cantidad = cantidad; }

    public double getPrecioUnitario() { return precioUnitario; }
    public double getImporteCompra() { return importeCompra; }
    public double getPorcentajeDescuento() { return porcentajeDescuento; }
    public double getImporteDescuento() { return importeDescuento; }
    public double getImportePagar() { return importePagar; }
}