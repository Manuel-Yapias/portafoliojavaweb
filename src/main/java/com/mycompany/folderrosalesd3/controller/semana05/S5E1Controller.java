package com.mycompany.folderrosalesd3.controller.semana05;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.mycompany.folderrosalesd3.model.semana05.S5E1Model;

@WebServlet(name = "S5E1Controller", urlPatterns = {"/S5E1Controller"})
public class S5E1Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Carga inicial y limpia de la interfaz del crupier
        request.getRequestDispatcher("/html/semana05/S5E1.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String terminosStr = request.getParameter("terminos");
        
        // Validación de datos
        if (terminosStr == null || terminosStr.trim().isEmpty()) {
            request.setAttribute("error", "Debe ingresar el número de términos para repartir en la mesa.");
            request.getRequestDispatcher("/html/semana05/S5E1.jsp").forward(request, response);
            return;
        }

        try {
            int nTerminos = Integer.parseInt(terminosStr);

            if (nTerminos < 1) {
                request.setAttribute("error", "El número de términos de la serie debe ser como mínimo 1.");
                request.getRequestDispatcher("/html/semana05/S5E1.jsp").forward(request, response);
                return;
            }
            
            if (nTerminos > 100) {
                request.setAttribute("error", "Por razones de rendimiento del casino, el límite máximo permitido es de 100 términos.");
                request.getRequestDispatcher("/html/semana05/S5E1.jsp").forward(request, response);
                return;
            }

            // Crear el modelo procesando la serie repetitiva
            S5E1Model modeloSerie = new S5E1Model(nTerminos);

            // Inyectar en el scope de la petición
            request.setAttribute("resultado", modeloSerie);

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Debe ingresar un número entero válido.");
        }

        // Redirigir a la vista de la Semana 5 de manera consistente
        request.getRequestDispatcher("/html/semana05/S5E1.jsp").forward(request, response);
    }
}