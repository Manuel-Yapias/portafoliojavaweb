package com.mycompany.folderrosalesd3.controller.semana01;

import com.mycompany.folderrosalesd3.model.semana01.S1E3Model;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "S1E3Controller", urlPatterns = {"/S1E3Controller"})
public class S1E3Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        despacharVista(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            // 1. Extraer los parámetros de forma aislada
            S1E3Model modelo = extraerParametros(request);

            // 2. Adjuntar los resultados calculados
            inyectarResultados(request, modelo);

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor, ingresa únicamente valores numéricos válidos.");
        }

        despacharVista(request, response);
    }

    // TAREA ÚNICA: Obtener y parsear los datos de entrada
    private S1E3Model extraerParametros(HttpServletRequest request) throws NumberFormatException {
        double baseMenor = Double.parseDouble(request.getParameter("baseMenor"));
        double baseMayor = Double.parseDouble(request.getParameter("baseMayor"));
        double altura = Double.parseDouble(request.getParameter("altura"));
        return new S1E3Model(baseMenor, baseMayor, altura);
    }

    // TAREA ÚNICA: Enviar resultados y persistir las cajas de texto de la vista
    private void inyectarResultados(HttpServletRequest request, S1E3Model modelo) {
        request.setAttribute("area", modelo.calcularArea());
        request.setAttribute("baseMenor", request.getParameter("baseMenor"));
        request.setAttribute("baseMayor", request.getParameter("baseMayor"));
        request.setAttribute("altura", request.getParameter("altura"));
    }

    // TAREA ÚNICA: Despachar el servlet hacia el archivo JSP
    private void despacharVista(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/html/semana01/S1E3.jsp").forward(request, response);
    }
}