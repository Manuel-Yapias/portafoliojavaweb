<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.folderrosalesd3.model.semana10.S10E1Model" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>S10E1 - Cuadrática</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        :root { --dorado: #ffcc00; --fondo: #0a0a0a; }
        body { background-color: var(--fondo); color: white; font-family: 'Courier New', monospace; }
    </style>
</head>
<body class="p-10 flex justify-center">
    <div class="max-w-md w-full bg-zinc-950 p-8 border border-zinc-800 rounded-lg shadow-2xl">
        <h2 class="text-xl font-bold text-[var(--dorado)] mb-6 text-center uppercase tracking-widest">♦ Ecuación Cuadrática</h2>
        
        <form action="${pageContext.request.contextPath}/S10E1Controller" method="POST" class="space-y-4">
            <input type="number" name="a" step="any" required placeholder="Valor de A" class="w-full bg-black border border-zinc-700 p-2 text-white">
            <input type="number" name="b" step="any" required placeholder="Valor de B" class="w-full bg-black border border-zinc-700 p-2 text-white">
            <input type="number" name="c" step="any" required placeholder="Valor de C" class="w-full bg-black border border-zinc-700 p-2 text-white">
            <button type="submit" class="w-full bg-[var(--dorado)] text-black font-bold py-2 uppercase hover:bg-yellow-500 transition-all">Calcular Raíces</button>
        </form>

        <% S10E1Model res = (S10E1Model) request.getAttribute("resultado");
           if (res != null) { %>
            <div class="mt-6 p-4 border border-[var(--dorado)] bg-zinc-900 text-sm">
                <p>Estado: <%= res.getMensaje() %></p>
                <% if (res.getMensaje().contains("Raíces")) { %>
                    <p class="text-[var(--dorado)] font-bold">Raíz 1: <%= String.format("%.4f", res.getX1()) %></p>
                    <p class="text-[var(--dorado)] font-bold">Raíz 2: <%= String.format("%.4f", res.getX2()) %></p>
                <% } %>
            </div>
        <% } %>
    </div>
</body>
</html>