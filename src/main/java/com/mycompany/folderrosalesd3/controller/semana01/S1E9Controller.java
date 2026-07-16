package com.mycompany.folderrosalesd3.controller.semana01;

import com.mycompany.folderrosalesd3.model.semana01.S1E9Model;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "S1E9Controller", urlPatterns = {"/S1E9Controller"})
public class S1E9Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        despacharVista(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            // 1. Extraer y validar el monto a repartir
            double monto = Double.parseDouble(request.getParameter("monto"));

            if (monto <= 0) {
                request.setAttribute("error", "El monto a repartir debe ser un número positivo mayor que cero.");
            } else {
                // 2. Instanciar el modelo de negocio
                S1E9Model modelo = new S1E9Model(monto);
                
                // 3. Propagar todos los montos calculados al ámbito de petición
                inyectarResultados(request, modelo);
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor, ingresa una cantidad de dinero válida (valores numéricos).");
        }

        despacharVista(request, response);
    }

    // TAREA ÚNICA: Adjuntar la información procesada
    private void inyectarResultados(HttpServletRequest request, S1E9Model modelo) {
        request.setAttribute("montoOriginal", modelo.getMontoTotal());
        request.setAttribute("josue", modelo.calcularJosue());
        request.setAttribute("tamar", modelo.calcularTamar());
        request.setAttribute("daniel", modelo.calcularDaniel());
        request.setAttribute("caleb", modelo.calcularCaleb());
        request.setAttribute("david", modelo.calcularDavid());
    }

    // TAREA ÚNICA: Transferir el flujo hacia la interfaz de presentación JSP
    private void despacharVista(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/html/semana01/S1E9.jsp").forward(request, response);
    }
}