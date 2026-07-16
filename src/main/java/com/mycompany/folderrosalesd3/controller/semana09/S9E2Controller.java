package com.mycompany.folderrosalesd3.controller.semana09;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.mycompany.folderrosalesd3.model.semana09.S9E2Model;

@WebServlet(name = "S9E2Controller", urlPatterns = {"/S9E2Controller"})
public class S9E2Controller extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String categoria = request.getParameter("categoria");
        int horas = Integer.parseInt(request.getParameter("horas"));
        int hijos = Integer.parseInt(request.getParameter("hijos"));

        S9E2Model planilla = new S9E2Model(categoria, horas, hijos);
        request.setAttribute("planilla", planilla);
        
        request.getRequestDispatcher("/html/semana09/S9E2.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/html/semana09/S9E2.jsp").forward(request, response);
    }
}