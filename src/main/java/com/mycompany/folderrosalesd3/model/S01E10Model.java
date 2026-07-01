package com.mycompany.folderrosalesd3.model;

public class S01E10Model {
    private double m;
    public S01E10Model(double m) { this.m = m; }
    public double getAlquiler() { return m * 0.23; }
    public double getPublicidad() { return m * 0.07; }
    public double getTransporte() { return m * 0.26; }
    public double getServicios() { return m * 0.12; }
    public double getDecoracion() { return m * 0.21; }
    public double getVarios() { return m * 0.11; }
}