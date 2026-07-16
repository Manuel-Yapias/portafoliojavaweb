package com.mycompany.folderrosalesd3.controller.semana10;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import com.mycompany.folderrosalesd3.model.semana10.S10E2Model;

@WebServlet(name = "S10E2Controller", urlPatterns = {"/S10E2Controller"})
public class S10E2Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/html/semana10/S10E2.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String texto = request.getParameter("texto");

        if (texto == null || texto.trim().isEmpty()) {
            request.setAttribute("error", "El campo de texto no puede estar vacío.");
        } else {
            S10E2Model model = new S10E2Model();
            model.limpiar(texto);
            request.setAttribute("resultado", model);
        }

        request.getRequestDispatcher("/html/semana10/S10E2.jsp").forward(request, response);
    }
}