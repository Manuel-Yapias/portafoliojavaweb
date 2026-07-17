package com.mycompany.folderrosalesd3.controller.semana13;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.mycompany.folderrosalesd3.model.semana13.S13E1Model;

@WebServlet(name = "S13E1Controller", urlPatterns = {"/S13E1Controller"})
public class S13E1Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        S13E1Model manualUsuario = new S13E1Model();
        request.setAttribute("manualUsuario", manualUsuario);

        request.getRequestDispatcher("/html/semana13/S13E1.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}