package com.mycompany.folderrosalesd3.model.semana05;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class S5E6Model {
    private List<Producto> listaProductos;
    private int catA; // < 50
    private int catB; // >= 50 pero < 100
    private int catC; // >= 100 pero < 150
    private int catD; // >= 150
    
    // Estadísticas extra de la casa
    private int stockMaximo;
    private int stockMinimo;
    private double stockPromedio;

    public static class Producto {
        private String codigo;
        private int stock;

        public Producto(String codigo, int stock) {
            this.codigo = codigo;
            this.stock = stock;
        }

        public String getCodigo() { return codigo; }
        public int getStock() { return stock; }
    }

    // Constructor
    public S5E6Model() {
        this.listaProductos = new ArrayList<>();
        this.catA = 0;
        this.catB = 0;
        this.catC = 0;
        this.catD = 0;
        this.stockMaximo = 0;
        this.stockMinimo = 200;
        this.stockPromedio = 0.0;
        generarYAnalizarInventario();
    }

    /**
     * Algoritmo de generación pseudoaleatoria de stocks (0 a 200) 
     * para 100 productos simulados con su clasificación estadística.
     */
    private void generarYAnalizarInventario() {
        Random random = new Random();
        double sumaTotal = 0;

        for (int i = 1; i <= 100; i++) {
            // Genera enteros en el intervalo [0, 200]
            int stockAleatorio = random.nextInt(201); 
            String codigoProd = "PROD-" + String.format("%03d", i);
            
            listaProductos.add(new Producto(codigoProd, stockAleatorio));
            sumaTotal += stockAleatorio;

            // Clasificación de acuerdo a los límites requeridos
            if (stockAleatorio < 50) {
                this.catA++;
            } else if (stockAleatorio < 100) {
                this.catB++;
            } else if (stockAleatorio < 150) {
                this.catC++;
            } else {
                this.catD++;
            }

            // Hallar límites máximos y mínimos absolutos
            if (stockAleatorio > this.stockMaximo) {
                this.stockMaximo = stockAleatorio;
            }
            if (stockAleatorio < this.stockMinimo) {
                this.stockMinimo = stockAleatorio;
            }
        }

        this.stockPromedio = Math.round((sumaTotal / 100.0) * 100.0) / 100.0;
    }

    // Getters
    public List<Producto> getListaProductos() { return listaProductos; }
    public int getCatA() { return catA; }
    public int getCatB() { return catB; }
    public int getCatC() { return catC; }
    public int getCatD() { return catD; }
    public int getStockMaximo() { return stockMaximo; }
    public int getStockMinimo() { return stockMinimo; }
    public double getStockPromedio() { return stockPromedio; }
}