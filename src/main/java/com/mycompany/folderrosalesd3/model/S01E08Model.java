package com.mycompany.folderrosalesd3.model;

public class S01E08Model {
    private int s;
    public S01E08Model(int s) { this.s = s; }
    public int getHoras() { return s / 3600; }
    public int getMinutos() { return (s % 3600) / 60; }
    public int getSegundos() { return s % 60; }
}   