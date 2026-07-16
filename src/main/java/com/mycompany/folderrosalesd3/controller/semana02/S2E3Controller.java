package com.mycompany.folderrosalesd3.controller.semana02;

import com.mycompany.folderrosalesd3.model.semana02.S2E3Model;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "S2E3Controller", urlPatterns = {"/S2E3Controller"})
public class S2E3Controller extends HttpServlet {

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
                request.setAttribute("error", "Todos los campos de la mesa de cálculo son obligatorios.");
            } else {
                double horas = Double.parseDouble(txtHoras);
                double tarifa = Double.parseDouble(txtTarifa);

                if (horas <= 0 || tarifa <= 0) {
                    request.setAttribute("error", "Tanto las horas como la tarifa deben ser mayores a cero.");
                    request.setAttribute("horas", txtHoras);
                    request.setAttribute("tarifa", txtTarifa);
                } else {
                    // 3. Instanciar el modelo de negocio
                    S2E3Model modelo = new S2E3Model(horas, tarifa);
                    
                    // 4. Inyectar datos originales y resultados procesados al request scope
                    request.setAttribute("horas", horas);
                    request.setAttribute("tarifa", tarifa);
                    inyectarResultados(request, modelo);
                }
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Entrada inválida. Ingrese valores numéricos correctos.");
        }

        despacharVista(request, response);
    }

    // TAREA ÚNICA: Enviar cálculos del modelo al Request Scope
    private void inyectarResultados(HttpServletRequest request, S2E3Model modelo) {
        request.setAttribute("sueldoBasico", modelo.calcularSueldoBasico());
        request.setAttribute("bonificacion", modelo.calcularBonificacion());
        request.setAttribute("sueldoBruto", modelo.calcularSueldoBruto());
        request.setAttribute("descuento", modelo.calcularDescuento());
        request.setAttribute("sueldoNeto", modelo.calcularSueldoNeto());
    }

    // TAREA ÚNICA: Despachar la petición a la vista JSP de la Semana 02
    private void despacharVista(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/html/semana02/S2E3.jsp").forward(request, response);
    }
}