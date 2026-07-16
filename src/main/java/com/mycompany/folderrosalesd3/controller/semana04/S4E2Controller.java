package com.mycompany.folderrosalesd3.controller.semana04;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.mycompany.folderrosalesd3.model.semana04.S4E2Model;

@WebServlet(name = "S4E2Controller", urlPatterns = {"/S4E2Controller"})
public class S4E2Controller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Carga inicial del formulario de cálculo
        request.getRequestDispatcher("/html/semana04/S4E2.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String horasStr = request.getParameter("horasTrabajadas");
        String tarifaStr = request.getParameter("tarifaHora");

        // 1. Validaciones de presencia
        if (horasStr == null || horasStr.trim().isEmpty() || 
            tarifaStr == null || tarifaStr.trim().isEmpty()) {
            
            request.setAttribute("error", "Todos los casilleros de la mesa de control son requeridos.");
            request.getRequestDispatcher("/html/semana04/S4E2.jsp").forward(request, response);
            return;
        }

        try {
            int horas = Integer.parseInt(horasStr);
            double tarifa = Double.parseDouble(tarifaStr);

            // 2. Validaciones de consistencia de rango
            if (horas < 0) {
                request.setAttribute("error", "Las horas trabajadas no pueden tomar valores negativos.");
                request.getRequestDispatcher("/html/semana04/S4E2.jsp").forward(request, response);
                return;
            }

            if (tarifa <= 0) {
                request.setAttribute("error", "La tarifa por hora normal debe ser mayor que cero.");
                request.getRequestDispatcher("/html/semana04/S4E2.jsp").forward(request, response);
                return;
            }

            // 3. Procesamiento a través del Modelo
            S4E2Model model = new S4E2Model(horas, tarifa);

            // 4. Carga de resultados procesados al Scope de Request
            request.setAttribute("horasTrabajadas", model.getHorasTrabajadas());
            request.setAttribute("tarifaHora", model.getTarifaHora());
            
            request.setAttribute("horasNormales", model.getHorasNormales());
            request.setAttribute("pagoNormal", model.calcularPagoNormal());
            
            request.setAttribute("horasExtrasTotales", model.getHorasExtrasTotales());
            request.setAttribute("horasDobles", model.getHorasDobles());
            request.setAttribute("pagoDobles", model.calcularPagoDobles());
            
            request.setAttribute("horasTriples", model.getHorasTriples());
            request.setAttribute("pagoTriples", model.calcularPagoTriples());
            
            request.setAttribute("totalExtras", model.calcularTotalExtras());
            request.setAttribute("salarioTotal", model.calcularSalarioTotal());
            request.setAttribute("calculado", true);

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Error de lectura: Ingrese exclusivamente números válidos.");
        }

        // 5. Redirección a la vista JSP
        request.getRequestDispatcher("/html/semana04/S4E2.jsp").forward(request, response);
    }
}