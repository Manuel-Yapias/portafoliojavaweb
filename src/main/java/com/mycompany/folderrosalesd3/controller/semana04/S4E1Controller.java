package com.mycompany.folderrosalesd3.controller.semana04;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.mycompany.folderrosalesd3.model.semana04.S4E1Model;

@WebServlet(name = "S4E1Controller", urlPatterns = {"/S4E1Controller"})
public class S4E1Controller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Redirección directa para limpiar el formulario
        request.getRequestDispatcher("/html/semana04/S4E1.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String tipoAuto = request.getParameter("tipoAuto");
        String diasStr = request.getParameter("dias");
        String kmStr = request.getParameter("km");

        // 1. Validaciones de consistencia
        if (tipoAuto == null || tipoAuto.trim().isEmpty() || 
            diasStr == null || diasStr.trim().isEmpty() || 
            kmStr == null || kmStr.trim().isEmpty()) {
            
            request.setAttribute("error", "Todos los campos de la mesa de apuestas son obligatorios.");
            request.getRequestDispatcher("/html/semana04/S4E1.jsp").forward(request, response);
            return;
        }

        try {
            int dias = Integer.parseInt(diasStr);
            double km = Double.parseDouble(kmStr);

            if (dias <= 0) {
                request.setAttribute("error", "Los días de alquiler deben ser mayores a 0.");
                request.getRequestDispatcher("/html/semana04/S4E1.jsp").forward(request, response);
                return;
            }

            if (km < 0) {
                request.setAttribute("error", "Los kilómetros recorridos no pueden ser negativos.");
                request.getRequestDispatcher("/html/semana04/S4E1.jsp").forward(request, response);
                return;
            }

            // 2. Instanciación del Modelo y ejecución lógicas
            S4E1Model model = new S4E1Model(tipoAuto, dias, km);

            // 3. Inyección de Atributos al Request Scope
            request.setAttribute("tipoAuto", model.getTipoAuto());
            request.setAttribute("dias", model.getDias());
            request.setAttribute("km", model.getKm());
            
            request.setAttribute("tarifaDia", model.getTarifaDiaria());
            request.setAttribute("tarifaKm", model.getTarifaKilometro());
            request.setAttribute("costoDias", model.calcularCostoDias());
            request.setAttribute("costoKm", model.calcularCostoKm());
            
            request.setAttribute("subtotal", model.calcularImporteBase());
            request.setAttribute("superaLimite", model.superaLimiteKmDiario());
            request.setAttribute("recargo", model.calcularMontoRecargo());
            request.setAttribute("totalPagar", model.calcularTotalPagar());
            request.setAttribute("calculado", true);

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Error de formato: Ingrese valores numéricos válidos.");
        }

        // 4. Reenvío del flujo a la vista JSP
        request.getRequestDispatcher("/html/semana04/S4E1.jsp").forward(request, response);
    }
}