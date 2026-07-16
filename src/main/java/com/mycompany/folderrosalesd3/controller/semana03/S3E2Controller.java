package com.mycompany.folderrosalesd3.controller.semana03;

import com.mycompany.folderrosalesd3.model.semana03.S3E2Model;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "S3E2Controller", urlPatterns = {"/S3E2Controller"})
public class S3E2Controller extends HttpServlet {

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

            // 2. Validaciones de datos
            if (txtPrecio == null || txtPrecio.trim().isEmpty() || txtCantidad == null || txtCantidad.trim().isEmpty()) {
                request.setAttribute("error", "Todos los campos de entrada son obligatorios.");
            } else {
                double precio = Double.parseDouble(txtPrecio);
                int cantidad = Integer.parseInt(txtCantidad);

                if (precio <= 0 || cantidad <= 0) {
                    request.setAttribute("error", "El precio y la cantidad de unidades deben ser mayores a cero.");
                    request.setAttribute("precio", txtPrecio);
                    request.setAttribute("cantidad", txtCantidad);
                } else {
                    // 3. Crear instancia del Modelo de la Semana 3 - Ejercicio 2
                    S3E2Model modelo = new S3E2Model(precio, cantidad);
                    
                    // 4. Inyectar datos originales y resultados en el request scope
                    request.setAttribute("precio", precio);
                    request.setAttribute("cantidad", cantidad);
                    inyectarResultados(request, modelo);
                }
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Formato inválido. Asegúrese de ingresar números correctos.");
        }

        despacharVista(request, response);
    }

    // TAREA ÚNICA: Almacenar resultados de negocio estructurados en el Request Scope
    private void inyectarResultados(HttpServletRequest request, S3E2Model modelo) {
        request.setAttribute("importeCompra", modelo.calcularImporteCompra());
        request.setAttribute("primerDescuento", modelo.calcularPrimerDescuento());
        request.setAttribute("segundoDescuento", modelo.calcularSegundoDescuento());
        request.setAttribute("descuentoTotal", modelo.calcularDescuentoTotal());
        request.setAttribute("importeAPagar", modelo.calcularImporteAPagar());
    }

    // TAREA ÚNICA: Derivar navegación a la vista correspondiente
    private void despacharVista(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/html/semana03/S3E2.jsp").forward(request, response);
    }
}