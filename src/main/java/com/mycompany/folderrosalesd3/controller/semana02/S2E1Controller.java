package com.mycompany.folderrosalesd3.controller.semana02;

import com.mycompany.folderrosalesd3.model.semana02.S2E1Model;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "S2E1Controller", urlPatterns = {"/S2E1Controller"})
public class S2E1Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        despacharVista(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            // 1. Extraer los parámetros de la petición
            String txtPrecio = request.getParameter("precio");
            String txtCantidad = request.getParameter("cantidad");

            // 2. Realizar validaciones lógicas básicas
            if (txtPrecio == null || txtPrecio.trim().isEmpty() || txtCantidad == null || txtCantidad.trim().isEmpty()) {
                request.setAttribute("error", "Todos los campos de la mesa de apuestas son requeridos.");
            } else {
                double precio = Double.parseDouble(txtPrecio);
                int cantidad = Integer.parseInt(txtCantidad);

                if (precio <= 0 || cantidad <= 0) {
                    request.setAttribute("error", "Los valores ingresados deben ser mayores que cero.");
                    // Mantenemos los valores en el request para persistencia amigable en la vista
                    request.setAttribute("precio", txtPrecio);
                    request.setAttribute("cantidad", txtCantidad);
                } else {
                    // 3. Instanciar el modelo de negocio con datos correctos
                    S2E1Model modelo = new S2E1Model(precio, cantidad);
                    
                    // 4. Inyectar los parámetros originales y los resultados calculados
                    request.setAttribute("precio", precio);
                    request.setAttribute("cantidad", cantidad);
                    inyectarResultados(request, modelo);
                }
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Formato numérico inválido. Ingrese valores válidos en la mesa.");
        }

        despacharVista(request, response);
    }

    // TAREA ÚNICA: Inyectar los valores procesados por el Modelo al Request Scope
    private void inyectarResultados(HttpServletRequest request, S2E1Model modelo) {
        request.setAttribute("importeCompra", modelo.calcularImporteCompra());
        request.setAttribute("importeDescuento", modelo.calcularDescuento());
        request.setAttribute("importePagar", modelo.calcularImportePagar());
        request.setAttribute("caramelos", modelo.calcularCaramelosObsequio());
    }

    // TAREA ÚNICA: Redirigir el flujo al archivo JSP de la Vista de la Semana 02
    private void despacharVista(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/html/semana02/S2E1.jsp").forward(request, response);
    }
}