package com.mycompany.folderrosalesd3.model.semana05;

import java.util.ArrayList;
import java.util.List;

public class S5E1Model {
    private int nTerminos;
    private List<Integer> terminos;
    private int sumaTotal;

    // Constructor
    public S5E1Model(int nTerminos) {
        this.nTerminos = nTerminos;
        this.terminos = new ArrayList<>();
        this.sumaTotal = 0;
        generarYSumarSerie();
    }

    /**
     * Aplica el principio de estructuras repetitivas para calcular
     * término por término de la serie (3, 10, 17, 24...) y acumular la suma.
     */
    private void generarYSumarSerie() {
        int terminoActual = 3; // Primer término de la serie
        for (int i = 1; i <= this.nTerminos; i++) {
            this.terminos.add(terminoActual);
            this.sumaTotal += terminoActual;
            terminoActual += 7; // Razón de cambio constante
        }
    }

    // Métodos de acceso con responsabilidad única
    public int getnTerminos() {
        return nTerminos;
    }

    public List<Integer> getTerminos() {
        return terminos;
    }

    public int getSumaTotal() {
        return sumaTotal;
    }

    /**
     * Calcula el valor promedio de las cartas o fichas generadas en la mesa.
     */
    public double getPromedio() {
        if (nTerminos == 0) return 0.0;
        return (double) sumaTotal / nTerminos;
    }
}