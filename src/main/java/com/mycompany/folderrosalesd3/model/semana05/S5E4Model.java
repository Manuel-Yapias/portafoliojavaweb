package com.mycompany.folderrosalesd3.model.semana05;

import java.util.ArrayList;
import java.util.List;

public class S5E4Model {
    private int n;
    private double sumaTotal;
    private List<Termino> detallesTerminos;

    // Subclase para almacenar el desglose de cada término de la serie
    public static class Termino {
        private int indice;
        private String representacion;
        private double valor;
        private double sumaAcumulada;

        public Termino(int indice, String representacion, double valor, double sumaAcumulada) {
            this.indice = indice;
            this.representacion = representacion;
            this.valor = valor;
            this.sumaAcumulada = sumaAcumulada;
        }

        public int getIndice() { return indice; }
        public String getRepresentacion() { return representacion; }
        public double getValor() { return valor; }
        public double getSumaAcumulada() { return sumaAcumulada; }
    }

    // Constructor
    public S5E4Model(int n) {
        this.n = n;
        this.detallesTerminos = new ArrayList<>();
        this.sumaTotal = 0.0;
        calcularSerie();
    }

    /**
     * Calcula la suma de los N términos utilizando estrictamente bucles do...while.
     */
    private void calcularSerie() {
        if (this.n <= 0) {
            return;
        }

        double suma = 0.0;
        int i = 1;

        // Bucle do-while principal para la serie
        do {
            // Calcular el factorial utilizando obligatoriamente un do-while interno
            double factorial = calcularFactorial(i);
            
            // Determinar el signo alternado (+ para impares, - para pares)
            double signo = (i % 2 == 1) ? 1.0 : -1.0;
            double valorTermino = signo * ((double) i / factorial);
            suma += valorTermino;

            // Formatear la representación visual del término
            String representacion;
            if (i == 1) {
                representacion = "1";
            } else {
                representacion = (signo > 0 ? "+ " : "- ") + i + " / " + i + "!";
            }

            detallesTerminos.add(new Termino(i, representacion, valorTermino, suma));
            i++;
        } while (i <= this.n);

        this.sumaTotal = suma;
    }

    /**
     * Calcula el factorial de un número utilizando un bucle do...while.
     */
    private double calcularFactorial(int num) {
        double f = 1.0;
        int j = 1;
        do {
            f *= j;
            j++;
        } while (j <= num);
        return f;
    }

    // Getters
    public int getN() { return n; }
    public double getSumaTotal() { return sumaTotal; }
    public List<Termino> getDetallesTerminos() { return detallesTerminos; }
}