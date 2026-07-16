<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            --rojo-poker: #ff3344;
            --fondo: #0a0a0a;
        }
        body {
            background-color: var(--fondo);
            background-image: 
                radial-gradient(circle at 50% 50%, rgba(20, 20, 20, 0.95) 0%, rgba(5, 5, 5, 1) 100%),
                linear-gradient(315deg, #111111 25%, transparent 25%), 
                linear-gradient(45deg, #111111 25%, transparent 25%);
            background-size: 100% 100%, 30px 30px, 30px 30px;
            color: #ffffff;
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
        }
        .border-gold { border-color: var(--dorado); }
        .text-gold { color: var(--dorado); }
        .bg-gold-hover:hover { background-color: var(--dorado-apagado); }
        .text-poker { color: var(--rojo-poker); }
    </style>
</head>
<body class="min-h-screen flex flex-col justify-between p-4 md:p-8">

    <header class="max-w-4xl mx-auto w-full text-center my-6">
        <h1 class="text-4xl font-extrabold tracking-wider text-gold uppercase border-b-2 border-gold pb-4 inline-block">
            ♠ GEOMETRY CALCULATOR - PITÁGORAS EXPRESS ♣
        </h1>
        <p class="text-gray-400 mt-2 text-sm">Semana 7 - Ejercicio 2 (Uso preciso de la función Math.hypot())</p>
    </header>

    <main class="max-w-lg mx-auto w-full bg-neutral-900 bg-opacity-80 p-8 rounded-2xl border border-neutral-800 shadow-2xl">
        
        <% if (request.getAttribute("error") != null) { %>
            <div class="mb-6 bg-red-950 border-l-4 border-red-500 text-red-200 p-4 rounded text-sm" role="alert">
                <p class="font-bold">Error de Cálculo</p>
                <p><%= request.getAttribute("error") %></p>
            </div>
        <% } %>

        <form action="${pageContext.request.contextPath}/S7E2Controller" method="POST" class="space-y-6">
            <div class="grid grid-cols-2 gap-4">
                <div>
                    <label for="catetoA" class="block text-xs font-semibold uppercase tracking-wider text-gold mb-2">
                        Cateto Opuesto (A):
                    </label>
                    <input type="number" step="0.0001" id="catetoA" name="catetoA" 
                           placeholder="Ej. 120.50" 
                           value="<%= request.getAttribute("catetoA") != null ? request.getAttribute("catetoA") : "" %>"
                           class="w-full bg-black border border-neutral-700 rounded-lg py-3 px-4 text-white text-center focus:outline-none focus:border-yellow-400 transition-colors">
                </div>
                <div>
                    <label for="catetoB" class="block text-xs font-semibold uppercase tracking-wider text-gold mb-2">
                        Cateto Adyacente (B):
                    </label>
                    <input type="number" step="0.0001" id="catetoB" name="catetoB" 
                           placeholder="Ej. 350.75" 
                           value="<%= request.getAttribute("catetoB") != null ? request.getAttribute("catetoB") : "" %>"
                           class="w-full bg-black border border-neutral-700 rounded-lg py-3 px-4 text-white text-center focus:outline-none focus:border-yellow-400 transition-colors">
                </div>
            </div>

            <button type="submit" 
                    class="w-full bg-yellow-500 text-black font-bold py-3 px-6 rounded-lg tracking-widest uppercase transition-all duration-200 bg-gold-hover hover:scale-[1.01] shadow-lg">
                ♣ Calcular Hipotenusa Directa ♣
            </button>
        </form>

        <% if (request.getAttribute("exito") != null) { %>
            <div class="mt-8 space-y-4">
                <div class="bg-neutral-950 p-6 rounded-xl border border-neutral-800 text-center relative">
                    <span class="text-[10px] text-neutral-500 block uppercase tracking-widest mb-1">Resultado de Precisión Exacta</span>
                    <span class="text-xs text-neutral-400 block mb-2">(Previene desbordamientos aritméticos intermedios)</span>
                    
                    <p class="text-3xl font-mono text-gold tracking-wide font-extrabold my-2">
                        <%= String.format("%.4f", (Double)request.getAttribute("hipotenusa")) %>
                    </p>

                    <div class="text-[10px] text-neutral-500 border-t border-neutral-800 pt-3 mt-3">
                        Utilizando internamente la llamada robusta <code class="text-poker">Math.hypot()</code> de Java.
                    </div>
                </div>
            </div>
        <% } %>

    </main>

    <footer class="text-center py-6 text-xs text-neutral-600">
        &copy; 2026 Casino Deck Controller. Motores de Precisión Aritmética.
    </footer>

</body>
</html>