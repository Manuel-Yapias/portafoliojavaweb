package com.mycompany.folderrosalesd3.controller.semana01;

import com.mycompany.folderrosalesd3.model.semana01.S1E5Model;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "S1E5Controller", urlPatterns = {"/S1E5Controller"})
public class S1E5Controller extends HttpServlet {

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
            S1E5Model modelo = extraerParametros(request);

            // 2. Adjuntar los resultados calculados
            inyectarResultados(request, modelo);

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor, ingresa un valor numérico válido para el lado del cubo.");
        }

        despacharVista(request, response);
    }

    // TAREA ÚNICA: Leer la entrada y validar que sea un valor numérico
    private S1E5Model extraerParametros(HttpServletRequest request) throws NumberFormatException {
        double lado = Double.parseDouble(request.getParameter("lado"));
        return new S1E5Model(lado);
    }

    // TAREA ÚNICA: Inyectar los resultados en el Request Scope
    private void inyectarResultados(HttpServletRequest request, S1E5Model modelo) {
        request.setAttribute("area", modelo.calcularArea());
        request.setAttribute("volumen", modelo.calcularVolumen());
        request.setAttribute("lado", request.getParameter("lado"));
    }

    // TAREA ÚNICA: Despachar el flujo de redirección hacia la vista JSP
    private void despacharVista(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/html/semana01/S1E5.jsp").forward(request, response);
    }
}