package com.mycompany.folderrosalesd3.controller.semana03;

import com.mycompany.folderrosalesd3.model.semana03.S3E5Model;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "S3E5Controller", urlPatterns = {"/S3E5Controller"})
public class S3E5Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        despacharVista(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            // 1. Extraer los parámetros de la petición HTTP
            String txtImporteVendido = request.getParameter("importeVendido");

            // 2. Validaciones de datos
            if (txtImporteVendido == null || txtImporteVendido.trim().isEmpty()) {
                request.setAttribute("error", "El campo del importe total vendido es obligatorio.");
            } else {
                double importeVendido = Double.parseDouble(txtImporteVendido);

                if (importeVendido < 0) {
                    request.setAttribute("error", "El importe de ventas no puede ser un valor negativo.");
                    request.setAttribute("importeVendido", txtImporteVendido);
                } else {
                    // 3. Crear instancia del Modelo de la Semana 3 - Ejercicio 5
                    S3E5Model modelo = new S3E5Model(importeVendido);
                    
                    // 4. Inyectar datos originales y resultados en el request scope
                    request.setAttribute("importeVendido", importeVendido);
                    inyectarResultados(request, modelo);
                }
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Formato inválido. Ingrese un valor numérico correcto.");
        }

        despacharVista(request, response);
    }

    // TAREA ÚNICA: Almacenar resultados de negocio estructurados en el Request Scope
    private void inyectarResultados(HttpServletRequest request, S3E5Model modelo) {
        request.setAttribute("sueldoBasico", modelo.getSueldoBasico());
        request.setAttribute("comision", modelo.calcularComision());
        request.setAttribute("sueldoBruto", modelo.calcularSueldoBruto());
        request.setAttribute("descuento", modelo.calcularDescuento());
        request.setAttribute("sueldoNeto", modelo.calcularSueldoNeto());
    }

    // TAREA ÚNICA: Derivar navegación a la vista correspondiente
    private void despacharVista(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/html/semana03/S3E5.jsp").forward(request, response);
    }
}