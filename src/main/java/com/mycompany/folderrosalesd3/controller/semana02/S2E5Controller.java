package com.mycompany.folderrosalesd3.controller.semana02;

import com.mycompany.folderrosalesd3.model.semana02.S2E5Model;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "S2E5Controller", urlPatterns = {"/S2E5Controller"})
public class S2E5Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        despacharVista(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            // 1. Extraer el parámetro del request HTTP
            String txtImporteVendido = request.getParameter("importeVendido");

            // 2. Validaciones básicas en el controlador
            if (txtImporteVendido == null || txtImporteVendido.trim().isEmpty()) {
                request.setAttribute("error", "El importe total vendido es un campo requerido.");
            } else {
                double importeVendido = Double.parseDouble(txtImporteVendido);

                if (importeVendido < 0) {
                    request.setAttribute("error", "El importe total vendido no puede ser un valor negativo.");
                    request.setAttribute("importeVendido", txtImporteVendido);
                } else {
                    // 3. Instanciar el modelo de negocio
                    S2E5Model modelo = new S2E5Model(importeVendido);
                    
                    // 4. Guardar inputs y resultados en el request scope
                    request.setAttribute("importeVendido", importeVendido);
                    inyectarResultados(request, modelo);
                }
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Formato numérico inválido. Ingrese un valor decimal válido.");
        }

        despacharVista(request, response);
    }

    // TAREA ÚNICA: Centralizar el almacenamiento de los resultados calculados
    private void inyectarResultados(HttpServletRequest request, S2E5Model modelo) {
        request.setAttribute("sueldoBasico", modelo.obtenerSueldoBasico());
        request.setAttribute("comision", modelo.calcularComision());
        request.setAttribute("sueldoBruto", modelo.calcularSueldoBruto());
        request.setAttribute("descuento", modelo.calcularDescuento());
        request.setAttribute("sueldoNeto", modelo.calcularSueldoNeto());
    }

    // TAREA ÚNICA: Redirigir la navegación hacia la vista JSP en la Semana 02
    private void despacharVista(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/html/semana02/S2E5.jsp").forward(request, response);
    }
}