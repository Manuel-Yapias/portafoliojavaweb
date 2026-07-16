package com.mycompany.folderrosalesd3.controller.semana01;

import com.mycompany.folderrosalesd3.model.semana01.S1E2Model;
import java.io.IOException;
// CAMBIAR javax POR jakarta AQUÍ:
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "S1E2Controller", urlPatterns = {"/S1E2Controller"})
public class S1E2Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        despacharVista(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            // 1. Extraer parámetro en un método exclusivo
            S1E2Model modelo = extraerParametros(request);

            // 2. Adjuntar los resultados del cálculo
            inyectarResultados(request, modelo);

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor, ingresa un valor de radio válido.");
        }

        despacharVista(request, response);
    }

    // TAREA ÚNICA: Capturar la entrada de texto y validar que sea numérico
    private S1E2Model extraerParametros(HttpServletRequest request) throws NumberFormatException {
        double radio = Double.parseDouble(request.getParameter("radio"));
        return new S1E2Model(radio);
    }

    // TAREA ÚNICA: Suministrar los resultados de cálculo a la petición
    private void inyectarResultados(HttpServletRequest request, S1E2Model modelo) {
        request.setAttribute("area", modelo.calcularArea());
        request.setAttribute("longitud", modelo.calcularLongitud());
        request.setAttribute("radio", request.getParameter("radio"));
    }

    // TAREA ÚNICA: Enviar la redirección de flujo a la interfaz JSP
    private void despacharVista(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/html/semana01/S1E2.jsp").forward(request, response);
    }
}