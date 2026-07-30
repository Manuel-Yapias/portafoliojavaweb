package com.mycompany.folderrosalesd3.model.semana01;

public class S1E7Model {
    private int numero;

    public S1E7Model(int numero) {
        this.numero = numero;
    }

    // TAREA ÚNICA: Reversar el número manteniendo el formato de 5 dígitos
    public String obtenerInverso() {
        // Asegura que tenga exactamente 5 dígitos rellenando con ceros a la izquierda
        String cadenaOriginal = String.format("%05d", this.numero);
        return new StringBuilder(cadenaOriginal).reverse().toString();
    }
}