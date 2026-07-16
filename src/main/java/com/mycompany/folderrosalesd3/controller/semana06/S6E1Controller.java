package com.mycompany.folderrosalesd3.controller.semana06;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.mycompany.folderrosalesd3.model.semana06.S6E1Model;

@WebServlet(name = "S6E1Controller", urlPatterns = {"/S6E1Controller"})
public class S6E1Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirigir a la vista de la mesa de cartas
        request.getRequestDispatcher("/html/semana06/S6E1.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String tipoChocolate = request.getParameter("tipoChocolate");
        String cantidadStr = request.getParameter("cantidad");
        
        // Validación básica de parámetros
        if (tipoChocolate == null || tipoChocolate.trim().isEmpty() || cantidadStr == null || cantidadStr.trim().isEmpty()) {
            request.setAttribute("error", "Faltan datos obligatorios para jugar la mano.");
            request.getRequestDispatcher("/html/semana06/S6E1.jsp").forward(request, response);
            return;
        }

        try {
            int cantidad = Integer.parseInt(cantidadStr);
            if (cantidad <= 0) {
                request.setAttribute("error", "La cantidad de chocolates debe ser mayor a cero.");
                request.getRequestDispatcher("/html/semana06/S6E1.jsp").forward(request, response);
                return;
            }

            // Instanciación del Modelo y procesamiento
            S6E1Model liquidacion = new S6E1Model(tipoChocolate, cantidad);
            
            // Inyectamos el resultado en la mesa
            request.setAttribute("resultado", liquidacion);

        } catch (NumberFormatException e) {
            request.setAttribute("error", "La cantidad ingresada no tiene un formato numérico válido.");
        }

        request.getRequestDispatcher("/html/semana06/S6E1.jsp").forward(request, response);
    }
}