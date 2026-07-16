<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.folderrosalesd3.model.semana07.S7E2Model" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Casino Chat - Filtro de Seguridad</title>
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
        }
        .text-gold { color: var(--dorado); }
        .bg-gold-hover:hover { background-color: var(--dorado-apagado); }
    </style>
</head>
<body class="min-h-screen flex flex-col justify-between p-4 md:p-8">

    <header class="max-w-4xl mx-auto w-full text-center my-6">
        <h1 class="text-4xl font-extrabold tracking-wider text-gold uppercase border-b-2 border-gold pb-4 inline-block">
            ♠ CASINO CHAT - ANTIFRAUD FILTER ♣
        </h1>
        <p class="text-gray-400 mt-2 text-sm">Semana 7 - S7E2 (Filtro Avanzado de Cadenas - String)</p>
    </header>

    <main class="max-w-xl mx-auto w-full bg-neutral-900 bg-opacity-80 p-8 rounded-2xl border border-neutral-800 shadow-2xl">
        
        <% if (request.getAttribute("error") != null) { %>
            <div class="mb-6 bg-red-950 border-l-4 border-red-500 text-red-200 p-4 rounded text-sm" role="alert">
                <p><%= request.getAttribute("error") %></p>
            </div>
        <% } %>

        <form action="${pageContext.request.contextPath}/S7E2Controller" method="POST" class="space-y-6">
            <div>
                <label for="chatInput" class="block text-xs font-semibold uppercase tracking-wider text-gold mb-2">
                    Mensaje de la Mesa:
                </label>
                <textarea id="chatInput" name="chatInput" rows="3"
                          placeholder="Ej: El crupier está haciendo trampa" 
                          class="w-full bg-black border border-neutral-700 rounded-lg py-3 px-4 text-white focus:outline-none focus:border-yellow-400 transition-colors"></textarea>
            </div>

            <button type="submit" 
                    class="w-full bg-yellow-500 text-black font-bold py-3 px-6 rounded-lg tracking-widest uppercase transition-all duration-200 bg-gold-hover hover:scale-[1.01] shadow-lg">
                ♦ Auditar Mensaje ♦
            </button>
        </form>

        <% 
            if (request.getAttribute("exito") != null) { 
                S7E2Model filtro = (S7E2Model) request.getAttribute("chatFiltro");
        %>
            <div class="mt-8 space-y-4">
                <div class="bg-neutral-950 p-6 rounded-xl border border-neutral-800 space-y-4">
                    <div>
                        <span class="text-[10px] text-neutral-500 block uppercase">Original:</span>
                        <p class="text-sm font-mono text-gray-400 mt-1">"<%= filtro.getMensajeOriginal() %>"</p>
                    </div>

                    <div class="border-t border-neutral-800 pt-3">
                        <span class="text-[10px] text-neutral-500 block uppercase">Resultado Moderado:</span>
                        <p class="text-lg font-bold text-white mt-1"><%= filtro.getMensajeCensurado() %></p>
                    </div>

                    <div class="flex justify-between items-center border-t border-neutral-800 pt-3 text-[11px]">
                        <span>Estado:</span>
                        <% if (filtro.fueMensajeModificado()) { %>
                            <span class="text-red-500 font-bold">⚠️ MENSAJE ALTERADO (<%= filtro.getPalabrasCensuradas() %> marcas)</span>
                        <% } else { %>
                            <span class="text-green-400 font-bold">✓ LIMPIO</span>
                        <% } %>
                    </div>
                </div>
            </div>
        <% } %>

    </main>

    <footer class="text-center py-6 text-xs text-neutral-600">
        &copy; 2026 Casino Deck Software.
    </footer>

</body>
</html>