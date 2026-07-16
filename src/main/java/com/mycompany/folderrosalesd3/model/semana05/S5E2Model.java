package com.mycompany.folderrosalesd3.model.semana05;

import java.util.ArrayList;
import java.util.List;

public class S5E2Model {
    private int nTerminos;
    private List<String> terminosFraccionales;
    private List<Double> terminosDecimales;
    private double sumaTotal;

    // Constructor
    public S5E2Model(int nTerminos) {
        this.nTerminos = nTerminos;
        this.terminosFraccionales = new ArrayList<>();
        this.terminosDecimales = new ArrayList<>();
        this.sumaTotal = 0.0;
        generarYSumarSerie();
    }

    /**
     * Algoritmo iterativo que genera término por término de la serie fraccionaria
     * y acumula la suma de sus valores decimales.
     */
    private void generarYSumarSerie() {
        int numerador = 2;
        int denominador = 5;

        for (int i = 1; i <= this.nTerminos; i++) {
            // Guardamos la representación textual de la fracción (p. ej. "2/5")
            this.terminosFraccionales.add(numerador + "/" + denominador);
            
            // Calculamos el valor decimal exacto
            double valorDecimal = (double) numerador / denominador;
            this.terminosDecimales.add(Math.round(valorDecimal * 10000.0) / 10000.0); // Redondeo a 4 decimales
            
            // Acumulamos en la suma total de la mesa
            this.sumaTotal += valorDecimal;
            
            // Incrementos de la regla de formación de la serie
            numerador += 3;
            denominador += 4;
        }
        
        // Redondeo final de la suma acumulada a 4 decimales
        this.sumaTotal = Math.round(this.sumaTotal * 10000.0) / 10000.0;
    }

    // Métodos de acceso público (Single Responsibility Principle)
    public int getnTerminos() {
        return nTerminos;
    }

    public List<String> getTerminosFraccionales() {
        return terminosFraccionales;
    }

    public List<Double> getTerminosDecimales() {
        return terminosDecimales;
    }

    public double getSumaTotal() {
        return sumaTotal;
    }

    public double getPromedio() {
        if (nTerminos == 0) return 0.0;
        return Math.round((sumaTotal / nTerminos) * 10000.0) / 10000.0;
    }
}