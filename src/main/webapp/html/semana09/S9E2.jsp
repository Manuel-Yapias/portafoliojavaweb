<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.folderrosalesd3.model.semana09.S9E2Model" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Casino Payroll - S9E2</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-black text-white p-8">
    <div class="max-w-xl mx-auto bg-zinc-900 p-6 rounded-xl border border-zinc-800">
        <h2 class="text-yellow-500 font-bold mb-4">♦ SISTEMA DE PLANILLAS ♣</h2>
        <form action="${pageContext.request.contextPath}/S9E2Controller" method="POST" class="space-y-3">
            <select name="categoria" class="w-full bg-black p-2 border border-zinc-700">
                <option value="A">Categoría A (S/45.0)</option>
                <option value="B">Categoría B (S/37.5)</option>
            </select>
            <input type="number" name="horas" placeholder="Horas trabajadas" class="w-full bg-black p-2 border border-zinc-700">
            <input type="number" name="hijos" placeholder="Número de hijos" class="w-full bg-black p-2 border border-zinc-700">
            <button type="submit" class="w-full bg-yellow-600 text-black font-bold p-2">Calcular Sueldo Neto</button>
        </form>

        <% 
            S9E2Model p = (S9E2Model) request.getAttribute("planilla");
            if (p != null) { 
        %>
            <div class="mt-6 space-y-2 text-sm text-zinc-300">
                <p>Sueldo Básico: S/ <%= String.format("%.2f", p.getSueldoBasico()) %></p>
                <p>Bonificación: S/ <%= String.format("%.2f", p.getBonificacion()) %></p>
                <p>Sueldo Bruto: S/ <%= String.format("%.2f", p.getSueldoBruto()) %></p>
                <p class="text-red-400">Descuento: -S/ <%= String.format("%.2f", p.getDescuento()) %></p>
                <p class="text-yellow-500 font-bold text-lg pt-2 border-t border-zinc-700">Neto a Pagar: S/ <%= String.format("%.2f", p.getSueldoNeto()) %></p>
            </div>
        <% } %>
    </div>
</body>
</html>