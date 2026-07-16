package com.mycompany.folderrosalesd3.controller.semana05;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.mycompany.folderrosalesd3.model.semana05.S5E5Model;

@WebServlet(name = "S5E5Controller", urlPatterns = {"/S5E5Controller"})
public class S5E5Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Renderizar la vista
        request.getRequestDispatcher("/html/semana05/S5E5.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        // Inicializar la lista de ventas acumuladas en la sesión si no existe
        List<S5E5Model> historialVentas = (List<S5E5Model>) session.getAttribute("historialVentas");
        if (historialVentas == null) {
            historialVentas = new ArrayList<>();
        }

        String accion = request.getParameter("accion");

        // Acción para reiniciar la caja / limpiar historial de ventas
        if ("limpiar".equals(accion)) {
            session.removeAttribute("historialVentas");
            session.removeAttribute("ultimaVenta");
            request.setAttribute("mensaje", "La mesa de control de caja ha sido reiniciada.");
            request.getRequestDispatcher("/html/semana05/S5E5.jsp").forward(request, response);
            return;
        }

        // Parámetros de entrada de la venta
        String producto = request.getParameter("producto");
        String cantidadStr = request.getParameter("cantidad");

        if (producto == null || cantidadStr == null || cantidadStr.trim().isEmpty()) {
            request.setAttribute("error", "Debe seleccionar un producto e ingresar una cantidad válida.");
            request.getRequestDispatcher("/html/semana05/S5E5.jsp").forward(request, response);
            return;
        }

        try {
            int cantidad = Integer.parseInt(cantidadStr.trim());

            if (cantidad <= 0) {
                request.setAttribute("error", "La cantidad de unidades debe ser mayor a cero.");
            } else {
                // Registrar nueva venta
                S5E5Model nuevaVenta = new S5E5Model(producto, cantidad);
                
                // Guardar en el historial de la sesión
                historialVentas.add(nuevaVenta);
                session.setAttribute("historialVentas", historialVentas);
                session.setAttribute("ultimaVenta", nuevaVenta);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor, ingrese un número entero válido para la cantidad.");
        }

        request.getRequestDispatcher("/html/semana05/S5E5.jsp").forward(request, response);
    }
}