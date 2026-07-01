package com.mycompany.folderrosalesd3.model;

public class S01E09Model {
    private double monto;
    public S01E09Model(double monto) { this.monto = monto; }
    public double getJosue() { return monto * 0.27; }
    public double getTamar() { return getJosue() * 0.85; }
    public double getDaniel() { return monto * 0.25; }
    public double getCaleb() { return (getJosue() + getDaniel()) * 0.23; }
    public double getDavid() { return monto - (getJosue() + getTamar() + getDaniel() + getCaleb()); }
}