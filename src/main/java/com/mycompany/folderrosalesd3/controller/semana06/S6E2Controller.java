package com.mycompany.folderrosalesd3.controller.semana06;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.mycompany.folderrosalesd3.model.semana06.S6E2Model;

@WebServlet(name = "S6E2Controller", urlPatterns = {"/S6E2Controller"})
public class S6E2Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/html/semana06/S6E2.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String ruta = request.getParameter("ruta");
        String calidad = request.getParameter("calidad");
        String cantidadStr = request.getParameter("cantidad");

        // Validar campos nulos o vacíos
        if (ruta == null || ruta.trim().isEmpty() || 
            calidad == null || calidad.trim().isEmpty() || 
            cantidadStr == null || cantidadStr.trim().isEmpty()) {
            
            request.setAttribute("error", "Complete todos los campos requeridos para simular la apuesta.");
            request.getRequestDispatcher("/html/semana06/S6E2.jsp").forward(request, response);
            return;
        }

        try {
            int cantidad = Integer.parseInt(cantidadStr);
            if (cantidad <= 0) {
                request.setAttribute("error", "La cantidad de boletos debe ser al menos 1.");
                request.getRequestDispatcher("/html/semana06/S6E2.jsp").forward(request, response);
                return;
            }

            // Procesar en el Modelo
            S6E2Model cotizacion = new S6E2Model(ruta, calidad, cantidad);
            
            // Adjuntar resultados
            request.setAttribute("resultado", cotizacion);

        } catch (NumberFormatException e) {
            request.setAttribute("error", "La cantidad de boletos debe tener un formato numérico válido.");
        }

        request.getRequestDispatcher("/html/semana06/S6E2.jsp").forward(request, response);
    }
}