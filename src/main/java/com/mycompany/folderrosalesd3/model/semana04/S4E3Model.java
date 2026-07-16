package com.mycompany.folderrosalesd3.model.semana04;

public class S4E3Model {
    private String diaSemana;
    private int horaEntrada;
    private int minEntrada;
    private int horaSalida;
    private int minSalida;

    public S4E3Model() {}

    public S4E3Model(String diaSemana, int horaEntrada, int minEntrada, int horaSalida, int minSalida) {
        this.diaSemana = diaSemana;
        this.horaEntrada = horaEntrada;
        this.minEntrada = minEntrada;
        this.horaSalida = horaSalida;
        this.minSalida = minSalida;
    }

    // 1. Obtener la tarifa por hora según el día seleccionado
    public double getTarifaPorHora() {
        if (diaSemana == null) return 0.0;
        switch (diaSemana.toLowerCase()) {
            case "lunes-jueves": 
                return 3.5;
            case "viernes-sabado": 
                return 4.5;
            case "domingo": 
                return 2.5;
            default: 
                return 0.0;
        }
    }

    // 2. Calcular los minutos totales transcurridos
    public int calcularMinutosTotales() {
        int entradaEnMinutos = (horaEntrada * 60) + minEntrada;
        int salidaEnMinutos = (horaSalida * 60) + minSalida;

        // Manejo de cruce de medianoche
        if (salidaEnMinutos < entradaEnMinutos) {
            salidaEnMinutos += 24 * 60; // Añadir 1440 minutos (un día)
        }

        return salidaEnMinutos - entradaEnMinutos;
    }

    // 3. Convertir minutos totales a formato legible (Horas y Minutos)
    public int getHorasTranscurridasVisuales() {
        return calcularMinutosTotales() / 60;
    }

    public int getMinutosRestantesVisuales() {
        return calcularMinutosTotales() % 60;
    }

    // 4. Calcular el número de horas a facturar (Aplicando "Hora o Fracción")
    public int calcularHorasAFacturar() {
        int minutosTotales = calcularMinutosTotales();
        if (minutosTotales == 0) return 0;
        
        int horasCompletas = minutosTotales / 60;
        int residuoMinutos = minutosTotales % 60;

        // Si hay una fracción de minuto, se cobra como una hora completa adicional
        if (residuoMinutos > 0) {
            return horasCompletas + 1;
        }
        return horasCompletas;
    }

    // 5. Calcular el total neto a pagar por el cliente
    public double calcularTotalPagar() {
        return calcularHorasAFacturar() * getTarifaPorHora();
    }

    // Getters y Setters
    public String getDiaSemana() { return diaSemana; }
    public void setDiaSemana(String diaSemana) { this.diaSemana = diaSemana; }

    public int getHoraEntrada() { return horaEntrada; }
    public void setHoraEntrada(int horaEntrada) { this.horaEntrada = horaEntrada; }

    public int getMinEntrada() { return minEntrada; }
    public void setMinEntrada(int minEntrada) { this.minEntrada = minEntrada; }

    public int getHoraSalida() { return horaSalida; }
    public void setHoraSalida(int horaSalida) { this.horaSalida = horaSalida; }

    public int getMinSalida() { return minSalida; }
    public void setMinSalida(int minSalida) { this.minSalida = minSalida; }
}