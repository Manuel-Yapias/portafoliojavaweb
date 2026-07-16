package com.mycompany.folderrosalesd3.model.semana07;

public class S7E2Model {
    private String mensajeOriginal;
    private String mensajeCensurado;
    private int palabrasCensuradas;
    private static final String[] PALABRAS_PROHIBIDAS = {
        "trampa", "estafa", "robo", "hacker", "perdedor", "crupier", "truco"
    };

    public S7E2Model(String mensajeOriginal) {
        this.mensajeOriginal = mensajeOriginal != null ? mensajeOriginal.trim() : "";
        this.palabrasCensuradas = 0;
        this.mensajeCensurado = procesarMensaje();
    }

    private String procesarMensaje() {
        String temporal = this.mensajeOriginal;
        String temporalMinusculas = temporal.toLowerCase();
        
        for (String palabra : PALABRAS_PROHIBIDAS) {
            int indice = temporalMinusculas.indexOf(palabra);
            while (indice != -1) {
                this.palabrasCensuradas++;
                indice = temporalMinusculas.indexOf(palabra, indice + palabra.length());
            }
            temporal = temporal.replaceAll("(?i)" + palabra, "***");
        }
        return temporal;
    }

    public boolean fueMensajeModificado() {
        return this.palabrasCensuradas > 0;
    }

    public String getMensajeOriginal() { return mensajeOriginal; }
    public String getMensajeCensurado() { return mensajeCensurado; }
    public int getPalabrasCensuradas() { return palabrasCensuradas; }
}