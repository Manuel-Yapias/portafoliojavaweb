package com.mycompany.folderrosalesd3.controller.semana02;

import com.mycompany.folderrosalesd3.model.semana02.S2E4Model;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "S2E4Controller", urlPatterns = {"/S2E4Controller"})
public class S2E4Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        despacharVista(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            // 1. Extraer el parámetro del request
            String txtDonacion = request.getParameter("donacion");

            // 2. Validaciones básicas en el controlador
            if (txtDonacion == null || txtDonacion.trim().isEmpty()) {
                request.setAttribute("error", "El monto de la donación es requerido en la mesa de apuestas.");
            } else {
                double donacion = Double.parseDouble(txtDonacion);

                if (donacion <= 0) {
                    request.setAttribute("error", "El monto de la donación debe ser mayor que cero.");
                    request.setAttribute("donacion", txtDonacion);
                } else {
                    // 3. Instanciar el modelo de negocio
                    S2E4Model modelo = new S2E4Model(donacion);
                    
                    // 4. Pasar inputs originales y resultados procesados al request scope
                    request.setAttribute("donacion", donacion);
                    inyectarResultados(request, modelo);
                }
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Entrada inválida. Ingrese un valor numérico correcto.");
        }

        despacharVista(request, response);
    }

    // TAREA ÚNICA: Guardar los valores lógicos en el Request Scope
    private void inyectarResultados(HttpServletRequest request, S2E4Model modelo) {
        request.setAttribute("medicinaGeneral", modelo.calcularMedicinaGeneral());
        request.setAttribute("ginecologia", modelo.calcularGinecologia());
        request.setAttribute("pediatria", modelo.calcularPediatria());
        request.setAttribute("traumatologia", modelo.calcularTraumatologia());
    }

    // TAREA ÚNICA: Redireccionar el flujo a la vista JSP correspondiente
    private void despacharVista(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/html/semana02/S2E4.jsp").forward(request, response);
    }
}