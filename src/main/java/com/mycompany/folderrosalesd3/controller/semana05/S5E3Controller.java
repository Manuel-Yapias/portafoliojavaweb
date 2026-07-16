package com.mycompany.folderrosalesd3.controller.semana05;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.mycompany.folderrosalesd3.model.semana05.S5E3Model;

@WebServlet(name = "S5E3Controller", urlPatterns = {"/S5E3Controller"})
public class S5E3Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/html/semana05/S5E3.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String numeroStr = request.getParameter("numero");

        if (numeroStr == null || numeroStr.trim().isEmpty()) {
            request.setAttribute("error", "Debe ingresar un número entero para comenzar el conteo.");
            request.getRequestDispatcher("/html/semana05/S5E3.jsp").forward(request, response);
            return;
        }

        try {
            // Se utiliza long para soportar números grandes (hasta 19 dígitos)
            long numero = Long.parseLong(numeroStr.trim());

            // Procesar datos mediante el Modelo
            S5E3Model analizado = new S5E3Model(numero);
            request.setAttribute("resultado", analizado);

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor, ingrese un número entero válido sin decimales.");
        }

        request.getRequestDispatcher("/html/semana05/S5E3.jsp").forward(request, response);
    }
}