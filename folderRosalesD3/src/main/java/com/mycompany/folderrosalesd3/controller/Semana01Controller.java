package com.mycompany.folderrosalesd3.controller;

import com.mycompany.folderrosalesd3.model.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class Semana01Controller extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String ej = request.getParameter("ej");
        
        switch (ej) {
    case "1": {
        double b = Double.parseDouble(request.getParameter("base"));
        double h = Double.parseDouble(request.getParameter("altura"));
        S01E01Model m = new S01E01Model(b, h);
        request.setAttribute("res1", m.calcularArea());
        request.setAttribute("res2", m.calcularPerimetro());
        break;
    }
    case "2": {
        double r = Double.parseDouble(request.getParameter("radio"));
        S01E02Model m = new S01E02Model(r);
        request.setAttribute("res1", m.calcularArea());
        request.setAttribute("res2", m.calcularCircunferencia());
        break;
    }
    case "3": {
        double B = Double.parseDouble(request.getParameter("baseMayor"));
        double b = Double.parseDouble(request.getParameter("baseMenor"));
        double h = Double.parseDouble(request.getParameter("altura"));
        S01E03Model m = new S01E03Model(B, b, h);
        request.setAttribute("res1", m.calcularArea());
        break;
    }
    case "4": {
        double r = Double.parseDouble(request.getParameter("radio"));
        double h = Double.parseDouble(request.getParameter("altura"));
        S01E04Model m = new S01E04Model(r, h);
        request.setAttribute("res1", m.calcularAreaTotal());
        request.setAttribute("res2", m.calcularVolumen());
        break;
    }
    case "5": {
        double l = Double.parseDouble(request.getParameter("lado"));
        S01E05Model m = new S01E05Model(l);
        request.setAttribute("res1", m.calcularArea());
        request.setAttribute("res2", m.calcularVolumen());
        break;
    }
    case "6": {
        int n1 = Integer.parseInt(request.getParameter("n1"));
        int n2 = Integer.parseInt(request.getParameter("n2"));
        S01E06Model m = new S01E06Model(n1, n2);
        request.setAttribute("res1", m.getCociente());
        request.setAttribute("res2", m.getResiduo());
        break;
    }
    case "7": {
        int n = Integer.parseInt(request.getParameter("n"));
        S01E07Model m = new S01E07Model(n);
        request.setAttribute("res1", m.invertir());
        break;
    }
    case "8": {
        int s = Integer.parseInt(request.getParameter("segundos"));
        S01E08Model m = new S01E08Model(s);
        request.setAttribute("res1", m.getHoras());
        request.setAttribute("res2", m.getMinutos());
        request.setAttribute("res3", m.getSegundos());
        break;
    }
    case "9": {
        double mnt = Double.parseDouble(request.getParameter("monto"));
        S01E09Model m = new S01E09Model(mnt);
        request.setAttribute("res1", m.getJosue());
        request.setAttribute("res2", m.getTamar());
        request.setAttribute("res3", m.getDaniel());
        request.setAttribute("res4", m.getCaleb());
        request.setAttribute("res5", m.getDavid());
        break;
    }
    case "10": {
        double mnt = Double.parseDouble(request.getParameter("monto"));
        S01E10Model m = new S01E10Model(mnt);
        request.setAttribute("res1", m.getAlquiler());
        request.setAttribute("res2", m.getPublicidad());
        request.setAttribute("res3", m.getTransporte());
        request.setAttribute("res4", m.getServicios());
        request.setAttribute("res5", m.getDecoracion());
        request.setAttribute("res6", m.getVarios());
        break;
    }
}
        
        request.setAttribute("ej", ej);
        request.getRequestDispatcher("html/semana01/ejerciciomaestro.jsp").forward(request, response);
    }
}
