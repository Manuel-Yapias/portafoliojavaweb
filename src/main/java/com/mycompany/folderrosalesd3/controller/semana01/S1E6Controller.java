package com.mycompany.folderrosalesd3.controller.semana01;

import com.mycompany.folderrosalesd3.model.semana01.S1E6Model;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "S1E6Controller", urlPatterns = {"/S1E6Controller"})
public class S1E6Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        despacharVista(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            // 1. Extraer y validar tipos de datos numéricos enteros
            int dividendo = Integer.parseInt(request.getParameter("dividendo"));
            int divisor = Integer.parseInt(request.getParameter("divisor"));

            // Validar división por cero en la capa lógica del controlador
            if (divisor == 0) {
                request.setAttribute("error", "La división por cero no está permitida en la mesa de juego.");
            } else {
                // 2. Instanciar modelo e inyectar resultados
                S1E6Model modelo = new S1E6Model(dividendo, divisor);
                inyectarResultados(request, modelo, dividendo, divisor);
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor, ingresa únicamente números enteros válidos.");
        }

        despacharVista(request, response);
    }

    // TAREA ÚNICA: Guardar los resultados y las entradas en el Request
    private void inyectarResultados(HttpServletRequest request, S1E6Model modelo, int dividendo, int divisor) {
        request.setAttribute("cociente", modelo.calcularCociente());
        request.setAttribute("residuo", modelo.calcularResiduo());
        request.setAttribute("dividendo", dividendo);
        request.setAttribute("divisor", divisor);
    }

    // TAREA ÚNICA: Enviar la redirección a la vista correspondiente
    private void despacharVista(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/html/semana01/S1E6.jsp").forward(request, response);
    }
}