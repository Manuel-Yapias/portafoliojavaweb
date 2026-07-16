package com.mycompany.folderrosalesd3.controller.semana03;

import com.mycompany.folderrosalesd3.model.semana03.S3E4Model;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "S3E4Controller", urlPatterns = {"/S3E4Controller"})
public class S3E4Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        despacharVista(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            // 1. Obtener parámetros del formulario web
            String txtPrecio = request.getParameter("precio");
            String txtCantidad = request.getParameter("cantidad");

            // 2. Filtro de seguridad y validaciones numéricas
            if (txtPrecio == null || txtPrecio.trim().isEmpty() || txtCantidad == null || txtCantidad.trim().isEmpty()) {
                request.setAttribute("error", "Todos los campos de entrada son obligatorios.");
            } else {
                double precio = Double.parseDouble(txtPrecio);
                int cantidad = Integer.parseInt(txtCantidad);

                if (precio <= 0 || cantidad <= 0) {
                    request.setAttribute("error", "El precio del pasaje y la cantidad deben ser mayores que cero.");
                    request.setAttribute("precio", txtPrecio);
                    request.setAttribute("cantidad", txtCantidad);
                } else {
                    // 3. Crear instancia de negocio del modelo
                    S3E4Model modelo = new S3E4Model(precio, cantidad);
                    
                    // 4. Compartir datos y resultados calculados
                    request.setAttribute("precio", precio);
                    request.setAttribute("cantidad", cantidad);
                    inyectarResultados(request, modelo);
                }
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Formato inválido. Ingrese valores numéricos adecuados.");
        }

        despacharVista(request, response);
    }

    // TAREA ÚNICA: Enviar resultados calculados al request scope
    private void inyectarResultados(HttpServletRequest request, S3E4Model modelo) {
        request.setAttribute("importeCompra", modelo.calcularImporteCompra());
        request.setAttribute("descuento", modelo.calcularDescuento());
        request.setAttribute("importeAPagar", modelo.calcularImporteAPagar());
        request.setAttribute("chocolates", modelo.calcularChocolatesObsequio());
    }

    // TAREA ÚNICA: Derivar la petición a la interfaz gráfica JSP
    private void despacharVista(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/html/semana03/S3E4.jsp").forward(request, response);
    }
}