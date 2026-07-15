package com.mycompany.folderrosalesd3.controller;

import com.mycompany.folderrosalesd3.model.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/registrar")
public class RegistroController extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String txtUser = request.getParameter("usuario");
        String txtPass = request.getParameter("contrasena"); 

        try {
            // Aseguramos la tabla primero
            Conexion.crearTablaUsuariosSiNoExiste();

            String sql = "INSERT INTO usuarios (username, password) VALUES (?, ?)";
            try (Connection con = Conexion.getConexion(); 
                 PreparedStatement ps = con.prepareStatement(sql)) {
                
                ps.setString(1, txtUser);
                ps.setString(2, txtPass);
                ps.executeUpdate();
                
                response.sendRedirect("index.jsp?registro=ok");
            }
        } catch (Exception e) {
            // ¡ESTO ES LO IMPORTANTE! Si falla, imprimirá el error real en texto en la pantalla
            response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                out.println("<h2>Error de Conexión Detectado:</h2>");
                out.println("<p style='color:red; font-weight:bold;'>" + e.getMessage() + "</p>");
                out.println("<pre>");
                e.printStackTrace(out);
                out.println("</pre>");
                out.println("<br><a href='index.jsp'>Volver</a>");
            }
        }
    }
}