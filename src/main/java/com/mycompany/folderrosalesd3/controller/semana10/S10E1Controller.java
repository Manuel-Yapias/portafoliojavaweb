package com.mycompany.folderrosalesd3.controller.semana10;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import com.mycompany.folderrosalesd3.model.semana10.S10E1Model;

@WebServlet(name = "S10E1Controller", urlPatterns = {"/S10E1Controller"})
public class S10E1Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/html/semana10/S10E1.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            double a = Double.parseDouble(request.getParameter("a"));
            double b = Double.parseDouble(request.getParameter("b"));
            double c = Double.parseDouble(request.getParameter("c"));

            S10E1Model model = new S10E1Model();
            model.resolver(a, b, c);
            
            request.setAttribute("resultado", model);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor, ingrese valores numéricos válidos.");
        }

        request.getRequestDispatcher("/html/semana10/S10E1.jsp").forward(request, response);
    }
}