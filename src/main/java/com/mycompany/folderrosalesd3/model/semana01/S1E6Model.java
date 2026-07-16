package com.mycompany.folderrosalesd3.model.semana01;

public class S1E6Model {
    private int dividendo;
    private int divisor;

    public S1E6Model(int dividendo, int divisor) {
        this.dividendo = dividendo;
        this.divisor = divisor;
    }

    // TAREA ÚNICA: Calcular el cociente entero (división entera)
    public int calcularCociente() {
        return this.dividendo / this.divisor;
    }

    // TAREA ÚNICA: Calcular el residuo (operador módulo %)
    public int calcularResiduo() {
        return this.dividendo % this.divisor;
    }
}