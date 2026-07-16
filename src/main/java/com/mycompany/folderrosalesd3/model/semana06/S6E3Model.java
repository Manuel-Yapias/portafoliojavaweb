package com.mycompany.folderrosalesd3.model.semana06;

public class S6E3Model {
    private String categoria; // "A", "B", "C" o "D"
    private double promedio;  // Rango de 0.0 a 20.0

    // Resultados de los cálculos
    private double pensionActual;
    private double porcentajeDescuento;
    private double importeDescuento;
    private double nuevaPension;

    public S6E3Model() {}

    public S6E3Model(String categoria, double promedio) {
        this.categoria = categoria;
        this.promedio = promedio;
        procesarMatricula();
    }

    private void procesarMatricula() {
        this.pensionActual = obtenerPensionBase(this.categoria);
        this.porcentajeDescuento = obtenerPorcentajeDescuento(this.promedio);
        this.importeDescuento = calcularImporteDescuento(this.pensionActual, this.porcentajeDescuento);
        this.nuevaPension = calcularNuevaPension(this.pensionActual, this.importeDescuento);
    }

    /**
     * Determina la pensión base de acuerdo con la categoría de estudios.
     */
    public double obtenerPensionBase(String cat) {
        if (cat == null) return 0.0;
        switch (cat.trim().toUpperCase()) {
            case "A": return 550.0;
            case "B": return 500.0;
            case "C": return 460.0;
            case "D": return 400.0;
            default: return 0.0;
        }
    }

    /**
     * Determina el porcentaje de descuento basado en el promedio obtenido.
     */
    public double obtenerPorcentajeDescuento(double prom) {
        if (prom >= 18.0 && prom <= 20.0) {
            return 15.0;
        } else if (prom >= 16.0 && prom < 18.0) {
            return 12.0;
        } else if (prom >= 14.0 && prom < 16.0) {
            return 10.0;
        } else {
            return 0.0;
        }
    }

    public double calcularImporteDescuento(double pension, double porcentaje) {
        return pension * (porcentaje / 100.0);
    }

    public double calcularNuevaPension(double pension, double descuento) {
        return pension - descuento;
    }

    // Getters y Setters
    public String getCategoria() { return categoria; }
    public void setCategoria(String categoria) { this.categoria = categoria; }

    public double getPromedio() { return promedio; }
    public void setPromedio(double promedio) { this.promedio = promedio; }

    public double getPensionActual() { return pensionActual; }
    public double getPorcentajeDescuento() { return porcentajeDescuento; }
    public double getImporteDescuento() { return importeDescuento; }
    public double getNuevaPension() { return nuevaPension; }
}