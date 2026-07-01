<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Iniciar Sesión</title>
</head>
<body style="font-family: Arial, sans-serif; margin: 50px;">
    <h2>Iniciar Sesión</h2>

    <% if("fail".equals(request.getParameter("error"))) { %>
        <p style="color: red;">Usuario o contraseña incorrectos.</p>
    <% } %>

    <form action="login" method="POST">
        <label>Usuario:</label><br>
        <input type="text" name="usuario" required><br><br>

        <label>Contraseña:</label><br>
        <input type="password" name="contrasena" required><br><br>

        <button type="submit">Ingresar</button>
    </form>

    <br>
    <p>¿No tienes cuenta? <a href="index.jsp">Regístrate aquí</a></p>
</body>
</html>