<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.folderrosalesd3.model.semana10.S10E1Model" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>S10E1 - Casino Aritmético: Prevención de Overflow</title>
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
            .poker-badge {
                background: linear-gradient(135deg, var(--rojo-poker) 0%, #b31010 100%);
                box-shadow: 0 0 10px rgba(255, 51, 68, 0.4);
            }
            .gold-glow {
                text-shadow: 0 0 10px rgba(255, 204, 0, 0.5);
            }
        </style>
    </head>
    <body class="min-h-screen flex flex-col justify-between p-4 md:p-8">

        <header class="max-w-5xl mx-auto w-full text-center mb-8">
            <div class="inline-block border-b-2 border-yellow-500 pb-2 mb-4">
                <span class="text-xs uppercase tracking-widest text-yellow-500 font-semibold">♣ High Roller Backend - S10 ♣</span>
            </div>
            <h1 class="text-4xl md:text-5xl font-extrabold gold-glow text-yellow-400 tracking-tight">
                SISTEMA DE PREVENCIÓN DE OVERFLOW
            </h1>
            <p class="text-gray-400 text-sm md:text-base mt-2">
                Control exacto de aritmética en la Mesa de la Semana 10.
            </p>
            <a href="${pageContext.request.contextPath}/index.jsp" 
               class="text-xs font-mono px-4 py-2 border border-zinc-800 bg-zinc-950/60 hover:border-[var(--dorado)] hover:text-[var(--dorado)] transition-all rounded">
                Volver al Deck Principal
            </a>
        </header>

        <main class="max-w-4xl mx-auto w-full flex-grow grid grid-cols-1 md:grid-cols-12 gap-8 items-start">

            <section class="md:col-span-5 bg-zinc-900/90 casino-border p-6 rounded-2xl">
                <div class="flex items-center space-x-3 mb-6">
                    <span class="text-2xl">🎲</span>
                    <h2 class="text-xl font-bold text-white tracking-wide">Iniciar Multiplicador</h2>
                </div>

                <form action="${pageContext.request.contextPath}/S10E1Controller" method="POST" class="space-y-6">
                    <div>
                        <label for="txtNumero" class="block text-xs uppercase font-bold text-gray-400 mb-2 tracking-wider">
                            Ingresa un Número Entero (Base):
                        </label>
                        <input 
                            type="number" 
                            name="txtNumero" 
                            id="txtNumero" 
                            placeholder="Ej. 6, 15, -9"
                            required
                            class="w-full bg-black/50 border border-zinc-700 rounded-lg py-3 px-4 text-white focus:outline-none focus:ring-2 focus:ring-yellow-500 focus:border-transparent transition text-lg"
                            />
                        <p class="text-[11px] text-gray-500 mt-1">Sugerencia: Prueba con valores que desborden rápido para comprobar el sistema.</p>
                    </div>

                    <button 
                        type="submit" 
                        class="w-full bg-gradient-to-r from-yellow-500 to-amber-600 hover:from-yellow-400 hover:to-amber-500 text-black font-black text-sm uppercase tracking-widest py-4 px-6 rounded-xl transition duration-300 transform hover:-translate-y-0.5 shadow-lg active:translate-y-0"
                        >
                        Ejecutar Bucle Seguro
                    </button>
                </form>

                <% if (request.getAttribute("error") != null) {%>
                <div class="mt-6 border-l-4 border-red-500 bg-red-950/40 p-4 rounded-r-lg">
                    <div class="flex">
                        <span class="text-red-500 mr-2 font-bold">⚠️ Error:</span>
                        <p class="text-sm text-red-200"><%= request.getAttribute("error")%></p>
                    </div>
                </div>
                <% } %>
            </section>

            <section class="md:col-span-7 bg-zinc-900/90 border border-zinc-800 p-6 rounded-2xl min-h-[400px] flex flex-col justify-between">
                <div>
                    <div class="flex justify-between items-center border-b border-zinc-800 pb-4 mb-6">
                        <h3 class="font-bold text-lg tracking-wider text-gray-300">♠ Historial del Crupier</h3>
                        <span class="text-xs font-mono bg-black text-yellow-500 px-3 py-1 rounded-full border border-yellow-500/20">
                            Int32 Safe Mode (S10)
                        </span>
                    </div>

                    <%
                        S10E1Model resultado = (S10E1Model) request.getAttribute("modeloResultado");
                        if (resultado != null) {
                    %>
                    <div class="space-y-4">
                        <div class="grid grid-cols-2 gap-4">
                            <div class="bg-black/40 p-3 rounded-lg border border-zinc-800">
                                <span class="block text-[10px] text-gray-500 uppercase">Semilla Base</span>
                                <span class="text-xl font-mono font-bold text-yellow-400"><%= resultado.getNumeroBase()%></span>
                            </div>
                            <div class="bg-black/40 p-3 rounded-lg border border-zinc-800">
                                <span class="block text-[10px] text-gray-500 uppercase">Iteraciones</span>
                                <span class="text-xl font-mono font-bold text-white"><%= resultado.getHistorialPotencias().size()%> pasos</span>
                            </div>
                        </div>

                        <h4 class="text-xs uppercase font-bold text-gray-400 tracking-wider mt-6">Secuencia de Potencias Sucesivas:</h4>
                        <div class="bg-black/60 rounded-xl p-4 max-h-[180px] overflow-y-auto font-mono text-sm space-y-2 border border-zinc-800">
                            <%
                                List<Integer> historial = resultado.getHistorialPotencias();
                                for (int i = 0; i < historial.size(); i++) {
                            %>
                            <div class="flex justify-between items-center py-1 border-b border-zinc-900/50">
                                <span class="text-gray-500 text-xs">Potencia [^<%= i + 1%>]:</span>
                                <span class="text-green-400 font-bold"><%= historial.get(i)%></span>
                            </div>
                            <% } %>
                        </div>

                        <% if (resultado.isDesbordado()) {%>
                        <div class="poker-badge p-4 rounded-xl flex items-start space-x-3 mt-6">
                            <span class="text-2xl">🚨</span>
                            <div>
                                <h4 class="font-bold text-white uppercase text-xs tracking-wider">Bucle Detenido Limpiamente</h4>
                                <p class="text-xs text-red-100 mt-1 leading-relaxed"><%= resultado.getMensajeEstado()%></p>
                            </div>
                        </div>
                        <% } %>
                    </div>
                    <% } else { %>
                    <div class="flex flex-col items-center justify-center py-20 text-center">
                        <div class="w-16 h-16 rounded-full bg-zinc-800 flex items-center justify-center text-3xl mb-4 border border-zinc-700">
                            🃏
                        </div>
                        <h4 class="text-lg font-bold text-zinc-400">Prueba de Seguridad Aritmética</h4>
                        <p class="text-sm text-zinc-500 max-w-xs mt-2">
                            Ingresa una base numérica para verificar la captura precisa de un Overflow.
                        </p>
                    </div>
                    <% }%>
                </div>

                <div class="border-t border-zinc-800/80 pt-4 mt-6 flex justify-between text-xs text-zinc-650">
                    <span>Límites de Máquina: 32-bit Integer</span>
                    <span>Mesa S10 © 2026</span>
                </div>
            </section>
        </main>
        <div class="border-t border-[#1c1c1c] pt-6">
            <details class="group bg-[#111] rounded-lg border border-[#222] transition-all duration-300 open:border-[var(--dorado)]">
                <summary class="flex justify-between items-center p-4 cursor-pointer select-none hover:bg-[#161616] transition-colors rounded-lg">
                    <span class="text-xs font-mono text-[var(--dorado)] uppercase tracking-widest flex items-center gap-2">
                        <span>📖</span> MANUAL DE USO Y EXPLICACIÓN DE MÉTODOS (MVC)
                    </span>
                    <span class="text-gray-400 group-open:rotate-180 transition-transform duration-200">▼</span>
                </summary>

                <div class="p-6 border-t border-[#222] space-y-6">

                    <!-- Banner Informativo -->
                    <div class="bg-amber-950/20 border-l-4 border-[var(--dorado)] p-4 rounded-r-lg">
                        <h4 class="text-xs font-mono text-[var(--dorado)] font-bold uppercase mb-1">Arquitectura Limpia & Responsabilidad Única</h4>
                        <p class="text-[11px] text-gray-300 font-mono leading-relaxed">
                            Para este proyecto, aplicamos la regla de <span class="text-[var(--dorado)] font-bold">Un Método, Una Única Función</span>. 
                            Cada bloque de código de nuestro controlador y modelo ha sido fragmentado para encargarse exclusivamente de una tarea lógica (capturar, calcular o renderizar), 
                            evitando métodos acoplados y facilitando el mantenimiento.
                        </p>
                    </div>

                    <div class="space-y-4">

                        <!-- Tarjeta 1: Modelo - calcularPotenciasSucesivas -->
                        <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                            <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-[var(--dorado)] overflow-x-auto border-l-2 border-[var(--dorado)]">
                                <pre><code>public void calcularPotenciasSucesivas() {
    int acumulado = numeroBase;
    historialPotencias.add(acumulado);

    try {
        while (true) {
            acumulado = Math.multiplyExact(acumulado, numeroBase);
            historialPotencias.add(acumulado);
        }
    } catch (ArithmeticException e) {
        this.desbordado = true;
        this.mensajeEstado = "¡ALERTA DE OVERFLOW DETECTADA!";
    }
}</code></pre>
                            </div>
                            <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                <span class="text-[10px] text-[var(--dorado)] tracking-wider mb-1 uppercase font-bold">🧮 MODELO // NEGOCIO</span>
                                <h5 class="text-white font-bold mb-2 text-sm">Método: calcularPotenciasSucesivas()</h5>
                                <p class="text-gray-400 leading-relaxed">
                                    Tiene la <span class="text-[var(--dorado)]">única función</span> de multiplicar iterativamente la base por sí misma capturando el punto exacto de desbordamiento de 32 bits (<code class="text-[var(--dorado)]">Integer.MAX_VALUE</code>) mediante la función defensiva <code class="text-[var(--dorado)]">Math.multiplyExact()</code> y su bloque de captura de excepciones.
                                </p>
                            </div>
                        </div>

                        <!-- Tarjeta 2: Controlador - doPost (Validación de Neutrales y Despacho) -->
                        <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                            <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-sky-400 overflow-x-auto border-l-2 border-sky-500">
                                <pre><code>int numeroBase = Integer.parseInt(txtNumero.trim());

if (numeroBase == 0 || numeroBase == 1 || numeroBase == -1) {
    request.setAttribute("error", 
        "Ingresa un número entero distinto de -1, 0 o 1...");
    return;
}

S10E1Model modelo = new S10E1Model(numeroBase);
modelo.calcularPotenciasSucesivas();
request.setAttribute("modeloResultado", modelo);</code></pre>
                            </div>
                            <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                <span class="text-[10px] text-sky-400 tracking-wider mb-1 uppercase font-bold">🧬 CONTROLADOR // SERVLET</span>
                                <h5 class="text-white font-bold mb-2 text-sm">Filtro Antibucle Inconcluso e Inyección</h5>
                                <p class="text-gray-400 leading-relaxed">
                                    Encargado <span class="text-[var(--dorado)]">únicamente</span> de receptar el número base, descartar valores neutros que causarían bucles infinitos no desbordables (0, 1 y -1), delegar la secuencia aritmética al modelo y pasar los resultados a la vista.
                                </p>
                            </div>
                        </div>

                    </div>

                    <div class="text-center pt-2 border-t border-[#222]">
                        <p class="text-[10px] text-gray-500 font-mono">
                            * El flujo termina delegando la visualización dinámica a las etiquetas Expression Language (EL) en este archivo JSP.
                        </p>
                    </div>

                </div>
            </details>
        </div>
        <footer class="text-center text-xs text-zinc-600 mt-12">
            <p>Patrón MVC • Tailwind CSS & Casino Dark Visuals • Semana 10.</p>
        </footer>

    </body>
</html>