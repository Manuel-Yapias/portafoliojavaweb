<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>S1E3 - Área de un Rombo / Trapecio</title>
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
                    <p class="text-[10px] text-[var(--dorado)] tracking-widest font-mono uppercase">Semana 1 - Ejercicio 3</p>
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
                    Diseñe un algoritmo que determine el área (A) de un rombo del que se conoce su base mayor (B), su base menor (b) y su altura (h).
                </p>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                <form action="${pageContext.request.contextPath}/S1E3Controller" method="POST" class="space-y-4">
                    <h3 class="text-sm font-mono text-white uppercase tracking-widest border-b border-[#222] pb-2">🎰 Ingreso de Datos</h3>

                    <div>
                        <label for="baseMayor" class="block text-xs font-mono text-gray-400 mb-1">Base Mayor (B):</label>
                        <input type="number" step="any" id="baseMayor" name="baseMayor" required 
                               value="${not empty baseMayor ? baseMayor : ''}"
                               class="w-full bg-[#141414] border border-[#222] rounded p-2.5 text-sm text-white focus:outline-none focus:border-[var(--dorado)] transition-colors">
                    </div>

                    <div>
                        <label for="baseMenor" class="block text-xs font-mono text-gray-400 mb-1">Base Menor (b):</label>
                        <input type="number" step="any" id="baseMenor" name="baseMenor" required 
                               value="${not empty baseMenor ? baseMenor : ''}"
                               class="w-full bg-[#141414] border border-[#222] rounded p-2.5 text-sm text-white focus:outline-none focus:border-[var(--dorado)] transition-colors">
                    </div>

                    <div>
                        <label for="altura" class="block text-xs font-mono text-gray-400 mb-1">Altura (h):</label>
                        <input type="number" step="any" id="altura" name="altura" required 
                               value="${not empty altura ? altura : ''}"
                               class="w-full bg-[#141414] border border-[#222] rounded p-2.5 text-sm text-white focus:outline-none focus:border-[var(--dorado)] transition-colors">
                    </div>

                    <button type="submit" class="w-full py-3 bg-[#111] border border-[var(--dorado-apagado)] rounded text-xs font-mono font-bold text-[var(--dorado)] uppercase tracking-widest hover:bg-[var(--dorado)] hover:text-black transition-all">
                        Calcular Área 🎴
                    </button>
                </form>

                <div class="bg-[#121212] border border-[#222] rounded-lg p-6 flex flex-col justify-between">
                    <div>
                        <h3 class="text-sm font-mono text-white uppercase tracking-widest border-b border-[#222] pb-2 mb-4">🏆 Mesa de Resultados</h3>

                        <% if (request.getAttribute("error") != null) {%>
                        <div class="bg-red-950/40 border border-[var(--rojo-poker)] p-3 rounded text-xs text-red-300 font-mono">
                            ⚠ Error: <%= request.getAttribute("error")%>
                        </div>
                        <% } else if (request.getAttribute("area") != null) { %>
                        <div class="space-y-4 font-mono">
                            <div class="flex justify-between items-center py-2 border-b border-[#1c1c1c]">
                                <span class="text-xs text-gray-400">Base Mayor (B):</span>
                                <span class="text-sm text-white">${baseMayor} u</span>
                            </div>
                            <div class="flex justify-between items-center py-2 border-b border-[#1c1c1c]">
                                <span class="text-xs text-gray-400">Base Menor (b):</span>
                                <span class="text-sm text-white">${baseMenor} u</span>
                            </div>
                            <div class="flex justify-between items-center py-2 border-b border-[#1c1c1c]">
                                <span class="text-xs text-gray-400">Altura (h):</span>
                                <span class="text-sm text-white">${altura} u</span>
                            </div>
                            <div class="flex justify-between items-center py-2">
                                <span class="text-xs text-[var(--dorado)]">Área Calculada (A):</span>
                                <span class="text-lg font-bold text-[var(--dorado)]">${area} u²</span>
                            </div>
                        </div>
                        <% } else { %>
                        <p class="text-xs text-gray-500 font-mono italic text-center py-20">Inserta los valores requeridos y haz clic en calcular.</p>
                        <% }%>
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

                        <!-- Método 1: extraerParametros() -->
                        <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                            <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-emerald-400 overflow-x-auto border-l-2 border-emerald-500">
                                <pre><code>private S1E3Model extraerParametros(
    HttpServletRequest request
) throws NumberFormatException {
    double bMenor = Double.parseDouble(
        request.getParameter("baseMenor")
    );
    double bMayor = Double.parseDouble(
        request.getParameter("baseMayor")
    );
    double h = Double.parseDouble(
        request.getParameter("altura")
    );
    return new S1E3Model(bMenor, bMayor, h);
}</code></pre>
                            </div>
                            <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                <span class="text-[10px] text-emerald-400 tracking-wider mb-1 uppercase font-bold">🛠️ CONTROLADOR // SERVLET</span>
                                <h5 class="text-white font-bold mb-2 text-sm">Método: extraerParametros()</h5>
                                <p class="text-gray-400 leading-relaxed">
                                    Tiene la <span class="text-[var(--dorado)]">única responsabilidad</span> de capturar los valores ingresados (base menor, base mayor y altura) desde la petición HTTP, parsearlos a decimales y empaquetarlos en el modelo.
                                </p>
                            </div>
                        </div>

                        <!-- Método 2: inyectarResultados() -->
                        <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                            <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-sky-400 overflow-x-auto border-l-2 border-sky-500">
                                <pre><code>private void inyectarResultados(
    HttpServletRequest request, 
    S1E3Model modelo
) {
    request.setAttribute("area", 
        modelo.calcularArea()
    );
    request.setAttribute("baseMenor", 
        request.getParameter("baseMenor")
    );
    request.setAttribute("baseMayor", 
        request.getParameter("baseMayor")
    );
    request.setAttribute("altura", 
        request.getParameter("altura")
    );
}</code></pre>
                            </div>
                            <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                <span class="text-[10px] text-sky-400 tracking-wider mb-1 uppercase font-bold">🧬 CONTROLADOR // SERVLET</span>
                                <h5 class="text-white font-bold mb-2 text-sm">Método: inyectarResultados()</h5>
                                <p class="text-gray-400 leading-relaxed">
                                    Se encarga <span class="text-[var(--dorado)]">únicamente</span> de adjuntar el resultado del cálculo del área y los datos de entrada al request, asegurando la disponibilidad de datos en la vista.
                                </p>
                            </div>
                        </div>

                        <!-- Método 3: despacharVista() -->
                        <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                            <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-purple-400 overflow-x-auto border-l-2 border-purple-500">
                                <pre><code>private void despacharVista(
    HttpServletRequest request, 
    HttpServletResponse response
) throws ServletException, IOException {
    request.getRequestDispatcher(
        "/html/semana01/S1E3.jsp"
    ).forward(request, response);
}</code></pre>
                            </div>
                            <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                <span class="text-[10px] text-purple-400 tracking-wider mb-1 uppercase font-bold">🚀 CONTROLADOR // NAVEGACIÓN</span>
                                <h5 class="text-white font-bold mb-2 text-sm">Método: despacharVista()</h5>
                                <p class="text-gray-400 leading-relaxed">
                                    Su <span class="text-[var(--dorado)]">única función</span> es redirigir el flujo de control hacia la vista JSP del Ejercicio 3 para presentar los datos finales al usuario.
                                </p>
                            </div>
                        </div>

                        <!-- Método 4: calcularArea() -->
                        <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                            <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-[var(--dorado)] overflow-x-auto border-l-2 border-[var(--dorado)]">
                                <pre><code>public double calcularArea() {
    return ((this.baseMenor + this.baseMayor) 
            * this.altura) / 2.0;
}</code></pre>
                            </div>
                            <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                <span class="text-[10px] text-[var(--dorado)] tracking-wider mb-1 uppercase font-bold">🧮 MODELO // NEGOCIO</span>
                                <h5 class="text-white font-bold mb-2 text-sm">Método: calcularArea()</h5>
                                <p class="text-gray-400 leading-relaxed">
                                    Aplica con <span class="text-[var(--dorado)]">responsabilidad única</span> la fórmula geométrica del trapecio sumando sus bases, multiplicando por la altura y dividiendo el resultado entre dos.
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