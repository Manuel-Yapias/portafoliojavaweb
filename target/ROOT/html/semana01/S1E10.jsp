<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>S1E10 - Presupuesto de Feria</title>
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
    </style>
</head>
<body class="min-h-screen flex flex-col p-4 md:p-6 justify-between">

    <header class="w-full max-w-[900px] mx-auto flex items-center justify-between py-5 px-6 bg-[#0d0d0d] border border-[#1c1c1c] rounded-t-lg">
        <div class="flex items-center space-x-4">
            <span class="text-[var(--dorado)] text-2xl font-mono">♦</span>
            <div>
                <h1 class="text-xl font-black tracking-wider text-white">PROYECTO 01</h1>
                <p class="text-[10px] text-[var(--dorado)] tracking-widest font-mono uppercase">Semana 1 - Ejercicio 10</p>
            </div>
        </div>
        <a href="${pageContext.request.contextPath}/index.jsp" class="px-4 py-2 bg-[#141414] border border-[#222] rounded text-xs font-mono text-gray-400 hover:text-[var(--dorado)] hover:border-[var(--dorado)] transition-all">
            ↩ Volver al Deck
        </a>
    </header>

    <main class="w-full max-w-[900px] mx-auto bg-[#0d0d0d] border-x border-[#1c1c1c] p-6 md:p-8 space-y-8">
        
        <div class="bg-[#111] p-4 rounded-lg border border-[#222]">
            <h2 class="text-xs font-mono text-[var(--dorado)] uppercase tracking-wider mb-2">📋 Enunciado del Ejercicio</h2>
            <p class="text-sm text-gray-300 leading-relaxed">
                Una empresa expondrá sus productos en una feria. Dado el monto total de dinero a invertir, diseñe un programa que determine cuánto gastará la empresa en cada rubro aplicando la tabla de porcentajes asignada.
            </p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
            <form action="${pageContext.request.contextPath}/S1E10Controller" method="POST" class="space-y-4">
                <h3 class="text-sm font-mono text-white uppercase tracking-widest border-b border-[#222] pb-2">🎰 Presupuesto de Inversión</h3>
                
                <div>
                    <label for="monto" class="block text-xs font-mono text-gray-400 mb-1">Inversión Total Estimada (S/.):</label>
                    <input type="number" step="0.01" min="0.01" id="monto" name="monto" required 
                           placeholder="Ej. 50000.00"
                           value="${not empty montoOriginal ? montoOriginal : ''}"
                           class="w-full bg-[#141414] border border-[#222] rounded p-2.5 text-sm text-white focus:outline-none focus:border-[var(--dorado)] transition-colors">
                </div>

                <button type="submit" class="w-full py-3 bg-[#111] border border-[var(--dorado-apagado)] rounded text-xs font-mono font-bold text-[var(--dorado)] uppercase tracking-widest hover:bg-[var(--dorado)] hover:text-black transition-all">
                    Distribuir Inversión 🎴
                </button>
            </form>

            <div class="bg-[#121212] border border-[#222] rounded-lg p-6 flex flex-col justify-between">
                <div>
                    <h3 class="text-sm font-mono text-white uppercase tracking-widest border-b border-[#222] pb-2 mb-4">🏆 Plan de Distribución</h3>
                    
                    <% if (request.getAttribute("error") != null) { %>
                        <div class="bg-red-950/40 border border-[var(--rojo-poker)] p-3 rounded text-xs text-red-300 font-mono">
                            ⚠ Error: <%= request.getAttribute("error") %>
                        </div>
                    <% } else if (request.getAttribute("alquiler") != null) { %>
                        <div class="space-y-3 font-mono text-xs">
                            <div class="flex justify-between items-center py-1 border-b border-zinc-900">
                                <span class="text-gray-400">Inversión Total:</span>
                                <span class="text-white font-bold text-sm">S/. ${String.format("%.2f", montoOriginal)}</span>
                            </div>
                            <div class="flex justify-between items-center py-1 border-b border-zinc-900">
                                <span class="text-[var(--dorado)]">Alquiler (23%):</span>
                                <span class="text-white">S/. ${String.format("%.2f", alquiler)}</span>
                            </div>
                            <div class="flex justify-between items-center py-1 border-b border-zinc-900">
                                <span class="text-[var(--dorado)]">Publicidad (7%):</span>
                                <span class="text-white">S/. ${String.format("%.2f", publicidad)}</span>
                            </div>
                            <div class="flex justify-between items-center py-1 border-b border-zinc-900">
                                <span class="text-[var(--dorado)]">Transporte (26%):</span>
                                <span class="text-white">S/. ${String.format("%.2f", transporte)}</span>
                            </div>
                            <div class="flex justify-between items-center py-1 border-b border-zinc-900">
                                <span class="text-[var(--dorado)]">Servicios Feriales (12%):</span>
                                <span class="text-white">S/. ${String.format("%.2f", servicios)}</span>
                            </div>
                            <div class="flex justify-between items-center py-1 border-b border-zinc-900">
                                <span class="text-[var(--dorado)]">Decoración (21%):</span>
                                <span class="text-white">S/. ${String.format("%.2f", decoracion)}</span>
                            </div>
                            <div class="flex justify-between items-center py-1">
                                <span class="text-emerald-400">Gastos Varios (11%):</span>
                                <span class="text-emerald-400 font-bold">S/. ${String.format("%.2f", gastosVarios)}</span>
                            </div>
                        </div>
                    <% } else { %>
                        <p class="text-xs text-gray-500 font-mono italic text-center py-24">Ingresa el presupuesto total para desglosar la inversión de la feria.</p>
                    <% } %>
                </div>
            </div>
        </div>

        <div class="border-t border-[#1c1c1c] pt-6">
            <details class="group bg-[#111] rounded-lg border border-[#222] transition-all duration-300 open:border-[var(--dorado)]">
                <summary class="flex justify-between items-center p-4 cursor-pointer select-none hover:bg-[#161616] transition-colors rounded-lg">
                    <span class="text-xs font-mono text-[var(--dorado)] uppercase tracking-widest flex items-center gap-2">
                        <span>📖</span> MANUAL DE USO Y EXPLICACIÓN DE MÉTODOS (MVC)
                    </span>
                    <span class="text-gray-400 group-open:rotate-180 transition-transform duration-200">▼</span>
                </summary>
                
<div class="space-y-4">

    <!-- Método 1: inyectarResultados() -->
    <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
        <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-sky-400 overflow-x-auto border-l-2 border-sky-500">
            <pre><code>private void inyectarResultados(
    HttpServletRequest request, 
    S1E10Model modelo
) {
    request.setAttribute("montoOriginal", 
        modelo.getMontoInvertir()
    );
    request.setAttribute("alquiler", 
        modelo.calcularAlquiler()
    );
    request.setAttribute("publicidad", 
        modelo.calcularPublicidad()
    );
    request.setAttribute("transporte", 
        modelo.calcularTransporte()
    );
    request.setAttribute("servicios", 
        modelo.calcularServicios()
    );
    request.setAttribute("decoracion", 
        modelo.calcularDecoracion()
    );
    request.setAttribute("gastosVarios", 
        modelo.calcularGastosVarios()
    );
}</code></pre>
        </div>
        <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
            <span class="text-[10px] text-sky-400 tracking-wider mb-1 uppercase font-bold">🧬 CONTROLADOR // SERVLET</span>
            <h5 class="text-white font-bold mb-2 text-sm">Método: inyectarResultados()</h5>
            <p class="text-gray-400 leading-relaxed">
                Encargado <span class="text-[var(--dorado)]">únicamente</span> de adjuntar al Request Scope la inversión inicial y los rubros calculados: alquiler, publicidad, transporte, servicios, decoración y gastos varios.
            </p>
        </div>
    </div>

    <!-- Método 2: despacharVista() -->
    <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
        <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-purple-400 overflow-x-auto border-l-2 border-purple-500">
            <pre><code>private void despacharVista(
    HttpServletRequest request, 
    HttpServletResponse response
) throws ServletException, IOException {
    request.getRequestDispatcher(
        "/html/semana01/S1E10.jsp"
    ).forward(request, response);
}</code></pre>
        </div>
        <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
            <span class="text-[10px] text-purple-400 tracking-wider mb-1 uppercase font-bold">🚀 CONTROLADOR // NAVEGACIÓN</span>
            <h5 class="text-white font-bold mb-2 text-sm">Método: despacharVista()</h5>
            <p class="text-gray-400 leading-relaxed">
                Tiene la <span class="text-[var(--dorado)]">función exclusiva</span> de delegar la navegación reenviando la petición hacia la plantilla JSP del Ejercicio 10.
            </p>
        </div>
    </div>

    <!-- Método 3: calcularAlquiler() -->
    <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
        <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-[var(--dorado)] overflow-x-auto border-l-2 border-[var(--dorado)]">
            <pre><code>public double calcularAlquiler() {
    return this.montoInvertir * 0.23;
}</code></pre>
        </div>
        <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
            <span class="text-[10px] text-[var(--dorado)] tracking-wider mb-1 uppercase font-bold">🧮 MODELO // NEGOCIO</span>
            <h5 class="text-white font-bold mb-2 text-sm">Método: calcularAlquiler()</h5>
            <p class="text-gray-400 leading-relaxed">
                Calcula con <span class="text-[var(--dorado)]">responsabilidad única</span> el presupuesto asignado a Alquiler de espacio, equivalente al **23%** del total a invertir.
            </p>
        </div>
    </div>

    <!-- Método 4: calcularPublicidad() -->
    <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
        <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-[var(--dorado)] overflow-x-auto border-l-2 border-[var(--dorado)]">
            <pre><code>public double calcularPublicidad() {
    return this.montoInvertir * 0.07;
}</code></pre>
        </div>
        <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
            <span class="text-[10px] text-[var(--dorado)] tracking-wider mb-1 uppercase font-bold">🧮 MODELO // NEGOCIO</span>
            <h5 class="text-white font-bold mb-2 text-sm">Método: calcularPublicidad()</h5>
            <p class="text-gray-400 leading-relaxed">
                Tiene la <span class="text-[var(--dorado)]">única tarea</span> de calcular el **7%** del presupuesto destinado a estrategias de Publicidad.
            </p>
        </div>
    </div>

    <!-- Método 5: calcularTransporte() -->
    <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
        <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-[var(--dorado)] overflow-x-auto border-l-2 border-[var(--dorado)]">
            <pre><code>public double calcularTransporte() {
    return this.montoInvertir * 0.26;
}</code></pre>
        </div>
        <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
            <span class="text-[10px] text-[var(--dorado)] tracking-wider mb-1 uppercase font-bold">🧮 MODELO // NEGOCIO</span>
            <h5 class="text-white font-bold mb-2 text-sm">Método: calcularTransporte()</h5>
            <p class="text-gray-400 leading-relaxed">
                Determina con <span class="text-[var(--dorado)]">responsabilidad exclusiva</span> el costo de Transporte aplicando el **26%** al monto de inversión.
            </p>
        </div>
    </div>

    <!-- Método 6: calcularServicios() -->
    <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
        <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-[var(--dorado)] overflow-x-auto border-l-2 border-[var(--dorado)]">
            <pre><code>public double calcularServicios() {
    return this.montoInvertir * 0.12;
}</code></pre>
        </div>
        <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
            <span class="text-[10px] text-[var(--dorado)] tracking-wider mb-1 uppercase font-bold">🧮 MODELO // NEGOCIO</span>
            <h5 class="text-white font-bold mb-2 text-sm">Método: calcularServicios()</h5>
            <p class="text-gray-400 leading-relaxed">
                Su <span class="text-[var(--dorado)]">única tarea</span> es calcular la partida asignada a Servicios Feriales equivalente al **12%** del monto total.
            </p>
        </div>
    </div>

    <!-- Método 7: calcularDecoracion() -->
    <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
        <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-[var(--dorado)] overflow-x-auto border-l-2 border-[var(--dorado)]">
            <pre><code>public double calcularDecoracion() {
    return this.montoInvertir * 0.21;
}</code></pre>
        </div>
        <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
            <span class="text-[10px] text-[var(--dorado)] tracking-wider mb-1 uppercase font-bold">🧮 MODELO // NEGOCIO</span>
            <h5 class="text-white font-bold mb-2 text-sm">Método: calcularDecoracion()</h5>
            <p class="text-gray-400 leading-relaxed">
                Calcula la asignación para Decoración del stand equivalente al **21%** de la inversión inicial con <span class="text-[var(--dorado)]">responsabilidad única</span>.
            </p>
        </div>
    </div>

    <!-- Método 8: calcularGastosVarios() -->
    <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
        <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-[var(--dorado)] overflow-x-auto border-l-2 border-[var(--dorado)]">
            <pre><code>public double calcularGastosVarios() {
    return this.montoInvertir * 0.11;
}</code></pre>
        </div>
        <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
            <span class="text-[10px] text-[var(--dorado)] tracking-wider mb-1 uppercase font-bold">🧮 MODELO // NEGOCIO</span>
            <h5 class="text-white font-bold mb-2 text-sm">Método: calcularGastosVarios()</h5>
            <p class="text-gray-400 leading-relaxed">
                Se encarga <span class="text-[var(--dorado)]">únicamente</span> de calcular el **11%** restante destinado al fondo de Gastos Varios.
            </p>
        </div>
    </div>

</div>
            </details>
        </div>

    </main>

    <footer class="w-full max-w-[900px] mx-auto text-center text-[9px] text-gray-600 tracking-[0.3em] uppercase py-4 border-t border-[#1c1c1c] bg-[#0d0d0d] rounded-b-lg">
        ♦ PROYECTO 01 DESARROLLADO POR MANUEL ROSALES YAPIAS © 2026 ♦
    </footer>

</body>
</html>