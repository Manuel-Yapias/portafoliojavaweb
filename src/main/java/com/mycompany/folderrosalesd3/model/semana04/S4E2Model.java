package com.mycompany.folderrosalesd3.model.semana04;

public class S4E2Model {
    private int horasTrabajadas;
    private double tarifaHora;

    // Constructor vacío
    public S4E2Model() {}

    // Constructor con parámetros
    public S4E2Model(int horasTrabajadas, double tarifaHora) {
        this.horasTrabajadas = horasTrabajadas;
        this.tarifaHora = tarifaHora;
    }

    // 1. Calcular horas normales (máximo 40)
    public int getHorasNormales() {
        return Math.min(horasTrabajadas, 40);
    }

    // 2. Calcular horas extras totales
    public int getHorasExtrasTotales() {
        return Math.max(0, horasTrabajadas - 40);
    }

    // 3. Determinar cuántas de las horas extras se pagan al doble (máximo 8)
    public int getHorasDobles() {
        int extras = getHorasExtrasTotales();
        return Math.min(extras, 8);
    }

    // 4. Determinar cuántas de las horas extras se pagan al triple (el resto sobre 8)
    public int getHorasTriples() {
        int extras = getHorasExtrasTotales();
        return Math.max(0, extras - 8);
    }

    // 5. Calcular el pago por horas normales
    public double calcularPagoNormal() {
        return getHorasNormales() * tarifaHora;
    }

    // 6. Calcular el pago por horas extras dobles
    public double calcularPagoDobles() {
        return getHorasDobles() * (tarifaHora * 2);
    }

    // 7. Calcular el pago por horas extras triples
    public double calcularPagoTriples() {
        return getHorasTriples() * (tarifaHora * 3);
    }

    // 8. Calcular el total acumulado de dinero solo por horas extras
    public double calcularTotalExtras() {
        return calcularPagoDobles() + calcularPagoTriples();
    }

    // 9. Calcular el salario total a pagar (Normal + Extras)
    public double calcularSalarioTotal() {
        return calcularPagoNormal() + calcularTotalExtras();
    }

    // Getters y Setters
    public int getHorasTrabajadas() { return horasTrabajadas; }
    public void setHorasTrabajadas(int horasTrabajadas) { this.horasTrabajadas = horasTrabajadas; }

    public double getTarifaHora() { return tarifaHora; }
    public void setTarifaHora(double tarifaHora) { this.tarifaHora = tarifaHora; }
}