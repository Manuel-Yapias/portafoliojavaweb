package com.mycompany.folderrosalesd3.model;

public class S01E07Model {
    private int n;
    public S01E07Model(int n) { this.n = n; }
    public int invertir() {
        int inv = 0, temp = n;
        while(temp > 0) { inv = (inv * 10) + (temp % 10); temp /= 10; }
        return inv;
    }
}