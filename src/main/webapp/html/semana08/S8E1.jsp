<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.folderrosalesd3.model.semana08.S8E1Model" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Casino VIP - Pitágoras Express</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        :root {
            --dorado: #ffcc00;
            --dorado-apagado: #b8860b;
            --fondo: #0a0a0a;
        }
        body {
            background-color: var(--fondo);
            background-image: 
                radial-gradient(circle at 50% 50%, rgba(20, 20, 20, 0.95) 0%, rgba(5, 5, 5, 1) 100%);
            color: #ffffff;
        }
        .text-gold { color: var(--dorado); }
        .bg-gold-hover:hover { background-color: var(--dorado-apagado); }
    </style>
</head>
<body class="min-h-screen flex flex-col justify-between p-4 md:p-8">

    <header class="max-w-4xl mx-auto w-full text-center my-6">
        <h1 class="text-4xl font-extrabold tracking-wider text-gold uppercase border-b-2 border-gold pb-4 inline-block">
            ♠ PITÁGORAS EXPRESS - MODELO MVC ♣
        </h1>
        <p class="text-gray-400 mt-2 text-sm">Semana 8 - S8E1 (Uso preciso de Math.hypot en arquitectura MVC)</p>
    </header>

    <main class="max-w-lg mx-auto w-full bg-neutral-900 bg-opacity-80 p-8 rounded-2xl border border-neutral-800 shadow-2xl">
        
        <% if (request.getAttribute("error") != null) { %>
            <div class="mb-6 bg-red-950 text-red-200 p-4 rounded text-sm">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <form action="${pageContext.request.contextPath}/S8E1Controller" method="POST" class="space-y-6">
            <div class="grid grid-cols-2 gap-4">
                <div>
                    <label class="block text-xs font-semibold text-gold mb-2">Cateto Opuesto (A):</label>
                    <input type="number" step="0.001" name="catetoA" class="w-full bg-black border border-neutral-700 rounded-lg py-3 px-4 text-white text-center focus:outline-none">
                </div>
                <div>
                    <label class="block text-xs font-semibold text-gold mb-2">Cateto Adyacente (B):</label>
                    <input type="number" step="0.001" name="catetoB" class="w-full bg-black border border-neutral-700 rounded-lg py-3 px-4 text-white text-center focus:outline-none">
                </div>
            </div>

            <button type="submit" class="w-full bg-yellow-500 text-black font-bold py-3 px-6 rounded-lg uppercase tracking-wider bg-gold-hover">
                ♣ Calcular Hipotenusa MVC ♣
            </button>
        </form>

        <% 
            if (request.getAttribute("exito") != null) { 
                S8E1Model modelObj = (S8E1Model) request.getAttribute("modelo");
        %>
            <div class="mt-8 bg-neutral-950 p-6 rounded-xl border border-neutral-800 text-center">
                <span class="text-[10px] text-neutral-500 block uppercase">Hipotenusa Calculada (POO):</span>
                <p class="text-3xl font-mono text-gold font-extrabold my-2">
                    <%= String.format("%.4f", modelObj.calcularHipotenusaDirecta()) %>
                </p>
            </div>
        <% } %>

    </main>

    <footer class="text-center py-6 text-xs text-neutral-600">
        &copy; 2026 Casino Deck Precise Math.
    </footer>

</body>
</html>