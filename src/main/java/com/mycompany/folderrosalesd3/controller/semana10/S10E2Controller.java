package com.mycompany.folderrosalesd3.controller.semana10;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.mycompany.folderrosalesd3.model.semana10.S10E2Model;

@WebServlet(name = "S10E2Controller", urlPatterns = {"/S10E2Controller"})
public class S10E2Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Carga limpia de la interfaz
        request.getRequestDispatcher("/html/semana10/S10E2.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String txtParrafo = request.getParameter("txtParrafo");

        // 1. Validación del campo
        if (txtParrafo == null || txtParrafo.trim().isEmpty()) {
            request.setAttribute("error", "La mesa requiere que ingreses un párrafo o texto válido para poder barajar las palabras.");
            request.getRequestDispatcher("/html/semana10/S10E2.jsp").forward(request, response);
            return;
        }

        // 2. Instanciación y ejecución del modelo (Single Responsibility)
        S10E2Model modelo = new S10E2Model(txtParrafo);
        modelo.limpiarParrafo();
        modelo.procesarPalabras();

        // 3. Envío de resultados al Request Scope
        request.setAttribute("modeloResultado", modelo);

        // 4. Redirección a la vista JSP
        request.getRequestDispatcher("/html/semana10/S10E2.jsp").forward(request, response);
    }
}