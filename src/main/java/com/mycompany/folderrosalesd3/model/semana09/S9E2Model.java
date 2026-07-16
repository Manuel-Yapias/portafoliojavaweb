package com.mycompany.folderrosalesd3.model.semana09;

public class S9E2Model {
    private String categoria;
    private int horasTrabajadas;
    private int hijos;
    
    private double sueldoBasico;
    private double bonificacion;
    private double sueldoBruto;
    private double descuento;
    private double sueldoNeto;

    public S9E2Model(String categoria, int horasTrabajadas, int hijos) {
        this.categoria = categoria;
        this.horasTrabajadas = horasTrabajadas;
        this.hijos = hijos;
        calcularPlanilla();
    }

    private void calcularPlanilla() {
        // 1. Cálculo Sueldo Básico
        double tarifa = categoria.equalsIgnoreCase("A") ? 45.0 : 37.5;
        this.sueldoBasico = horasTrabajadas * tarifa;
        
        // 2. Cálculo Bonificación
        double tasaBono = (hijos <= 3) ? 40.5 : 35.0;
        this.bonificacion = hijos * tasaBono;
        
        // 3. Sueldo Bruto y Descuento
        this.sueldoBruto = sueldoBasico + bonificacion;
        double tasaDescuento = (sueldoBruto >= 3500) ? 0.135 : 0.10;
        this.descuento = sueldoBruto * tasaDescuento;
        
        // 4. Sueldo Neto
        this.sueldoNeto = sueldoBruto - descuento;
    }

    // Getters
    public double getSueldoBasico() { return sueldoBasico; }
    public double getBonificacion() { return bonificacion; }
    public double getSueldoBruto() { return sueldoBruto; }
    public double getDescuento() { return descuento; }
    public double getSueldoNeto() { return sueldoNeto; }
}