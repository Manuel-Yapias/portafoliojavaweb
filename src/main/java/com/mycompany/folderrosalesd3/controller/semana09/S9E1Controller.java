package com.mycompany.folderrosalesd3.controller.semana09;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.mycompany.folderrosalesd3.model.semana09.S9E1Model;

@WebServlet(name = "S9E1Controller", urlPatterns = {"/S9E1Controller"})
public class S9E1Controller extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            int docenas = Integer.parseInt(request.getParameter("docenas"));
            double precio = Double.parseDouble(request.getParameter("precio"));

            S9E1Model calculo = new S9E1Model(docenas, precio);
            request.setAttribute("resultado", calculo);
            
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor, ingrese valores numéricos válidos.");
        }
        
        request.getRequestDispatcher("/html/semana09/S9E1.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/html/semana09/S9E1.jsp").forward(request, response);
    }
}