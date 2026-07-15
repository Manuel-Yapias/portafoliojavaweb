package com.mycompany.folderrosalesd3.controller;

import com.mycompany.folderrosalesd3.model.Conexion;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String txtUser = request.getParameter("usuario");
        String txtPass = request.getParameter("contrasena");

        String sql = "SELECT * FROM usuarios WHERE username = ? AND password = ?";

        try (Connection con = Conexion.getConexion(); 
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, txtUser);
            ps.setString(2, txtPass); // En un proyecto real aquí se compararía el hash encriptado
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    // Si el usuario existe y coincide la clave, creamos la sesión HTTP
                    HttpSession session = request.getSession();
                    session.setAttribute("session_usuario", txtUser);
                    
                    // Lo mandamos a la pantalla de index
                    response.sendRedirect("index.jsp");
                } else {
                    // Credenciales incorrectas
                    response.sendRedirect("login.jsp?error=fail");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=fail");
        }
    }
}