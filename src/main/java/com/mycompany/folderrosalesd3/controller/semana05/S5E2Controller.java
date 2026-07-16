package com.mycompany.folderrosalesd3.controller.semana05;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.mycompany.folderrosalesd3.model.semana05.S5E2Model;

@WebServlet(name = "S5E2Controller", urlPatterns = {"/S5E2Controller"})
public class S5E2Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirección directa para renderizar la interfaz inicial de apuestas
        request.getRequestDispatcher("/html/semana05/S5E2.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String terminosStr = request.getParameter("terminos");
        
        // Validaciones en el Servidor
        if (terminosStr == null || terminosStr.trim().isEmpty()) {
            request.setAttribute("error", "Debe especificar la cantidad de giros (términos) para la serie.");
            request.getRequestDispatcher("/html/semana05/S5E2.jsp").forward(request, response);
            return;
        }

        try {
            int nTerminos = Integer.parseInt(terminosStr);

            if (nTerminos < 1) {
                request.setAttribute("error", "La cantidad de términos en juego debe ser mayor o igual a 1.");
                request.getRequestDispatcher("/html/semana05/S5E2.jsp").forward(request, response);
                return;
            }
            
            if (nTerminos > 60) {
                request.setAttribute("error", "Límite del crupier excedido. Máximo de 60 términos para visualización óptima.");
                request.getRequestDispatcher("/html/semana05/S5E2.jsp").forward(request, response);
                return;
            }

            // Instanciamos el Modelo y guardamos el cálculo
            S5E2Model simulador = new S5E2Model(nTerminos);
            request.setAttribute("resultado", simulador);

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Formato inválido. Por favor ingrese un número entero.");
        }

        // Forward consistente a la vista JSP de la semana 5
        request.getRequestDispatcher("/html/semana05/S5E2.jsp").forward(request, response);
    }
}