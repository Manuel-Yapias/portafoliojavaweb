<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.folderrosalesd3.model.semana09.S9E1Model" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Casino Business - Calculadora de Descuentos</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        :root { --dorado: #ffcc00; --fondo: #0a0a0a; }
        body { background-color: var(--fondo); color: #ffffff; }
    </style>
</head>
<body class="min-h-screen flex flex-col items-center justify-center p-6">

    <div class="max-w-md w-full bg-neutral-900 p-8 rounded-2xl border border-neutral-800 shadow-2xl">
        <h1 class="text-2xl font-bold text-[var(--dorado)] mb-6 text-center uppercase tracking-widest">
            ♦ Sistema de Ventas S9 ♣
        </h1>

        <form action="${pageContext.request.contextPath}/S9E1Controller" method="POST" class="space-y-4">
            <div>
                <label class="block text-[10px] text-gray-400 uppercase">Docenas Adquiridas:</label>
                <input type="number" name="docenas" required class="w-full bg-black border border-neutral-700 rounded p-2 text-white">
            </div>
            <div>
                <label class="block text-[10px] text-gray-400 uppercase">Precio por Docena:</label>
                <input type="number" step="0.01" name="precio" required class="w-full bg-black border border-neutral-700 rounded p-2 text-white">
            </div>
            <button type="submit" class="w-full bg-[var(--dorado)] text-black font-bold py-2 rounded hover:opacity-90 transition-all uppercase text-xs">
                Calcular Operación
            </button>
        </form>

        <% 
            S9E1Model res = (S9E1Model) request.getAttribute("resultado");
            if (res != null) { 
        %>
            <div class="mt-8 space-y-3 border-t border-neutral-800 pt-6">
                <div class="flex justify-between text-sm">
                    <span class="text-gray-500">Importe Compra:</span>
                    <span>$<%= String.format("%.2f", res.getImporteCompra()) %></span>
                </div>
                <div class="flex justify-between text-sm">
                    <span class="text-gray-500">Descuento:</span>
                    <span class="text-red-400">-$<%= String.format("%.2f", res.getDescuento()) %></span>
                </div>
                <div class="flex justify-between font-bold text-[var(--dorado)] border-t border-neutral-800 pt-2">
                    <span>Importe a Pagar:</span>
                    <span>$<%= String.format("%.2f", res.getImportePagar()) %></span>
                </div>
                <div class="bg-neutral-800 p-3 rounded text-center mt-4">
                    <span class="text-[10px] uppercase text-gray-400">Obsequio de la Casa:</span>
                    <p class="text-lg font-bold text-emerald-400"><%= res.getLapicerosObsequio() %> Lapiceros</p>
                </div>
            </div>
        <% } %>
    </div>

</body>
</html>