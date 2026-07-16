package com.mycompany.folderrosalesd3.controller.semana10;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.mycompany.folderrosalesd3.model.semana10.S10E1Model;

@WebServlet(name = "S10E1Controller", urlPatterns = {"/S10E1Controller"})
public class S10E1Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirección limpia al formulario inicial
        request.getRequestDispatcher("/html/semana10/S10E1.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String txtNumero = request.getParameter("txtNumero");

        // 1. Validaciones básicas de entrada
        if (txtNumero == null || txtNumero.trim().isEmpty()) {
            request.setAttribute("error", "Por favor, ingresa un número entero para comenzar.");
            request.getRequestDispatcher("/html/semana10/S10E1.jsp").forward(request, response);
            return;
        }

        try {
            int numeroBase = Integer.parseInt(txtNumero.trim());

            // Regla lógica: evitar bucles infinitos no-desbordables (números neutrales)
            if (numeroBase == 0 || numeroBase == 1 || numeroBase == -1) {
                request.setAttribute("error", "Ingresa un número entero distinto de -1, 0 o 1, ya que estos valores nunca generarán un desbordamiento por potencias.");
                request.getRequestDispatcher("/html/semana10/S10E1.jsp").forward(request, response);
                return;
            }

            // 2. Ejecutar Modelo
            S10E1Model modelo = new S10E1Model(numeroBase);
            modelo.calcularPotenciasSucesivas();

            // 3. Inyectar resultados al Request Scope
            request.setAttribute("modeloResultado", modelo);

        } catch (NumberFormatException e) {
            request.setAttribute("error", "El formato ingresado no corresponde a un entero de 32 bits válido.");
        }

        // 4. Redirección final a la vista correspondiente en Semana 10
        request.getRequestDispatcher("/html/semana10/S10E1.jsp").forward(request, response);
    }
}