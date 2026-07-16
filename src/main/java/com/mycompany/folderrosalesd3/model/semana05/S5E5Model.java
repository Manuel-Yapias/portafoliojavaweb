package com.mycompany.folderrosalesd3.model.semana05;

public class S5E5Model {
    private String producto;
    private double precio;
    private int cantidad;
    private double importe;

    // Constructor vacío
    public S5E5Model() {}

    // Constructor completo para registrar una venta
    public S5E5Model(String producto, int cantidad) {
        this.producto = producto;
        this.cantidad = cantidad;
        this.precio = obtenerPrecioProducto(producto);
        this.importe = this.precio * this.cantidad;
    }

    /**
     * Asigna el precio oficial de acuerdo al catálogo establecido.
     */
    public static double obtenerPrecioProducto(String producto) {
        switch (producto) {
            case "Cuadernos LayConsa": return 1.50;
            case "Cuadernos Justus":   return 1.90;
            case "Cuadernos StanFord": return 3.50;
            case "Cuadernos David":    return 2.50;
            case "Cuadernos College":  return 3.00;
            case "Cuadernos Alpha":    return 4.50;
            default: return 0.0;
        }
    }

    // Getters y Setters
    public String getProducto() { return producto; }
    public void setProducto(String producto) { this.producto = producto; }

    public double getPrecio() { return precio; }
    public void setPrecio(double precio) { this.precio = precio; }

    public int getCantidad() { return cantidad; }
    public void setCantidad(int cantidad) { this.cantidad = cantidad; }

    public double getImporte() { return importe; }
    public void setImporte(double importe) { this.importe = importe; }
}