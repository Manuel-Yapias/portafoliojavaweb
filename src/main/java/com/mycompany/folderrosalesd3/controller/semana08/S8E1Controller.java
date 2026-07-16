package com.mycompany.folderrosalesd3.controller.semana08;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.mycompany.folderrosalesd3.model.semana08.S8E1Model;

@WebServlet(name = "S8E1Controller", urlPatterns = {"/S8E1Controller"})
public class S8E1Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/html/semana08/S8E1.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String catetoAStr = request.getParameter("catetoA");
        String catetoBStr = request.getParameter("catetoB");

        if (catetoAStr == null || catetoBStr == null || catetoAStr.isEmpty() || catetoBStr.isEmpty()) {
            request.setAttribute("error", "Ambos catetos son obligatorios.");
            request.getRequestDispatcher("/html/semana08/S8E1.jsp").forward(request, response);
            return;
        }

        try {
            double catetoA = Double.parseDouble(catetoAStr);
            double catetoB = Double.parseDouble(catetoBStr);

            if (catetoA <= 0 || catetoB <= 0) {
                request.setAttribute("error", "Los valores deben ser mayores que cero.");
                request.getRequestDispatcher("/html/semana08/S8E1.jsp").forward(request, response);
                return;
            }

            S8E1Model modelo = new S8E1Model(catetoA, catetoB);
            request.setAttribute("modelo", modelo);
            request.setAttribute("exito", true);

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Ingrese formatos numéricos válidos.");
        }

        request.getRequestDispatcher("/html/semana08/S8E1.jsp").forward(request, response);
    }
}