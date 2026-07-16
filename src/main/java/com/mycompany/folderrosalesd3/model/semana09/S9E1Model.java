package com.mycompany.folderrosalesd3.model.semana09;

public class S9E1Model {
    private int docenas;
    private double precioDocena;
    private double importeCompra;
    private double descuento;
    private double importePagar;
    private int lapicerosObsequio;

    public S9E1Model(int docenas, double precioDocena) {
        this.docenas = docenas;
        this.precioDocena = precioDocena;
        calcular();
    }

    private void calcular() {
        this.importeCompra = this.docenas * this.precioDocena;
        
        // Regla de descuento
        double tasaDescuento = (this.docenas >= 10) ? 0.20 : 0.10;
        this.descuento = this.importeCompra * tasaDescuento;
        this.importePagar = this.importeCompra - this.descuento;
        
        // Regla de lapiceros
        this.lapicerosObsequio = (this.importePagar >= 200) ? (2 * this.docenas) : 0;
    }

    // Getters
    public double getImporteCompra() { return importeCompra; }
    public double getDescuento() { return descuento; }
    public double getImportePagar() { return importePagar; }
    public int getLapicerosObsequio() { return lapicerosObsequio; }
}