package com.mycompany.folderrosalesd3.model.semana05;

public class S5E3Model {
    private long numeroOriginal;
    private int cantidadDigitos;
    private int sumaPares;
    private int sumaImpares;

    // Constructor
    public S5E3Model(long numero) {
        this.numeroOriginal = numero;
        this.cantidadDigitos = 0;
        this.sumaPares = 0;
        this.sumaImpares = 0;
        analizarNumero();
    }

    /**
     * Descompone el número entero dígito por dígito de forma iterativa 
     * para clasificar y sumar según sean pares o impares.
     */
    private void analizarNumero() {
        long temp = Math.abs(this.numeroOriginal);

        // Caso especial: si el número ingresado es exactamente 0
        if (temp == 0) {
            this.cantidadDigitos = 1;
            this.sumaPares = 0; // El dígito es 0, su suma es 0
            this.sumaImpares = 0;
            return;
        }

        while (temp > 0) {
            int digito = (int) (temp % 10);
            this.cantidadDigitos++;

            // Clasificación de dígitos pares (incluye el 0) e impares
            if (digito % 2 == 0) {
                this.sumaPares += digito;
            } else {
                this.sumaImpares += digito;
            }

            temp /= 10; // Reducir un dígito
        }
    }

    // Getters
    public long getNumeroOriginal() {
        return numeroOriginal;
    }

    public int getCantidadDigitos() {
        return cantidadDigitos;
    }

    public int getSumaPares() {
        return sumaPares;
    }

    public int getSumaImpares() {
        return sumaImpares;
    }
}