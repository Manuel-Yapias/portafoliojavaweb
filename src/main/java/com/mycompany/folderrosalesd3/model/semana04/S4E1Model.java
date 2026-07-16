package com.mycompany.folderrosalesd3.model.semana04;

public class S4E1Model {
    private String tipoAuto;
    private int dias;
    private double km;

    // Constructor vacío
    public S4E1Model() {}

    // Constructor con parámetros
    public S4E1Model(String tipoAuto, int dias, double km) {
        this.tipoAuto = tipoAuto;
        this.dias = dias;
        this.km = km;
    }

    // 1. Obtener tarifa fija por día según la clase del auto
    public double getTarifaDiaria() {
        if (tipoAuto == null) return 0.0;
        switch (tipoAuto.toLowerCase()) {
            case "pequeño": return 15.0;
            case "mediano": return 20.0;
            case "grande":  return 30.0;
            default: return 0.0;
        }
    }

    // 2. Obtener la tarifa por kilómetro recorrido según la clase
    public double getTarifaKilometro() {
        if (tipoAuto == null) return 0.0;
        switch (tipoAuto.toLowerCase()) {
            case "pequeño": return 0.20;
            case "mediano": return 0.30;
            case "grande":  return 0.40;
            default: return 0.0;
        }
    }

    // 3. Calcular el costo base por los días rentados
    public double calcularCostoDias() {
        return getTarifaDiaria() * dias;
    }

    // 4. Calcular el costo por los kilómetros recorridos
    public double calcularCostoKm() {
        return getTarifaKilometro() * km;
    }

    // 5. Calcular el importe base (Subtotal)
    public double calcularImporteBase() {
        return calcularCostoDias() + calcularCostoKm();
    }

    // 6. Evaluar si el promedio de km supera los 10 km por día
    public boolean superaLimiteKmDiario() {
        if (dias <= 0) return false;
        return (km / dias) > 10.0;
    }

    // 7. Calcular el monto por recargo (2.5% del importe base si aplica)
    public double calcularMontoRecargo() {
        if (superaLimiteKmDiario()) {
            return calcularImporteBase() * 0.025;
        }
        return 0.0;
    }

    // 8. Calcular el total neto a pagar por el cliente
    public double calcularTotalPagar() {
        return calcularImporteBase() + calcularMontoRecargo();
    }

    // Getters y Setters
    public String getTipoAuto() { return tipoAuto; }
    public void setTipoAuto(String tipoAuto) { this.tipoAuto = tipoAuto; }

    public int getDias() { return dias; }
    public void setDias(int dias) { this.dias = dias; }

    public double getKm() { return km; }
    public void setKm(double km) { this.km = km; }
}