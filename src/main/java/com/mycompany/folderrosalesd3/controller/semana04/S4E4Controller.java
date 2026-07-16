package com.mycompany.folderrosalesd3.controller.semana04;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.mycompany.folderrosalesd3.model.semana04.S4E4Model;

@WebServlet(name = "S4E4Controller", urlPatterns = {"/S4E4Controller"})
public class S4E4Controller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/html/semana04/S4E4.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String n1Str = request.getParameter("nota1");
        String n2Str = request.getParameter("nota2");
        String n3Str = request.getParameter("nota3");

        // 1. Verificación de presencia de campos vacíos
        if (n1Str == null || n1Str.trim().isEmpty() ||
            n2Str == null || n2Str.trim().isEmpty() ||
            n3Str == null || n3Str.trim().isEmpty()) {
            
            request.setAttribute("error", "Debe ingresar las tres calificaciones para procesar el promedio.");
            request.getRequestDispatcher("/html/semana04/S4E4.jsp").forward(request, response);
            return;
        }

        try {
            double n1 = Double.parseDouble(n1Str);
            double n2 = Double.parseDouble(n2Str);
            double n3 = Double.parseDouble(n3Str);

            // 2. Validación de consistencia académica (Notas válidas en Perú: 0 a 20)
            if (n1 < 0 || n1 > 20 || n2 < 0 || n2 > 20 || n3 < 0 || n3 > 20) {
                request.setAttribute("error", "Las notas deben estar estrictamente comprendidas en el rango de 0 a 20.");
                request.getRequestDispatcher("/html/semana04/S4E4.jsp").forward(request, response);
                return;
            }

            // 3. Procesar a través del modelo
            S4E4Model model = new S4E4Model(n1, n2, n3);

            // 4. Transportar resultados hacia el JSP
            request.setAttribute("nota1", model.getNota1());
            request.setAttribute("nota2", model.getNota2());
            request.setAttribute("nota3Original", model.getNota3());
            request.setAttribute("nota3Final", model.getNota3ConBonificacion());
            request.setAttribute("bonificado", model.tieneBonificacion());
            request.setAttribute("promedioFinal", model.calcularPromedioFinal());
            request.setAttribute("calculado", true);

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Lectura fallida: Asegúrese de ingresar solo números decimales correctos.");
        }

        request.getRequestDispatcher("/html/semana04/S4E4.jsp").forward(request, response);
    }
}