package com.mycompany.folderrosalesd3.controller.semana06;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.mycompany.folderrosalesd3.model.semana06.S6E3Model;

@WebServlet(name = "S6E3Controller", urlPatterns = {"/S6E3Controller"})
public class S6E3Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/html/semana06/S6E3.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String categoria = request.getParameter("categoria");
        String promedioStr = request.getParameter("promedio");

        // Validaciones de nulos/vacíos
        if (categoria == null || categoria.trim().isEmpty() || 
            promedioStr == null || promedioStr.trim().isEmpty()) {
            
            request.setAttribute("error", "Complete los parámetros requeridos de la postulación.");
            request.getRequestDispatcher("/html/semana06/S6E3.jsp").forward(request, response);
            return;
        }

        try {
            double promedio = Double.parseDouble(promedioStr);
            if (promedio < 0.0 || promedio > 20.0) {
                request.setAttribute("error", "El promedio debe estar estrictamente comprendido entre 0.00 y 20.00.");
                request.getRequestDispatcher("/html/semana06/S6E3.jsp").forward(request, response);
                return;
            }

            // Procesar en el Modelo
            S6E3Model becado = new S6E3Model(categoria, promedio);
            
            // Adjuntar resultado
            request.setAttribute("resultado", becado);

        } catch (NumberFormatException e) {
            request.setAttribute("error", "El formato del promedio académico debe ser un número decimal (p. ej. 15.5).");
        }

        request.getRequestDispatcher("/html/semana06/S6E3.jsp").forward(request, response);
    }
}