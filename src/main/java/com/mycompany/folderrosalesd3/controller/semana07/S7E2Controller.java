package com.mycompany.folderrosalesd3.controller.semana07;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.mycompany.folderrosalesd3.model.semana07.S7E2Model;

@WebServlet(name = "S7E2Controller", urlPatterns = {"/S7E2Controller"})
public class S7E2Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/html/semana07/S7E2.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String chatInput = request.getParameter("chatInput");

        if (chatInput == null || chatInput.trim().isEmpty()) {
            request.setAttribute("error", "No puedes enviar un mensaje de chat vacío.");
            request.getRequestDispatcher("/html/semana07/S7E2.jsp").forward(request, response);
            return;
        }

        S7E2Model chatFiltro = new S7E2Model(chatInput);
        request.setAttribute("chatFiltro", chatFiltro);
        request.setAttribute("exito", true);

        request.getRequestDispatcher("/html/semana07/S7E2.jsp").forward(request, response);
    }
}