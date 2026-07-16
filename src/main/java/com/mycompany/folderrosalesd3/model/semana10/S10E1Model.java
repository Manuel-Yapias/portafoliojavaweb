package com.mycompany.folderrosalesd3.model.semana10;

public class S10E1Model {
    private double x1, x2;
    private String mensaje;

    public void resolver(double a, double b, double c) {
        double discriminante = Math.pow(b, 2) - (4 * a * c);
        if (discriminante >= 0) {
            this.x1 = (-b + Math.sqrt(discriminante)) / (2 * a);
            this.x2 = (-b - Math.sqrt(discriminante)) / (2 * a);
            this.mensaje = "Raíces reales calculadas.";
        } else {
            this.mensaje = "No existen raíces reales (Discriminante negativo).";
        }
    }
    public double getX1() { return x1; }
    public double getX2() { return x2; }
    public String getMensaje() { return mensaje; }
}