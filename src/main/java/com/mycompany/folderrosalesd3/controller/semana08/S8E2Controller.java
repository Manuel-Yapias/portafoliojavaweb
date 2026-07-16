package com.mycompany.folderrosalesd3.controller.semana08;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.mycompany.folderrosalesd3.model.semana08.S8E2Model;

@WebServlet(name = "S8E2Controller", urlPatterns = {"/S8E2Controller"})
public class S8E2Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/html/semana08/S8E2.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String capitalStr = request.getParameter("capital");
        String tasaStr = request.getParameter("tasa");
        String tiempoStr = request.getParameter("tiempo");

        if (capitalStr == null || tasaStr == null || tiempoStr == null ||
            capitalStr.isEmpty() || tasaStr.isEmpty() || tiempoStr.isEmpty()) {
            request.setAttribute("error", "Todos los campos de la proyección financiera son obligatorios.");
            request.getRequestDispatcher("/html/semana08/S8E2.jsp").forward(request, response);
            return;
        }

        try {
            double capital = Double.parseDouble(capitalStr);
            double tasa = Double.parseDouble(tasaStr);
            double tiempo = Double.parseDouble(tiempoStr);

            if (capital <= 0 || tasa <= 0 || tiempo <= 0) {
                request.setAttribute("error", "Los parámetros numéricos deben ser estrictamente positivos.");
                request.getRequestDispatcher("/html/semana08/S8E2.jsp").forward(request, response);
                return;
            }

            // Instancia del Modelo que encapsula los datos
            S8E2Model proyeccion = new S8E2Model(capital, tasa, tiempo);

            // Inyección del Modelo para la Vista
            request.setAttribute("proyeccion", proyeccion);
            request.setAttribute("exito", true);

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Error en el formato de entrada. Por favor, use números válidos.");
        }

        request.getRequestDispatcher("/html/semana08/S8E2.jsp").forward(request, response);
    }
}