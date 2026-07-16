package com.mycompany.folderrosalesd3.model.semana01;

public class S1E8Model {
    private int segundosTotales;

    public S1E8Model(int segundosTotales) {
        this.segundosTotales = segundosTotales;
    }

    // TAREA ÚNICA: Calcular las horas enteras
    public int calcularHoras() {
        return this.segundosTotales / 3600;
    }

    // TAREA ÚNICA: Calcular los minutos restantes
    public int calcularMinutos() {
        return (this.segundosTotales % 3600) / 60;
    }

    // TAREA ÚNICA: Calcular los segundos sobrantes
    public int calcularSegundos() {
        return this.segundosTotales % 60;
    }
}