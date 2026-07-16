<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.folderrosalesd3.model.semana10.S10E2Model" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>S10E2 - Crupier de Textos: Contador de Palabras</title>
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
        .casino-border {
            border: 2px solid var(--dorado);
            box-shadow: 0 0 15px rgba(255, 204, 0, 0.2);
        }
        .gold-glow {
            text-shadow: 0 0 10px rgba(255, 204, 0, 0.5);
        }
        .poker-card {
            background: linear-gradient(145deg, #18181b 0%, #09090b 100%);
            border: 1px solid rgba(255, 204, 0, 0.15);
        }
    </style>
</head>
<body class="min-h-screen flex flex-col justify-between p-4 md:p-8">

    <header class="max-w-5xl mx-auto w-full text-center mb-8">
        <div class="inline-block border-b-2 border-yellow-500 pb-2 mb-4">
            <span class="text-xs uppercase tracking-widest text-yellow-500 font-semibold">♦ Dealers Room - S10 ♦</span>
        </div>
        <h1 class="text-4xl md:text-5xl font-extrabold gold-glow text-yellow-400 tracking-tight">
            ANALIZADOR Y CONTADOR DE PALABRAS
        </h1>
        <p class="text-gray-400 text-sm md:text-base mt-2">
            Desglose analítico de caracteres, palabras clave y límites del crupier en tiempo real.
        </p>
    </header>

    <main class="max-w-5xl mx-auto w-full flex-grow grid grid-cols-1 lg:grid-cols-12 gap-8 items-start">
        
        <section class="lg:col-span-5 bg-zinc-900/90 casino-border p-6 rounded-2xl">
            <div class="flex items-center space-x-3 mb-6">
                <span class="text-2xl">📝</span>
                <h2 class="text-xl font-bold text-white tracking-wide">Depositar Párrafo</h2>
            </div>

            <form action="${pageContext.request.contextPath}/S10E2Controller" method="POST" class="space-y-6">
                <div>
                    <label for="txtParrafo" class="block text-xs uppercase font-bold text-gray-400 mb-2 tracking-wider">
                        Escribe o pega tu párrafo entero:
                    </label>
                    <textarea 
                        name="txtParrafo" 
                        id="txtParrafo" 
                        rows="6" 
                        placeholder="Escribe aquí..."
                        required
                        class="w-full bg-black/50 border border-zinc-700 rounded-lg py-3 px-4 text-white placeholder-zinc-650 focus:outline-none focus:ring-2 focus:ring-yellow-500 focus:border-transparent transition text-sm leading-relaxed"
                    ></textarea>
                </div>

                <button 
                    type="submit" 
                    class="w-full bg-gradient-to-r from-yellow-500 to-amber-600 hover:from-yellow-400 hover:to-amber-500 text-black font-black text-sm uppercase tracking-widest py-4 px-6 rounded-xl transition duration-300 transform hover:-translate-y-0.5 shadow-lg"
                >
                    Repartir y Contar
                </button>
            </form>

            <% if (request.getAttribute("error") != null) { %>
                <div class="mt-6 border-l-4 border-red-500 bg-red-950/40 p-4 rounded-r-lg">
                    <p class="text-sm text-red-200"><strong>⚠️ Alerta:</strong> <%= request.getAttribute("error") %></p>
                </div>
            <% } %>
        </section>

        <section class="lg:col-span-7 bg-zinc-900/90 border border-zinc-800 p-6 rounded-2xl min-h-[420px] flex flex-col justify-between">
            <div>
                <div class="flex justify-between items-center border-b border-zinc-800 pb-4 mb-6">
                    <h3 class="font-bold text-lg tracking-wider text-gray-300">♣ Resultados de la Mano</h3>
                    <span class="text-xs font-mono bg-black text-yellow-500 px-3 py-1 rounded-full border border-yellow-500/20">
                        Split Mode Activo
                    </span>
                </div>

                <% 
                    S10E2Model resultado = (S10E2Model) request.getAttribute("modeloResultado");
                    if (resultado != null) {
                %>
                    <div class="space-y-6">
                        <div class="grid grid-cols-1 sm:grid-cols-3 gap-4">
                            <div class="poker-card p-4 rounded-xl text-center">
                                <span class="block text-[10px] text-gray-500 uppercase tracking-widest mb-1">Palabras Totales</span>
                                <span class="text-3xl font-mono font-bold text-yellow-400"><%= resultado.getCantidadPalabras() %></span>
                            </div>
                            <div class="poker-card p-4 rounded-xl text-center">
                                <span class="block text-[10px] text-gray-500 uppercase tracking-widest mb-1">Primera Carta</span>
                                <span class="text-lg font-bold text-white truncate block" title="<%= resultado.getPrimeraPalabra() %>">
                                    "<%= resultado.getPrimeraPalabra() %>"
                                </span>
                                <span class="text-[9px] font-mono text-zinc-500">Índice [0]</span>
                            </div>
                            <div class="poker-card p-4 rounded-xl text-center">
                                <span class="block text-[10px] text-gray-500 uppercase tracking-widest mb-1">Última Carta</span>
                                <span class="text-lg font-bold text-white truncate block" title="<%= resultado.getUltimaPalabra() %>">
                                    "<%= resultado.getUltimaPalabra() %>"
                                </span>
                                <span class="text-[9px] font-mono text-zinc-500">Índice [<%= resultado.getCantidadPalabras() - 1 %>]</span>
                            </div>
                        </div>

                        <div>
                            <h4 class="text-xs uppercase font-bold text-gray-400 tracking-wider mb-2">Párrafo Limpio Procesado:</h4>
                            <p class="text-xs text-zinc-350 bg-black/40 p-3 rounded-lg border border-zinc-800/60 font-serif leading-relaxed italic">
                                "<%= resultado.getParrafoLimpio() %>"
                            </p>
                        </div>

                        <div>
                            <h4 class="text-xs uppercase font-bold text-gray-400 tracking-wider mb-2">Arreglo de Palabras en la Mesa:</h4>
                            <div class="flex flex-wrap gap-2 max-h-[120px] overflow-y-auto p-2 bg-black/60 rounded-xl border border-zinc-800">
                                <% 
                                    String[] palabras = resultado.getPalabras();
                                    for (int i = 0; i < palabras.length; i++) {
                                        boolean esBorde = (i == 0 || i == palabras.length - 1);
                                %>
                                    <span class="text-xs px-2.5 py-1 rounded font-mono <%= esBorde ? "bg-amber-500 text-black font-extrabold" : "bg-zinc-800 text-zinc-300" %>">
                                        [<%= i %>] <%= palabras[i] %>
                                    </span>
                                <% } %>
                            </div>
                            <p class="text-[10px] text-zinc-500 mt-2">Nota: Las palabras resaltadas en <span class="text-yellow-500 font-bold">dorado</span> representan el inicio y el final de la colección.</p>
                        </div>
                    </div>
                <% } else { %>
                    <div class="flex flex-col items-center justify-center py-24 text-center">
                        <div class="w-16 h-16 rounded-full bg-zinc-800/80 flex items-center justify-center text-3xl mb-4 border border-zinc-700">
                            🃏
                        </div>
                        <h4 class="text-lg font-bold text-zinc-400">Esperando Juego...</h4>
                        <p class="text-sm text-zinc-500 max-w-xs mt-2">
                            Ingresa un párrafo en la bandeja de la izquierda para barajar las palabras en consola y pantalla.
                        </p>
                    </div>
                <% } %>
            </div>

            <div class="border-t border-zinc-800/80 pt-4 mt-6 flex justify-between text-[11px] text-zinc-600">
                <span>Consola del Servidor Sincronizada</span>
                <span>Mesa S10 © 2026</span>
            </div>
        </section>
    </main>

    <footer class="text-center text-xs text-zinc-600 mt-12">
        <p>Patrón de diseño MVC • Desarrollado con riguroso desacoplamiento.</p>
    </footer>

</body>
</html>