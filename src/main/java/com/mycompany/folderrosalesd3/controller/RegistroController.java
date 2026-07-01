package com.mycompany.folderrosalesd3.controller;

import com.mycompany.folderrosalesd3.model.Conexion;
import java.io.IOException;
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
        
        // 1. Ejecuta el truco para asegurar que la tabla usuarios exista en Render
        Conexion.crearTablaUsuariosSiNoExiste();

        // 2. Captura lo que el usuario escribió en el formulario del index.jsp
        String txtUser = request.getParameter("usuario");
        String txtPass = request.getParameter("contrasena"); 

        // 3. Inserta los datos en Postgres de Render
        String sql = "INSERT INTO usuarios (username, password) VALUES (?, ?)";

        try (Connection con = Conexion.getConexion(); 
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, txtUser);
            ps.setString(2, txtPass);
            ps.executeUpdate();
            
            // Si funciona, redirige al index con mensaje de éxito
            response.sendRedirect("index.jsp?registro=ok");

        } catch (Exception e) {
            e.printStackTrace();
            // Si falla (por ejemplo, si el usuario ya existe), redirige con error
            response.sendRedirect("index.jsp?error=fail");
        }
    }
}