<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro de Usuarios</title>
</head>
<body style="font-family: Arial, sans-serif; margin: 50px;">
    <h2>Crear Cuenta Nueva</h2>

    <%-- Mensajes de feedback para el usuario --%>
    <% if("ok".equals(request.getParameter("registro"))) { %>
        <p style="color: green;">¡Usuario registrado con éxito! Ya puedes iniciar sesión.</p>
    <% } %>
    <% if("fail".equals(request.getParameter("error"))) { %>
        <p style="color: red;">Hubo un error. El usuario ya podría estar registrado.</p>
    <% } %>

    <form action="registrar" method="POST">
        <label>Nombre de Usuario:</label><br>
        <input type="text" name="usuario" required><br><br>

        <label>Contraseña:</label><br>
        <input type="password" name="contrasena" required><br><br>

        <button type="submit">Registrarse</button>
    </form>

    <br>
    <p>¿Ya tienes una cuenta? <a href="login.jsp">Inicia sesión aquí</a></p>
</body>
</html>