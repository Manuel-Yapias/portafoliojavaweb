package com.mycompany.folderrosalesd3.controller.semana01;

import com.mycompany.folderrosalesd3.model.semana01.S1E1Model;
import java.io.IOException;
// CAMBIAR javax POR jakarta AQUÍ:
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "S1E1Controller", urlPatterns = {"/S1E1Controller"})
public class S1E1Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        despacharVista(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            // 1. Un método exclusivo para extraer la información
            S1E1Model modelo = extraerParametros(request);

            // 2. Un método exclusivo para inyectar los resultados calculados
            inyectarResultados(request, modelo);

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor, ingresa únicamente valores numéricos válidos.");
        }

        despacharVista(request, response);
    }

    // TAREA ÚNICA: Capturar y transformar los datos de la petición HTTP
    private S1E1Model extraerParametros(HttpServletRequest request) throws NumberFormatException {
        double base = Double.parseDouble(request.getParameter("base"));
        double altura = Double.parseDouble(request.getParameter("altura"));
        return new S1E1Model(base, altura);
    }

    // TAREA ÚNICA: Preparar los atributos calculados para la vista JSP
    private void inyectarResultados(HttpServletRequest request, S1E1Model modelo) {
        request.setAttribute("area", modelo.calcularArea());
        request.setAttribute("perimetro", modelo.calcularPerimetro());
        request.setAttribute("base", request.getParameter("base"));
        request.setAttribute("altura", request.getParameter("altura"));
    }

    // TAREA ÚNICA: Redireccionar el flujo hacia la interfaz de usuario
    private void despacharVista(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/html/semana01/S1E1.jsp").forward(request, response);
    }
}