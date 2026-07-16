package com.mycompany.folderrosalesd3.controller.semana05;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.mycompany.folderrosalesd3.model.semana05.S5E4Model;

@WebServlet(name = "S5E4Controller", urlPatterns = {"/S5E4Controller"})
public class S5E4Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/html/semana05/S5E4.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nStr = request.getParameter("terminos");

        if (nStr == null || nStr.trim().isEmpty()) {
            request.setAttribute("error", "Debe ingresar el número de términos.");
            request.getRequestDispatcher("/html/semana05/S5E4.jsp").forward(request, response);
            return;
        }

        try {
            int n = Integer.parseInt(nStr.trim());

            if (n <= 0) {
                request.setAttribute("error", "La cantidad de términos debe ser un entero mayor que cero.");
            } else if (n > 20) {
                // Validación para evitar desbordamiento del tipo double en factoriales gigantes
                request.setAttribute("error", "Por estabilidad matemática, se permite un máximo de 20 términos.");
            } else {
                // Procesar cálculo mediante el Modelo
                S5E4Model calculo = new S5E4Model(n);
                request.setAttribute("resultado", calculo);
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Ingrese un valor numérico entero válido.");
        }

        request.getRequestDispatcher("/html/semana05/S5E4.jsp").forward(request, response);
    }
}