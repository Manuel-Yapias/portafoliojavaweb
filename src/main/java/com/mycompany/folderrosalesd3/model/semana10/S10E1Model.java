package com.mycompany.folderrosalesd3.model.semana10;

import java.util.ArrayList;
import java.util.List;

public class S10E1Model {
    private int numeroBase;
    private List<Integer> historialPotencias;
    private boolean desbordado;
    private String mensajeEstado;

    public S10E1Model(int numeroBase) {
        this.numeroBase = numeroBase;
        this.historialPotencias = new ArrayList<>();
        this.desbordado = false;
        this.mensajeEstado = "";
    }

    /**
     * Realiza multiplicaciones sucesivas por el número base original
     * empleando Math.multiplyExact para interceptar aritméticamente el overflow.
     */
    public void calcularPotenciasSucesivas() {
        int acumulado = numeroBase;
        historialPotencias.add(acumulado);

        try {
            // Bucle infinito seguro controlado por excepciones de desbordamiento
            while (true) {
                // Multiplicación exacta: lanza ArithmeticException si supera los límites de un int de 32 bits
                acumulado = Math.multiplyExact(acumulado, numeroBase);
                historialPotencias.add(acumulado);
            }
        } catch (ArithmeticException e) {
            this.desbordado = true;
            this.mensajeEstado = "¡ALERTA DE OVERFLOW DETECTADA! La siguiente operación aritmética superó el límite permitido para un entero de 32 bits (Integer.MAX_VALUE / MIN_VALUE).";
        }
    }

    // Getters
    public int getNumeroBase() {
        return numeroBase;
    }

    public List<Integer> getHistorialPotencias() {
        return historialPotencias;
    }

    public boolean isDesbordado() {
        return desbordado;
    }

    public String getMensajeEstado() {
        return mensajeEstado;
    }
}