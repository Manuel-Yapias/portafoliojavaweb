package com.mycompany.folderrosalesd3.model.semana07;

public class S7E1Model {
    private String numeroTarjeta;

    public S7E1Model(String numeroTarjeta) {
        // Limpiamos espacios o caracteres extraños que el usuario pueda meter
        this.numeroTarjeta = numeroTarjeta != null ? numeroTarjeta.replaceAll("\\s+", "") : "";
    }

    // Validación rigurosa de longitud exacta de 16 dígitos numéricos
    public boolean validarTarjeta() {
        return numeroTarjeta.matches("^\\d{16}$");
    }

    // Implementación exacta del enunciado: substring para extraer los últimos 4 y repeat para concatenar 12 asteriscos
    public String enmascarar() {
        String ultimosCuatro = numeroTarjeta.substring(12); // Extrae desde el índice 12 al final (longitud 16)
        String asteriscos = "*".repeat(12);
        return asteriscos + ultimosCuatro;
    }

    public String getNumeroTarjeta() {
        return numeroTarjeta;
    }
}