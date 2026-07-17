package com.mycompany.folderrosalesd3.model.semana12;

public class S12E1Model {
    private String titulo;
    private String plataforma;
    private String versionJava;

    public S12E1Model() {
        this.titulo = "Manual de Despliegue en la Nube (CI/CD)";
        this.plataforma = "Render PaaS & GitHub Flow";
        this.versionJava = "Java 17 (Jakarta EE) / Maven / Docker";
    }

    public String getTitulo() { return titulo; }
    public String getPlataforma() { return plataforma; }
    public String getVersionJava() { return versionJava; }
}