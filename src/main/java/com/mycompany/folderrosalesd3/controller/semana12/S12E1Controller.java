package com.mycompany.folderrosalesd3.controller.semana12;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.mycompany.folderrosalesd3.model.semana12.S12E1Model;

@WebServlet(name = "S12E1Controller", urlPatterns = {"/S12E1Controller"})
public class S12E1Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        S12E1Model model = new S12E1Model();
        request.setAttribute("manualModel", model);

        request.getRequestDispatcher("/html/semana12/S12E1.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}