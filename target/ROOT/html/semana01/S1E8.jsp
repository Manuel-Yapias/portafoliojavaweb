<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>S1E8 - Conversor de Segundos</title>
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
                <p class="text-[10px] text-[var(--dorado)] tracking-widest font-mono uppercase">Semana 1 - Ejercicio 8</p>
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
                Crear un programa que permita convertir una cantidad de segundos en horas, minutos y segundos.
            </p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
            <form action="${pageContext.request.contextPath}/S1E8Controller" method="POST" class="space-y-4">
                <h3 class="text-sm font-mono text-white uppercase tracking-widest border-b border-[#222] pb-2">🎰 Ingreso de Datos</h3>
                
                <div>
                    <label for="segundosTotales" class="block text-xs font-mono text-gray-400 mb-1">Cantidad de segundos:</label>
                    <input type="number" min="0" step="1" id="segundosTotales" name="segundosTotales" required 
                           placeholder="Ej. 3661"
                           value="${not empty segundosTotales ? segundosTotales : ''}"
                           class="w-full bg-[#141414] border border-[#222] rounded p-2.5 text-sm text-white focus:outline-none focus:border-[var(--dorado)] transition-colors">
                </div>

                <button type="submit" class="w-full py-3 bg-[#111] border border-[var(--dorado-apagado)] rounded text-xs font-mono font-bold text-[var(--dorado)] uppercase tracking-widest hover:bg-[var(--dorado)] hover:text-black transition-all">
                    Convertir Tiempo 🎴
                </button>
            </form>

            <div class="bg-[#121212] border border-[#222] rounded-lg p-6 flex flex-col justify-between">
                <div>
                    <h3 class="text-sm font-mono text-white uppercase tracking-widest border-b border-[#222] pb-2 mb-4">🏆 Mesa de Resultados</h3>
                    
                    <% if (request.getAttribute("error") != null) { %>
                        <div class="bg-red-950/40 border border-[var(--rojo-poker)] p-3 rounded text-xs text-red-300 font-mono">
                            ⚠ Error: <%= request.getAttribute("error") %>
                        </div>
                    <% } else if (request.getAttribute("horas") != null) { %>
                        <div class="space-y-4 font-mono text-center py-4">
                            <div class="text-[10px] text-gray-500 uppercase tracking-widest">Tiempo Formateado (HH:MM:SS)</div>
                            <div class="text-3xl font-bold tracking-widest text-[var(--dorado)] bg-black/40 py-4 rounded border border-zinc-900">
                                <span class="px-1">${horas < 10 ? '0' : ''}${horas}</span>:<span class="px-1">${minutos < 10 ? '0' : ''}${minutos}</span>:<span class="px-1">${segundos < 10 ? '0' : ''}${segundos}</span>
                            </div>
                            <div class="text-left text-xs text-gray-400 space-y-1.5 pt-4 border-t border-zinc-900">
                                <div class="flex justify-between"><span>Segundos ingresados:</span> <span class="text-white">${segundosTotales}s</span></div>
                                <div class="flex justify-between"><span>Horas:</span> <span class="text-white">${horas}h</span></div>
                                <div class="flex justify-between"><span>Minutos:</span> <span class="text-white">${minutos}m</span></div>
                                <div class="flex justify-between"><span>Segundos restantes:</span> <span class="text-white">${segundos}s</span></div>
                            </div>
                        </div>
                    <% } else { %>
                        <p class="text-xs text-gray-500 font-mono italic text-center py-16">Escribe una cantidad de segundos para iniciar la conversión.</p>
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
    S1E8Model modelo, 
    int segundosTotales
) {
    request.setAttribute("horas", 
        modelo.calcularHoras()
    );
    request.setAttribute("minutos", 
        modelo.calcularMinutos()
    );
    request.setAttribute("segundos", 
        modelo.calcularSegundos()
    );
    request.setAttribute("segundosTotales", 
        segundosTotales
    );
}</code></pre>
        </div>
        <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
            <span class="text-[10px] text-sky-400 tracking-wider mb-1 uppercase font-bold">🧬 CONTROLADOR // SERVLET</span>
            <h5 class="text-white font-bold mb-2 text-sm">Método: inyectarResultados()</h5>
            <p class="text-gray-400 leading-relaxed">
                Encargado <span class="text-[var(--dorado)]">únicamente</span> de colocar en el Request Scope los valores calculados de horas, minutos y segundos sobrantes, junto al total ingresado por el usuario.
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
        "/html/semana01/S1E8.jsp"
    ).forward(request, response);
}</code></pre>
        </div>
        <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
            <span class="text-[10px] text-purple-400 tracking-wider mb-1 uppercase font-bold">🚀 CONTROLADOR // NAVEGACIÓN</span>
            <h5 class="text-white font-bold mb-2 text-sm">Método: despacharVista()</h5>
            <p class="text-gray-400 leading-relaxed">
                Tiene la <span class="text-[var(--dorado)]">función exclusiva</span> de transferir el control de la petición hacia la plantilla JSP del Ejercicio 8 para presentar los datos.
            </p>
        </div>
    </div>

    <!-- Método 3: calcularHoras() -->
    <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
        <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-[var(--dorado)] overflow-x-auto border-l-2 border-[var(--dorado)]">
            <pre><code>public int calcularHoras() {
    return this.segundosTotales / 3600;
}</code></pre>
        </div>
        <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
            <span class="text-[10px] text-[var(--dorado)] tracking-wider mb-1 uppercase font-bold">🧮 MODELO // NEGOCIO</span>
            <h5 class="text-white font-bold mb-2 text-sm">Método: calcularHoras()</h5>
            <p class="text-gray-400 leading-relaxed">
                Aplica la división entera entre 3600 con <span class="text-[var(--dorado)]">responsabilidad única</span> para determinar cuántas horas equivalen los segundos ingresados.
            </p>
        </div>
    </div>

    <!-- Método 4: calcularMinutos() -->
    <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
        <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-[var(--dorado)] overflow-x-auto border-l-2 border-[var(--dorado)]">
            <pre><code>public int calcularMinutos() {
    return (this.segundosTotales % 3600) / 60;
}</code></pre>
        </div>
        <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
            <span class="text-[10px] text-[var(--dorado)] tracking-wider mb-1 uppercase font-bold">🧮 MODELO // NEGOCIO</span>
            <h5 class="text-white font-bold mb-2 text-sm">Método: calcularMinutos()</h5>
            <p class="text-gray-400 leading-relaxed">
                Su <span class="text-[var(--dorado)]">única tarea</span> es calcular los minutos completos contenidos en el residuo de segundos que no llegaron a formar una hora entera.
            </p>
        </div>
    </div>

    <!-- Método 5: calcularSegundos() -->
    <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
        <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-[var(--dorado)] overflow-x-auto border-l-2 border-[var(--dorado)]">
            <pre><code>public int calcularSegundos() {
    return this.segundosTotales % 60;
}</code></pre>
        </div>
        <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
            <span class="text-[10px] text-[var(--dorado)] tracking-wider mb-1 uppercase font-bold">🧮 MODELO // NEGOCIO</span>
            <h5 class="text-white font-bold mb-2 text-sm">Método: calcularSegundos()</h5>
            <p class="text-gray-400 leading-relaxed">
                Se encarga <span class="text-[var(--dorado)]">únicamente</span> de obtener las unidades de segundos sobrantes mediante la operación módulo 60.
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