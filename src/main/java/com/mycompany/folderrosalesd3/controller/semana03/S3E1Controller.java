package com.mycompany.folderrosalesd3.controller.semana03;

import com.mycompany.folderrosalesd3.model.semana03.S3E1Model;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "S3E1Controller", urlPatterns = {"/S3E1Controller"})
public class S3E1Controller extends HttpServlet {

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
            String txtPrecio = request.getParameter("precio");
            String txtCantidad = request.getParameter("cantidad");

            // 2. Validaciones de entrada
            if (txtPrecio == null || txtPrecio.trim().isEmpty() || txtCantidad == null || txtCantidad.trim().isEmpty()) {
                request.setAttribute("error", "Todos los campos de entrada son obligatorios.");
            } else {
                double precio = Double.parseDouble(txtPrecio);
                int cantidad = Integer.parseInt(txtCantidad);

                if (precio <= 0 || cantidad <= 0) {
                    request.setAttribute("error", "El precio y la cantidad deben ser valores mayores a cero.");
                    request.setAttribute("precio", txtPrecio);
                    request.setAttribute("cantidad", txtCantidad);
                } else {
                    // 3. Crear instancia del Modelo de la Semana 3
                    S3E1Model modelo = new S3E1Model(precio, cantidad);
                    
                    // 4. Compartir datos originales y resultados calculados
                    request.setAttribute("precio", precio);
                    request.setAttribute("cantidad", cantidad);
                    inyectarResultados(request, modelo);
                }
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Formato inválido. Asegúrese de ingresar valores numéricos válidos.");
        }

        despacharVista(request, response);
    }

    // TAREA ÚNICA: Almacenar resultados de negocio en el Request Scope
    private void inyectarResultados(HttpServletRequest request, S3E1Model modelo) {
        request.setAttribute("importeCompra", modelo.calcularImporteCompra());
        request.setAttribute("descuento", modelo.calcularDescuento());
        request.setAttribute("importeAPagar", modelo.calcularImporteAPagar());
        request.setAttribute("caramelos", modelo.calcularCaramelosObsequio());
    }

    // TAREA ÚNICA: Derivar navegación a la vista correspondiente
    private void despacharVista(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/html/semana03/S3E1.jsp").forward(request, response);
    }
}