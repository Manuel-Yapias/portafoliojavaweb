package com.mycompany.folderrosalesd3.model.semana04;

public class S4E4Model {
    private double nota1;
    private double nota2;
    private double nota3;

    public S4E4Model() {}

    public S4E4Model(double nota1, double nota2, double nota3) {
        this.nota1 = nota1;
        this.nota2 = nota2;
        this.nota3 = nota3;
    }

    // Determinar si aplica el beneficio a la PC3 y retornar la nota final modificada
    // Se calcula sin operadores lógicos (&&, ||)
    public double getNota3ConBonificacion() {
        double notaFinalPC3 = nota3;
        
        // "No menor que 10" equivale matemáticamente a nota3 >= 10
        if (nota3 >= 10) {
            notaFinalPC3 = nota3 + 2;
        }
        
        // Considerar que la nota máxima es de 20 puntos
        return Math.min(notaFinalPC3, 20.0);
    }

    // Saber si se le otorgó efectivamente el beneficio (para la vista)
    public boolean tieneBonificacion() {
        return nota3 >= 10;
    }

    // Calcular el promedio final de las tres prácticas
    public double calcularPromedioFinal() {
        double pc3Final = getNota3ConBonificacion();
        return (nota1 + nota2 + pc3Final) / 3.0;
    }

    // Getters y Setters básicos
    public double getNota1() { return nota1; }
    public void setNota1(double nota1) { this.nota1 = nota1; }

    public double getNota2() { return nota2; }
    public void setNota2(double nota2) { this.nota2 = nota2; }

    public double getNota3() { return nota3; }
    public void setNota3(double nota3) { this.nota3 = nota3; }
}