package com.mycompany.folderrosalesd3.controller.semana02;

import com.mycompany.folderrosalesd3.model.semana02.S2E6Model;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "S2E6Controller", urlPatterns = {"/S2E6Controller"})
public class S2E6Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        despacharVista(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            // 1. Extraer parámetros del request
            String txtHoras = request.getParameter("horas");
            String txtTarifa = request.getParameter("tarifa");

            // 2. Validaciones básicas en el controlador
            if (txtHoras == null || txtHoras.trim().isEmpty() || txtTarifa == null || txtTarifa.trim().isEmpty()) {
                request.setAttribute("error", "Todos los campos de ingreso de horas y tarifas son obligatorios.");
            } else {
                double horas = Double.parseDouble(txtHoras);
                double tarifa = Double.parseDouble(txtTarifa);

                if (horas <= 0 || tarifa <= 0) {
                    request.setAttribute("error", "Tanto las horas como la tarifa deben ser montos mayores a cero.");
                    request.setAttribute("horas", txtHoras);
                    request.setAttribute("tarifa", txtTarifa);
                } else {
                    // 3. Instanciar el modelo de negocio
                    S2E6Model modelo = new S2E6Model(horas, tarifa);
                    
                    // 4. Inyectar datos originales y resultados procesados al request scope
                    request.setAttribute("horas", horas);
                    request.setAttribute("tarifa", tarifa);
                    inyectarResultados(request, modelo);
                }
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Formato inválido. Asegúrese de ingresar números correctos.");
        }

        despacharVista(request, response);
    }

    // TAREA ÚNICA: Enviar cálculos del modelo al Request Scope
    private void inyectarResultados(HttpServletRequest request, S2E6Model modelo) {
        request.setAttribute("sueldoBruto", modelo.calcularSueldoBruto());
        request.setAttribute("descuentoEssalud", modelo.calcularDescuentoEssalud());
        request.setAttribute("descuentoAfp", modelo.calcularDescuentoAfp());
        request.setAttribute("descuentoTotal", modelo.calcularDescuentoTotal());
        request.setAttribute("sueldoNeto", modelo.calcularSueldoNeto());
    }

    // TAREA ÚNICA: Redireccionar a la vista JSP de destino
    private void despacharVista(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/html/semana02/S2E6.jsp").forward(request, response);
    }
}