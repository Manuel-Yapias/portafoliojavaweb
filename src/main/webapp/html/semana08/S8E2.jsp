<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.folderrosalesd3.model.semana08.S8E2Model" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Bóveda VIP - Calculadora de Retornos Exponenciales</title>
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
            ♠ VIP VAULT - CONTINUOUS COMPOUND ♣
        </h1>
        <p class="text-gray-400 mt-2 text-sm">Semana 8 - S8E2 (Crecimiento Matemático Exponencial Continuo)</p>
    </header>

    <main class="max-w-2xl mx-auto w-full bg-neutral-900 bg-opacity-80 p-8 rounded-2xl border border-neutral-800 shadow-2xl">
        
        <% if (request.getAttribute("error") != null) { %>
            <div class="mb-6 bg-red-950 border-l-4 border-red-500 text-red-200 p-4 rounded text-sm" role="alert">
                <p class="font-bold">Aviso de la Banca</p>
                <p><%= request.getAttribute("error") %></p>
            </div>
        <% } %>

        <form action="${pageContext.request.contextPath}/S8E2Controller" method="POST" class="grid grid-cols-1 md:grid-cols-3 gap-6">
            <div>
                <label for="capital" class="block text-xs font-semibold uppercase tracking-wider text-gold mb-2">
                    Inversión Inicial ($):
                </label>
                <input type="number" step="0.01" id="capital" name="capital" 
                       placeholder="Ej: 5000.00" 
                       value="<%= request.getParameter("capital") != null ? request.getParameter("capital") : "" %>"
                       class="w-full bg-black border border-neutral-700 rounded-lg py-3 px-4 text-white text-center focus:outline-none focus:border-yellow-400 transition-colors">
            </div>

            <div>
                <label for="tasa" class="block text-xs font-semibold uppercase tracking-wider text-gold mb-2">
                    Tasa Anual Nominal (%):
                </label>
                <input type="number" step="0.01" id="tasa" name="tasa" 
                       placeholder="Ej: 12.5" 
                       value="<%= request.getParameter("tasa") != null ? request.getParameter("tasa") : "" %>"
                       class="w-full bg-black border border-neutral-700 rounded-lg py-3 px-4 text-white text-center focus:outline-none focus:border-yellow-400 transition-colors">
            </div>

            <div>
                <label for="tiempo" class="block text-xs font-semibold uppercase tracking-wider text-gold mb-2">
                    Tiempo de Plazo (Años):
                </label>
                <input type="number" step="0.1" id="tiempo" name="tiempo" 
                       placeholder="Ej: 5" 
                       value="<%= request.getParameter("tiempo") != null ? request.getParameter("tiempo") : "" %>"
                       class="w-full bg-black border border-neutral-700 rounded-lg py-3 px-4 text-white text-center focus:outline-none focus:border-yellow-400 transition-colors">
            </div>

            <div class="md:col-span-3">
                <button type="submit" 
                        class="w-full bg-yellow-500 text-black font-bold py-3 px-6 rounded-lg tracking-widest uppercase transition-all duration-200 bg-gold-hover hover:scale-[1.01] shadow-lg">
                    ♣ Estimar Crecimiento Continuo ♣
                </button>
            </div>
        </form>

        <% 
            if (request.getAttribute("exito") != null) { 
                S8E2Model proy = (S8E2Model) request.getAttribute("proyeccion");
        %>
            <hr class="my-8 border-neutral-800">
            <div class="space-y-4">
                <h3 class="text-xl font-bold text-gold uppercase tracking-wider text-center">Fórmula Aplicada</h3>
                <div class="text-center bg-neutral-950 p-4 rounded-lg border border-neutral-800 font-mono text-sm text-gray-300">
                    $$A = P \cdot e^{r \cdot t}$$
                </div>
                
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mt-4">
                    <div class="bg-black p-4 rounded-lg border border-neutral-800">
                        <span class="text-[10px] text-neutral-500 block uppercase">Monto Total Estimado (A):</span>
                        <span class="text-xl font-bold text-green-400 font-mono">$<%= String.format("%.2f", proy.calcularMontoAcumulado()) %></span>
                    </div>
                    <div class="bg-black p-4 rounded-lg border border-neutral-800">
                        <span class="text-[10px] text-neutral-500 block uppercase">Ganancia Neta Generada:</span>
                        <span class="text-xl font-bold text-gold font-mono">$<%= String.format("%.2f", proy.calcularGananciaNeta()) %></span>
                    </div>
                </div>
            </div>
        <% } %>

    </main>

    <footer class="text-center py-6 text-xs text-neutral-600">
        &copy; 2026 Casino Deck Software Architecture. Proyecciones Matemáticas Seguras.
    </footer>

</body>
</html>