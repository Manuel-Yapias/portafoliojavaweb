package com.mycompany.folderrosalesd3.controller.semana01;

import com.mycompany.folderrosalesd3.model.semana01.S1E10Model;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "S1E10Controller", urlPatterns = {"/S1E10Controller"})
public class S1E10Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        despacharVista(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            // 1. Extraer y validar el monto total a invertir
            double monto = Double.parseDouble(request.getParameter("monto"));

            if (monto <= 0) {
                request.setAttribute("error", "El monto de inversión debe ser un número positivo mayor que cero.");
            } else {
                // 2. Instanciar el modelo de negocio
                S1E10Model modelo = new S1E10Model(monto);
                
                // 3. Propagar todos los montos calculados al request
                inyectarResultados(request, modelo);
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor, ingresa una cantidad numérica válida.");
        }

        despacharVista(request, response);
    }

    // TAREA ÚNICA: Guardar los valores calculados en el Request Scope
    private void inyectarResultados(HttpServletRequest request, S1E10Model modelo) {
        request.setAttribute("montoOriginal", modelo.getMontoInvertir());
        request.setAttribute("alquiler", modelo.calcularAlquiler());
        request.setAttribute("publicidad", modelo.calcularPublicidad());
        request.setAttribute("transporte", modelo.calcularTransporte());
        request.setAttribute("servicios", modelo.calcularServicios());
        request.setAttribute("decoracion", modelo.calcularDecoracion());
        request.setAttribute("gastosVarios", modelo.calcularGastosVarios());
    }

    // TAREA ÚNICA: Redireccionar el flujo al archivo JSP
    private void despacharVista(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/html/semana01/S1E10.jsp").forward(request, response);
    }
}