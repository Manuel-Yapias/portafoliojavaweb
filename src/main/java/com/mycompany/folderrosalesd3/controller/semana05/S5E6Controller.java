package com.mycompany.folderrosalesd3.controller.semana05;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.mycompany.folderrosalesd3.model.semana05.S5E6Model;

@WebServlet(name = "S5E6Controller", urlPatterns = {"/S5E6Controller"})
public class S5E6Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirige al lobby para que decida generar la simulación
        request.getRequestDispatcher("/html/semana05/S5E6.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Al presionar el botón de disparo, la casa genera un nuevo lote aleatorio
        S5E6Model crupierInventario = new S5E6Model();
        
        request.setAttribute("resultado", crupierInventario);
        request.getRequestDispatcher("/html/semana05/S5E6.jsp").forward(request, response);
    }
}