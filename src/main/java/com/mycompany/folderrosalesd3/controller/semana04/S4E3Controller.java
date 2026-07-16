package com.mycompany.folderrosalesd3.controller.semana04;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.mycompany.folderrosalesd3.model.semana04.S4E3Model;

@WebServlet(name = "S4E3Controller", urlPatterns = {"/S4E3Controller"})
public class S4E3Controller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/html/semana04/S4E3.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String diaSemana = request.getParameter("diaSemana");
        String hEntradaStr = request.getParameter("horaEntrada");
        String mEntradaStr = request.getParameter("minEntrada");
        String hSalidaStr = request.getParameter("horaSalida");
        String mSalidaStr = request.getParameter("minSalida");

        // 1. Validación de parámetros vacíos
        if (diaSemana == null || diaSemana.trim().isEmpty() ||
            hEntradaStr == null || hEntradaStr.trim().isEmpty() ||
            mEntradaStr == null || mEntradaStr.trim().isEmpty() ||
            hSalidaStr == null || hSalidaStr.trim().isEmpty() ||
            mSalidaStr == null || mSalidaStr.trim().isEmpty()) {
            
            request.setAttribute("error", "Por favor, complete todos los campos del crupier de tiempo.");
            request.getRequestDispatcher("/html/semana04/S4E3.jsp").forward(request, response);
            return;
        }

        try {
            int hEntrada = Integer.parseInt(hEntradaStr);
            int mEntrada = Integer.parseInt(mEntradaStr);
            int hSalida = Integer.parseInt(hSalidaStr);
            int mSalida = Integer.parseInt(mSalidaStr);

            // 2. Validación de rangos de horas y minutos en formato 24 horas
            if (hEntrada < 0 || hEntrada > 23 || hSalida < 0 || hSalida > 23) {
                request.setAttribute("error", "Las horas deben estar en el rango de 0 a 23.");
                request.getRequestDispatcher("/html/semana04/S4E3.jsp").forward(request, response);
                return;
            }

            if (mEntrada < 0 || mEntrada > 59 || mSalida < 0 || mSalida > 59) {
                request.setAttribute("error", "Los minutos deben estar en el rango de 0 a 59.");
                request.getRequestDispatcher("/html/semana04/S4E3.jsp").forward(request, response);
                return;
            }

            // 3. Procesamiento en el Modelo
            S4E3Model model = new S4E3Model(diaSemana, hEntrada, mEntrada, hSalida, mSalida);

            // 4. Pasar resultados a la vista
            request.setAttribute("diaSemana", model.getDiaSemana());
            request.setAttribute("horaEntrada", model.getHoraEntrada());
            request.setAttribute("minEntrada", model.getMinEntrada());
            request.setAttribute("horaSalida", model.getHoraSalida());
            request.setAttribute("minSalida", model.getMinSalida());

            request.setAttribute("tarifaHora", model.getTarifaPorHora());
            request.setAttribute("horasVisuales", model.getHorasTranscurridasVisuales());
            request.setAttribute("minutosVisuales", model.getMinutosRestantesVisuales());
            request.setAttribute("minutosTotales", model.calcularMinutosTotales());
            request.setAttribute("horasFacturadas", model.calcularHorasAFacturar());
            request.setAttribute("totalPagar", model.calcularTotalPagar());
            request.setAttribute("calculado", true);

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Formato inválido. Por favor, ingrese valores enteros coherentes.");
        }

        request.getRequestDispatcher("/html/semana04/S4E3.jsp").forward(request, response);
    }
}