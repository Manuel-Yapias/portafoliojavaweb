package com.mycompany.folderrosalesd3.controller.semana01;

import com.mycompany.folderrosalesd3.model.semana01.S1E7Model;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "S1E7Controller", urlPatterns = {"/S1E7Controller"})
public class S1E7Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        despacharVista(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            String input = request.getParameter("numero");
            
            // Validar que tenga exactamente 5 caracteres numéricos
            if (input == null || !input.matches("\\d{5}")) {
                request.setAttribute("error", "El número debe contener exactamente 5 dígitos.");
            } else {
                int numero = Integer.parseInt(input);
                S1E7Model modelo = new S1E7Model(numero);
                
                // Inyectar resultados calculados
                request.setAttribute("original", input);
                request.setAttribute("inverso", modelo.obtenerInverso()); // CORREGIDO AQUÍ
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Entrada inválida. Por favor ingresa un número entero.");
        }

        despacharVista(request, response);
    }

    // TAREA ÚNICA: Redireccionar el flujo al JSP
    private void despacharVista(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/html/semana01/S1E7.jsp").forward(request, response);
    }
}