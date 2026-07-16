package com.mycompany.folderrosalesd3.controller.semana11;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.mycompany.folderrosalesd3.model.semana11.S11E1Model;

@WebServlet(name = "S11E1Controller", urlPatterns = {"/S11E1Controller"})
public class S11E1Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Instanciar el modelo para la infografía
        S11E1Model modelo = new S11E1Model();
        request.setAttribute("modeloInfografia", modelo);

        // Redirección hacia la vista de la Semana 11
        request.getRequestDispatcher("/html/semana11/S11E1.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // En este manual interactivo, el flujo principal es de lectura y navegación visual (GET)
        doGet(request, response);
    }
}