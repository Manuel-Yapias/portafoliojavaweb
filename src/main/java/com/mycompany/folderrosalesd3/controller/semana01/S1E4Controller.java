package com.mycompany.folderrosalesd3.controller.semana01;

import com.mycompany.folderrosalesd3.model.semana01.S1E4Model;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "S1E4Controller", urlPatterns = {"/S1E4Controller"})
public class S1E4Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        despacharVista(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            // 1. Extraer parámetros con un método exclusivo
            S1E4Model modelo = extraerParametros(request);

            // 2. Adjuntar los resultados calculados
            inyectarResultados(request, modelo);

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor, ingresa únicamente valores numéricos válidos.");
        }

        despacharVista(request, response);
    }

    // TAREA ÚNICA: Obtener y parsear las entradas del formulario
    private S1E4Model extraerParametros(HttpServletRequest request) throws NumberFormatException {
        double radio = Double.parseDouble(request.getParameter("radio"));
        double altura = Double.parseDouble(request.getParameter("altura"));
        return new S1E4Model(radio, altura);
    }

    // TAREA ÚNICA: Registrar los cálculos en el Request Scope
    private void inyectarResultados(HttpServletRequest request, S1E4Model modelo) {
        request.setAttribute("area", modelo.calcularArea());
        request.setAttribute("volumen", modelo.calcularVolumen());
        request.setAttribute("radio", request.getParameter("radio"));
        request.setAttribute("altura", request.getParameter("altura"));
    }

    // TAREA ÚNICA: Enviar el flujo hacia la vista JSP
    private void despacharVista(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/html/semana01/S1E4.jsp").forward(request, response);
    }
}