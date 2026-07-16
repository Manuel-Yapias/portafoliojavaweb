<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Semana 01 - Proyectos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Panel de Ejercicios</h2>
        
        <form action="${pageContext.request.contextPath}/Semana01Controller" method="POST" id="formSelector">
            <select name="ej" onchange="this.form.submit()" class="form-select mb-4">
                <option value="0">-- Seleccione un ejercicio --</option>
                <c:forEach var="i" begin="1" end="10">
                    <option value="${i}" ${ej == i ? 'selected' : ''}>Ejercicio ${i}</option>
                </c:forEach>
            </select>
        </form>

        <c:if test="${not empty ej and ej != '0'}">
            <form action="${pageContext.request.contextPath}/Semana01Controller" method="POST" class="border p-3">
                <input type="hidden" name="ej" value="${ej}">
                
                <c:choose>
                    <c:when test="${ej == '1'}">
                        <input type="number" name="base" class="form-control mb-2" placeholder="Base" required step="any">
                        <input type="number" name="altura" class="form-control mb-2" placeholder="Altura" required step="any">
                    </c:when>
                    <c:when test="${ej == '2'}">
                        <input type="number" name="radio" class="form-control mb-2" placeholder="Radio" required step="any">
                    </c:when>
                    <%-- Agrega aquí los demás <c:when> para los ejercicios 3 al 10 --%>
                </c:choose>
                
                <button type="submit" class="btn btn-primary">Calcular</button>
            </form>

            <c:if test="${not empty res1}">
                <div class="alert alert-info mt-3">
                    Resultado 1: <strong>${res1}</strong>
                    <c:if test="${not empty res2}"><br>Resultado 2: <strong>${res2}</strong></c:if>
                </div>
            </c:if>
        </c:if>
    </div>
</body>
</html>