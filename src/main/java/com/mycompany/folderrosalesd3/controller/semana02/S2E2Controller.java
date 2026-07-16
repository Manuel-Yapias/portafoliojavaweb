package com.mycompany.folderrosalesd3.controller.semana02;

import com.mycompany.folderrosalesd3.model.semana02.S2E2Model;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "S2E2Controller", urlPatterns = {"/S2E2Controller"})
public class S2E2Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        despacharVista(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            // 1. Capturar parámetros de la petición HTTP
            String txtPrecio = request.getParameter("precio");
            String txtCantidad = request.getParameter("cantidad");

            // 2. Validaciones básicas en el controlador
            if (txtPrecio == null || txtPrecio.trim().isEmpty() || txtCantidad == null || txtCantidad.trim().isEmpty()) {
                request.setAttribute("error", "Todos los datos de la apuesta son requeridos.");
            } else {
                double precio = Double.parseDouble(txtPrecio);
                int cantidad = Integer.parseInt(txtCantidad);

                if (precio <= 0 || cantidad <= 0) {
                    request.setAttribute("error", "Tanto el precio como la cantidad de camisas deben ser mayores a cero.");
                    request.setAttribute("precio", txtPrecio);
                    request.setAttribute("cantidad", txtCantidad);
                } else {
                    // 3. Instanciar el modelo de negocio
                    S2E2Model modelo = new S2E2Model(precio, cantidad);
                    
                    // 4. Pasar inputs originales y resultados al request scope
                    request.setAttribute("precio", precio);
                    request.setAttribute("cantidad", cantidad);
                    inyectarResultados(request, modelo);
                }
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Formato numérico incorrecto. Asegúrate de ingresar números válidos.");
        }

        despacharVista(request, response);
    }

    // TAREA ÚNICA: Guardar los valores lógicos en el Request Scope
    private void inyectarResultados(HttpServletRequest request, S2E2Model modelo) {
        request.setAttribute("importeCompra", modelo.calcularImporteCompra());
        request.setAttribute("primerDescuento", modelo.calcularPrimerDescuento());
        request.setAttribute("segundoDescuento", modelo.calcularSegundoDescuento());
        request.setAttribute("descuentoTotal", modelo.calcularDescuentoTotal());
        request.setAttribute("importePagar", modelo.calcularImportePagar());
    }

    // TAREA ÚNICA: Redireccionar el flujo a la vista JSP correspondiente
    private void despacharVista(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/html/semana02/S2E2.jsp").forward(request, response);
    }
}