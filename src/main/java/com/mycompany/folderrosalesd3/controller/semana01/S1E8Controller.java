package com.mycompany.folderrosalesd3.controller.semana01;

import com.mycompany.folderrosalesd3.model.semana01.S1E8Model;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "S1E8Controller", urlPatterns = {"/S1E8Controller"})
public class S1E8Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        despacharVista(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            // 1. Extraer y validar el parámetro de entrada
            int segundosTotales = Integer.parseInt(request.getParameter("segundosTotales"));

            if (segundosTotales < 0) {
                request.setAttribute("error", "La cantidad de segundos no puede ser un valor negativo.");
            } else {
                // 2. Instanciar el modelo de negocio
                S1E8Model modelo = new S1E8Model(segundosTotales);
                
                // 3. Inyectar resultados calculados para la vista
                inyectarResultados(request, modelo, segundosTotales);
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor, ingresa un número entero de segundos válido.");
        }

        despacharVista(request, response);
    }

    // TAREA ÚNICA: Guardar los valores procesados en el Request Scope
    private void inyectarResultados(HttpServletRequest request, S1E8Model modelo, int segundosTotales) {
        request.setAttribute("horas", modelo.calcularHoras());
        request.setAttribute("minutos", modelo.calcularMinutos());
        request.setAttribute("segundos", modelo.calcularSegundos());
        request.setAttribute("segundosTotales", segundosTotales);
    }

    // TAREA ÚNICA: Despachar el flujo a la vista JSP correspondiente
    private void despacharVista(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/html/semana01/S1E8.jsp").forward(request, response);
    }
}