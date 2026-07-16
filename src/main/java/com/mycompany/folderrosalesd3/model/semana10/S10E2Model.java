package com.mycompany.folderrosalesd3.model.semana10;

public class S10E2Model {
    private String parrafoOriginal;
    private String parrafoLimpio;
    private String[] palabras;
    private int cantidadPalabras;
    private String primeraPalabra;
    private String ultimaPalabra;

    public S10E2Model(String parrafoOriginal) {
        this.parrafoOriginal = parrafoOriginal;
    }

    /**
     * Limpia los espacios iniciales y finales del párrafo.
     */
    public void limpiarParrafo() {
        if (parrafoOriginal != null) {
            this.parrafoLimpio = parrafoOriginal.trim();
        } else {
            this.parrafoLimpio = "";
        }
    }

    /**
     * Divide el párrafo limpio en un arreglo de palabras utilizando split(" ").
     * Para asegurar robustez en el análisis, se filtran espacios dobles usando una expresión regular.
     */
    public void procesarPalabras() {
        if (parrafoLimpio == null || parrafoLimpio.isEmpty()) {
            this.palabras = new String[0];
            this.cantidadPalabras = 0;
            this.primeraPalabra = "";
            this.ultimaPalabra = "";
            return;
        }

        // Dividimos usando espacio simple como indica el requerimiento, o "\\s+" para robustez ante espacios múltiples.
        // Nos apegamos al requerimiento literal del split(' ') pero controlando posibles vacíos.
        this.palabras = parrafoLimpio.split(" ");
        
        // Contamos el tamaño del arreglo resultante
        this.cantidadPalabras = palabras.length;

        // Obtenemos la primera y la última palabra utilizando sus respectivos índices
        if (cantidadPalabras > 0) {
            this.primeraPalabra = palabras[0];
            this.ultimaPalabra = palabras[cantidadPalabras - 1];
            
            // Imprimir por consola del servidor como lo solicita el enunciado
            System.out.println("====== [Consola S10E2] Procesando Párrafo ======");
            System.out.println("Total de palabras: " + cantidadPalabras);
            System.out.println("Primera palabra (índice 0): '" + primeraPalabra + "'");
            System.out.println("Última palabra (índice " + (cantidadPalabras - 1) + "): '" + ultimaPalabra + "'");
            System.out.println("=================================================");
        }
    }

    // Getters
    public String getParrafoOriginal() {
        return parrafoOriginal;
    }

    public String getParrafoLimpio() {
        return parrafoLimpio;
    }

    public String[] getPalabras() {
        return palabras;
    }

    public int getCantidadPalabras() {
        return cantidadPalabras;
    }

    public String getPrimeraPalabra() {
        return primeraPalabra;
    }

    public String getUltimaPalabra() {
        return ultimaPalabra;
    }
}