<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.folderrosalesd3.model.semana05.S5E6Model" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>S5E6 - Generador de Stock Aleatorio</title>
    <!-- Tailwind CSS CDN -->
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
                radial-gradient(circle at 50% 50%, rgba(20, 15, 30, 0.95) 0%, rgba(5, 5, 5, 1) 100%),
                linear-gradient(315deg, #111111 25%, transparent 25%), 
                linear-gradient(45deg, #111111 25%, transparent 25%);
            background-size: 100% 100%, 30px 30px, 30px 30px;
            color: #ffffff;
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
        }
        .scroll-poker::-webkit-scrollbar {
            width: 5px;
        }
        .scroll-poker::-webkit-scrollbar-track {
            background: #080808;
        }
        .scroll-poker::-webkit-scrollbar-thumb {
            background: #27272a;
            border-radius: 3px;
        }
    </style>
</head>
<body class="min-h-screen flex flex-col justify-between py-6 px-4">

    <!-- Header / Barra superior -->
    <header class="max-w-5xl w-full mx-auto flex justify-between items-center border-b border-zinc-800 pb-4 mb-6">
        <div class="flex items-center space-x-3">
            <span class="text-2xl text-[var(--rojo-poker)]">♠️</span>
            <div>
                <h1 class="text-lg font-bold tracking-widest text-[var(--dorado)] uppercase">MESA S5E6</h1>
                <p class="text-[10px] text-zinc-400 font-mono">DISTRIBUCIÓN Y ANÁLISIS DE PROBABILIDAD</p>
            </div>
        </div>
        <a href="${pageContext.request.contextPath}/index.jsp" 
           class="text-xs font-mono px-4 py-2 border border-zinc-800 bg-zinc-950/60 hover:border-[var(--dorado)] hover:text-[var(--dorado)] transition-all rounded">
            Volver al Deck Principal
        </a>
    </header>

    <!-- Contenido de la Mesa -->
    <main class="max-w-5xl w-full mx-auto grid grid-cols-1 md:grid-cols-12 gap-6 items-start my-auto">
        
        <!-- Panel de Control (Izquierda) -->
        <section class="md:col-span-4 bg-zinc-950/90 border border-zinc-900 p-6 rounded-xl shadow-2xl relative overflow-hidden">
            <div class="absolute top-0 right-0 w-32 h-32 bg-purple-500/5 rounded-full blur-3xl"></div>
            
            <h2 class="text-xl font-extrabold text-[var(--dorado)] tracking-wide mb-2 uppercase">REPARTIR LOTE</h2>
            <p class="text-xs text-zinc-400 mb-6">Simule de manera inmediata el ingreso de **100 productos** al inventario con valores de stock generados de forma totalmente aleatoria en el rango: <code class="text-purple-400 font-mono">[0 - 200]</code>.</p>

            <form action="${pageContext.request.contextPath}/S5E6Controller" method="POST" class="font-mono">
                <button type="submit" 
                        class="w-full py-4 bg-gradient-to-r from-purple-800 to-indigo-600 hover:from-purple-700 hover:to-indigo-500 text-white text-xs uppercase tracking-widest font-black rounded-lg transition-all shadow-lg shadow-purple-950/40">
                    🎲 Tirar Dados (Generar)
                </button>
            </form>

            <!-- Leyenda de Categorías de la Mesa -->
            <div class="mt-6 pt-5 border-t border-zinc-900 space-y-3 font-mono text-[11px]">
                <span class="text-[10px] text-zinc-500 block uppercase tracking-wider">REGLAS DE REPARTO</span>
                <div class="flex justify-between text-zinc-400">
                    <span>Cat. A (Bajo Stock):</span>
                    <span class="text-red-400 font-bold">&lt; 50</span>
                </div>
                <div class="flex justify-between text-zinc-400">
                    <span>Cat. B (Moderado):</span>
                    <span class="text-amber-400 font-bold">50 a 99</span>
                </div>
                <div class="flex justify-between text-zinc-400">
                    <span>Cat. C (Estable):</span>
                    <span class="text-emerald-400 font-bold">100 a 149</span>
                </div>
                <div class="flex justify-between text-zinc-400">
                    <span>Cat. D (Sobrestock):</span>
                    <span class="text-blue-400 font-bold">&ge; 150</span>
                </div>
            </div>
        </section>

        <!-- Resultados e Historial (Derecha) -->
        <section class="md:col-span-8 flex flex-col h-full justify-between">
            <% 
                S5E6Model resultado = (S5E6Model) request.getAttribute("resultado");
                if (resultado == null) { 
            %>
                <!-- Placeholder de espera -->
                <div class="h-full min-h-[350px] bg-zinc-950/20 border-2 border-dashed border-zinc-900 rounded-xl flex flex-col items-center justify-center p-8 text-center">
                    <span class="text-4xl mb-4 opacity-30">🎲</span>
                    <h3 class="text-sm font-bold text-zinc-400 uppercase tracking-widest">Crupiere Listo</h3>
                    <p class="text-xs text-zinc-500 max-w-xs mt-2">Acciona el botón de generación para calcular y clasificar los stocks bajo los rangos de la regla.</p>
                </div>
            <% } else { %>
                <!-- Panel de Métricas de la Casa -->
                <div class="bg-zinc-950/95 border border-zinc-900 p-6 rounded-xl shadow-2xl space-y-6">
                    
                    <!-- KPI Resumen -->
                    <div class="grid grid-cols-3 gap-3 border-b border-zinc-900 pb-5 text-center font-mono">
                        <div class="bg-[#050505] p-3 border border-zinc-900 rounded-lg">
                            <span class="text-[9px] text-zinc-500 block">STOCK MÍNIMO</span>
                            <span class="text-base font-black text-red-500"><%= resultado.getStockMinimo() %></span>
                        </div>
                        <div class="bg-[#050505] p-3 border border-zinc-900 rounded-lg">
                            <span class="text-[9px] text-[var(--dorado)] block">STOCK PROMEDIO</span>
                            <span class="text-base font-black text-[var(--dorado)]"><%= resultado.getStockPromedio() %></span>
                        </div>
                        <div class="bg-[#050505] p-3 border border-zinc-900 rounded-lg">
                            <span class="text-[9px] text-zinc-500 block">STOCK MÁXIMO</span>
                            <span class="text-base font-black text-emerald-500"><%= resultado.getStockMaximo() %></span>
                        </div>
                    </div>

                    <!-- Clasificación de Productos (Gráfico de barras estilizado) -->
                    <div class="space-y-4 font-mono">
                        <h4 class="text-[11px] font-bold text-zinc-400 uppercase tracking-widest">
                            DISTRIBUCIÓN DE LOTES (N=100)
                        </h4>
                        
                        <div class="space-y-3.5 text-xs">
                            <!-- Categoría A -->
                            <div>
                                <div class="flex justify-between mb-1.5">
                                    <span class="text-zinc-400 font-bold">Cat. A: Stock &lt; 50</span>
                                    <span class="text-red-400 font-black"><%= resultado.getCatA() %> %</span>
                                </div>
                                <div class="w-full bg-zinc-900 h-2.5 rounded-full overflow-hidden border border-zinc-900">
                                    <div class="bg-red-500 h-full rounded-full" style="width: <%= resultado.getCatA() %>%"></div>
                                </div>
                            </div>

                            <!-- Categoría B -->
                            <div>
                                <div class="flex justify-between mb-1.5">
                                    <span class="text-zinc-400 font-bold">Cat. B: Stock &ge; 50 pero &lt; 100</span>
                                    <span class="text-amber-400 font-black"><%= resultado.getCatB() %> %</span>
                                </div>
                                <div class="w-full bg-zinc-900 h-2.5 rounded-full overflow-hidden border border-zinc-900">
                                    <div class="bg-amber-500 h-full rounded-full" style="width: <%= resultado.getCatB() %>%"></div>
                                </div>
                            </div>

                            <!-- Categoría C -->
                            <div>
                                <div class="flex justify-between mb-1.5">
                                    <span class="text-zinc-400 font-bold">Cat. C: Stock &ge; 100 pero &lt; 150</span>
                                    <span class="text-emerald-400 font-black"><%= resultado.getCatC() %> %</span>
                                </div>
                                <div class="w-full bg-zinc-900 h-2.5 rounded-full overflow-hidden border border-zinc-900">
                                    <div class="bg-emerald-500 h-full rounded-full" style="width: <%= resultado.getCatC() %>%"></div>
                                </div>
                            </div>

                            <!-- Categoría D -->
                            <div>
                                <div class="flex justify-between mb-1.5">
                                    <span class="text-zinc-400 font-bold">Cat. D: Stock &ge; 150</span>
                                    <span class="text-blue-400 font-black"><%= resultado.getCatD() %> %</span>
                                </div>
                                <div class="w-full bg-zinc-900 h-2.5 rounded-full overflow-hidden border border-zinc-900">
                                    <div class="bg-blue-500 h-full rounded-full" style="width: <%= resultado.getCatD() %>%"></div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Listado Desplegable con Grid de Productos -->
                    <div class="pt-2 border-t border-zinc-900">
                        <h4 class="text-[11px] font-bold text-zinc-400 uppercase tracking-widest font-mono mb-3">HISTORIAL DE CARTAS (LOTES)</h4>
                        <div class="max-h-[160px] overflow-y-auto pr-1 grid grid-cols-4 sm:grid-cols-5 gap-2 scroll-poker">
                            <% 
                                List<S5E6Model.Producto> lista = resultado.getListaProductos();
                                for (S5E6Model.Producto p : lista) {
                                    String colorClase = "";
                                    if (p.getStock() < 50) {
                                        colorClase = "border-red-950 bg-red-950/15 text-red-400";
                                    } else if (p.getStock() < 100) {
                                        colorClase = "border-amber-950 bg-amber-950/15 text-amber-400";
                                    } else if (p.getStock() < 150) {
                                        colorClase = "border-emerald-950 bg-emerald-950/15 text-emerald-400";
                                    } else {
                                        colorClase = "border-blue-950 bg-blue-950/15 text-blue-400";
                                    }
                            %>
                                <div class="p-2 border text-center rounded-lg font-mono <%= colorClase %>">
                                    <div class="text-[8px] opacity-40"><%= p.getCodigo() %></div>
                                    <div class="text-sm font-bold"><%= p.getStock() %></div>
                                </div>
                            <% } %>
                        </div>
                    </div>
                    
                </div>
            <% } %>
        </section>

    </main>

    <!-- Footer -->
    <footer class="max-w-5xl w-full mx-auto text-center border-t border-zinc-900 pt-4 mt-6">
        <p class="text-[10px] text-zinc-500 font-mono tracking-widest uppercase">
            S5E6 - SIMULACIÓN MONTE CARLO EN TIEMPO REAL • CONSOLIDADO SEMANAL
        </p>
    </footer>

</body>
</html>