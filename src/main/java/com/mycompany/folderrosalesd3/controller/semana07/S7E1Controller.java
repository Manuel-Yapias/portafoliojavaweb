package com.mycompany.folderrosalesd3.controller.semana07;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.mycompany.folderrosalesd3.model.semana07.S7E1Model;

@WebServlet(name = "S7E1Controller", urlPatterns = {"/S7E1Controller"})
public class S7E1Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/html/semana07/S7E1.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String tarjetaParam = request.getParameter("numeroTarjeta");

        if (tarjetaParam == null || tarjetaParam.trim().isEmpty()) {
            request.setAttribute("error", "Debe ingresar el número de tarjeta.");
            request.getRequestDispatcher("/html/semana07/S7E1.jsp").forward(request, response);
            return;
        }

        S7E1Model modelo = new S7E1Model(tarjetaParam);

        if (!modelo.validarTarjeta()) {
            request.setAttribute("error", "La tarjeta debe contener exactamente 16 dígitos numéricos.");
            request.getRequestDispatcher("/html/semana07/S7E1.jsp").forward(request, response);
            return;
        }

        // Procesamiento y envío de datos
        request.setAttribute("tarjetaOriginal", modelo.getNumeroTarjeta());
        request.setAttribute("tarjetaEnmascarada", modelo.enmascarar());
        request.setAttribute("exito", true);

        request.getRequestDispatcher("/html/semana07/S7E1.jsp").forward(request, response);
    }
}