<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Panel de Bienvenida</title>
</head>
<body style="font-family: Arial, sans-serif; margin: 50px;">
    <%
        // Validamos si existe una sesión activa para proteger la página
        String usuarioLogueado = (String) session.getAttribute("session_usuario");
        if (usuarioLogueado == null) {
            response.sendRedirect("login.jsp?error=fail");
            return;
        }
    %>

    <h1 style="color: navy;">¡Bienvenido/a, <%= usuarioLogueado %>! 🎉</h1>
    <p>Has iniciado sesión correctamente utilizando la base de datos PostgreSQL de Render.</p>
    
    <br><br>
    <a href="logout" style="color: red; font-weight: bold;">Cerrar Sesión</a>
</body>
</html>