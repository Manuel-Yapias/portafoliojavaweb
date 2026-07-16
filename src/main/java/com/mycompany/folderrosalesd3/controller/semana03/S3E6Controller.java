package com.mycompany.folderrosalesd3.controller.semana03;

import com.mycompany.folderrosalesd3.model.semana03.S3E6Model;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "S3E6Controller", urlPatterns = {"/S3E6Controller"})
public class S3E6Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        despacharVista(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            // 1. Obtener parámetros de la solicitud HTTP
            String txtHoras = request.getParameter("horas");
            String txtTarifa = request.getParameter("tarifa");

            // 2. Validación y seguridad de datos de nómina
            if (txtHoras == null || txtHoras.trim().isEmpty() || txtTarifa == null || txtTarifa.trim().isEmpty()) {
                request.setAttribute("error", "Todos los campos correspondientes a horas y tarifas son obligatorios.");
            } else {
                double horas = Double.parseDouble(txtHoras);
                double tarifa = Double.parseDouble(txtTarifa);

                if (horas <= 0 || tarifa <= 0) {
                    request.setAttribute("error", "Tanto las horas laboradas como la tarifa asignada deben superar el valor de cero.");
                    request.setAttribute("horas", txtHoras);
                    request.setAttribute("tarifa", txtTarifa);
                } else {
                    // 3. Crear instancia del modelo de negocio
                    S3E6Model modelo = new S3E6Model(horas, tarifa);
                    
                    // 4. Pasar los datos originales y de procesamiento al scope
                    request.setAttribute("horas", horas);
                    request.setAttribute("tarifa", tarifa);
                    inyectarResultados(request, modelo);
                }
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Formato inválido. Asegúrese de ingresar valores válidos.");
        }

        despacharVista(request, response);
    }

    // TAREA ÚNICA: Adjuntar cálculos detallados al request scope para la vista
    private void inyectarResultados(HttpServletRequest request, S3E6Model modelo) {
        request.setAttribute("sueldoBruto", modelo.calcularSueldoBruto());
        request.setAttribute("essalud", modelo.calcularDescuentoEssalud());
        request.setAttribute("afp", modelo.calcularDescuentoAfp());
        request.setAttribute("descuentoTotal", modelo.calcularDescuentoTotal());
        request.setAttribute("sueldoNeto", modelo.calcularSueldoNeto());
    }

    // TAREA ÚNICA: Direccionar la petición a la interfaz JSP
    private void despacharVista(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/html/semana03/S3E6.jsp").forward(request, response);
    }
}