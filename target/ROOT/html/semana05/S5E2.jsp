<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.folderrosalesd3.model.semana05.S5E2Model" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>S5E2 - Suma de Serie Fraccionaria</title>
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
            /* Carta estilo Casino premium */
            .card-poker {
                background: linear-gradient(135deg, #141414 0%, #080808 100%);
                border: 1px solid rgba(255, 204, 0, 0.15);
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.8);
                transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            }
            .card-poker:hover {
                border-color: var(--dorado);
                transform: translateY(-4px);
                box-shadow: 0 10px 25px rgba(255, 204, 0, 0.15);
            }
            /* Custom scrollbar para la banca de fichas */
            .casino-scroll::-webkit-scrollbar {
                width: 6px;
            }
            .casino-scroll::-webkit-scrollbar-track {
                background: #050505;
            }
            .casino-scroll::-webkit-scrollbar-thumb {
                background: var(--dorado-apagado);
                border-radius: 4px;
            }
        </style>
    </head>
    <body class="min-h-screen flex flex-col justify-between py-6 px-4">

        <header class="max-w-5xl w-full mx-auto flex justify-between items-center border-b border-zinc-800 pb-4 mb-6">
            <div class="flex items-center space-x-3">
                <span class="text-2xl text-[var(--rojo-poker)]">♥️</span>
                <div>
                    <h1 class="text-lg font-bold tracking-widest text-[var(--dorado)] uppercase">MESA S5E2</h1>
                    <p class="text-[10px] text-gray-400 font-mono">SERIES FRACCIONARIAS COMPLEJAS</p>
                </div>
            </div>
            <a href="${pageContext.request.contextPath}/index.jsp" 
               class="text-xs font-mono px-4 py-2 border border-zinc-800 bg-zinc-950/60 hover:border-[var(--dorado)] hover:text-[var(--dorado)] transition-all rounded">
                Volver al Deck Principal
            </a>
        </header>

        <main class="max-w-5xl w-full mx-auto grid grid-cols-1 md:grid-cols-12 gap-6 items-start my-auto">

            <section class="md:col-span-5 bg-zinc-950/80 border border-zinc-900 p-6 rounded-xl shadow-2xl relative overflow-hidden">
                <div class="absolute top-0 right-0 w-32 h-32 bg-amber-500/5 rounded-full blur-3xl"></div>

                <h2 class="text-xl font-extrabold text-[var(--dorado)] tracking-wide mb-2 uppercase">REPARTIR FICHAS</h2>
                <p class="text-xs text-gray-400 mb-6">Configure el número de términos para evaluar la sumatoria de la serie fraccionaria (2/5 + 5/9 + 8/13...).</p>

                <% if (request.getAttribute("error") != null) {%>
                <div class="mb-4 p-3.5 bg-red-950/30 border border-[var(--rojo-poker)] text-[var(--rojo-poker)] rounded text-xs font-mono flex items-center space-x-2">
                    <span>⚠️</span>
                    <span><%= request.getAttribute("error")%></span>
                </div>
                <% } %>

                <form action="${pageContext.request.contextPath}/S5E2Controller" method="POST" class="space-y-4 font-mono">
                    <div>
                        <label class="block text-[11px] text-gray-400 uppercase tracking-widest mb-1.5 font-bold">NÚMERO DE TÉRMINOS (N)</label>
                        <input type="number" name="terminos" required min="1" max="60" placeholder="Rango: 1 - 60"
                               class="w-full bg-[#0a0a0a] border border-zinc-800 focus:border-[var(--dorado)] text-white text-sm px-4 py-3 rounded outline-none transition-all focus:ring-1 focus:ring-[var(--dorado)]">
                        <span class="text-[9px] text-zinc-500 mt-1.5 block">Matriz: N = +3 progresivo / D = +4 progresivo</span>
                    </div>

                    <button type="submit" 
                            class="w-full py-3.5 mt-2 bg-gradient-to-r from-amber-600 to-yellow-500 hover:from-yellow-500 hover:to-amber-500 text-black text-xs uppercase tracking-widest font-black rounded-lg transition-all shadow-lg hover:shadow-yellow-500/10">
                        ♣️ Calcular Retorno
                    </button>
                </form>
            </section>

            <section class="md:col-span-7 flex flex-col h-full justify-between">
                <%
                    S5E2Model resultado = (S5E2Model) request.getAttribute("resultado");
                    if (resultado == null) {
                %>
                <div class="h-full min-h-[340px] bg-zinc-950/30 border-2 border-dashed border-zinc-900 rounded-xl flex flex-col items-center justify-center p-8 text-center">
                    <span class="text-4xl mb-4 opacity-45">♣️</span>
                    <h3 class="text-sm font-bold text-gray-400 uppercase tracking-widest">Mesa por Jugar</h3>
                    <p class="text-xs text-gray-500 max-w-xs mt-2">El dealer está listo. Ingrese un valor para repartir los términos fraccionarios y obtener la sumatoria exacta.</p>
                </div>
                <% } else {%>
                <div class="bg-zinc-950/80 border border-zinc-900 p-6 rounded-xl shadow-2xl space-y-6">

                    <div class="grid grid-cols-3 gap-4 border-b border-zinc-900 pb-5">
                        <div class="bg-[#050505] p-3.5 border border-zinc-900 rounded-lg text-center">
                            <span class="text-[9px] text-gray-400 block font-mono">MESA (N)</span>
                            <span class="text-lg font-black text-white font-mono"><%= resultado.getnTerminos()%></span>
                        </div>
                        <div class="bg-[#050505] p-3.5 border border-zinc-900 rounded-lg text-center ring-1 ring-amber-500/20">
                            <span class="text-[9px] text-[var(--dorado)] block font-mono">SUMA DE SERIE</span>
                            <span class="text-lg font-black text-[var(--dorado)] font-mono"><%= resultado.getSumaTotal()%></span>
                        </div>
                        <div class="bg-[#050505] p-3.5 border border-zinc-900 rounded-lg text-center">
                            <span class="text-[9px] text-gray-400 block font-mono">PROMEDIO DECIMAL</span>
                            <span class="text-lg font-black text-emerald-400 font-mono"><%= resultado.getPromedio()%></span>
                        </div>
                    </div>

                    <div>
                        <h4 class="text-[11px] font-bold text-gray-400 uppercase tracking-widest font-mono mb-4">
                            CARTAS REPARTIDAS EN LA MANO
                        </h4>

                        <div class="max-h-[220px] overflow-y-auto pr-2 casino-scroll grid grid-cols-2 sm:grid-cols-3 gap-3">
                            <%
                                List<String> frac = resultado.getTerminosFraccionales();
                                List<Double> dec = resultado.getTerminosDecimales();
                                for (int i = 0; i < frac.size(); i++) {
                            %>
                            <div class="card-poker p-3.5 rounded-xl flex flex-col justify-between items-center text-center">
                                <div class="w-full flex justify-between items-center text-[9px] text-zinc-500 font-mono">
                                    <span>N° <%= i + 1%></span>
                                    <span class="text-[var(--rojo-poker)]">♣</span>
                                </div>
                                <div class="my-2">
                                    <span class="text-xl font-extrabold tracking-tight text-white font-mono">
                                        <%= frac.get(i)%>
                                    </span>
                                </div>
                                <div class="text-[10px] font-mono text-zinc-400 border-t border-zinc-900/80 w-full pt-1.5 mt-1.5">
                                    ≈ <%= dec.get(i)%>
                                </div>
                            </div>
                            <% } %>
                        </div>
                    </div>

                </div>
                <% }%>
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

                        <!-- Tarjeta 1: Modelo - generarYSumarSerie -->
                        <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                            <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-[var(--dorado)] overflow-x-auto border-l-2 border-[var(--dorado)]">
                                <pre><code>private void generarYSumarSerie() {
    int numerador = 2;
    int denominador = 5;

    for (int i = 1; i <= this.nTerminos; i++) {
        this.terminosFraccionales.add(numerador + "/" + denominador);
        double valorDecimal = (double) numerador / denominador;
        this.terminosDecimales.add(Math.round(valorDecimal * 10000.0) / 10000.0);
        this.sumaTotal += valorDecimal;
        
        numerador += 3;
        denominador += 4;
    }
}</code></pre>
                            </div>
                            <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                <span class="text-[10px] text-[var(--dorado)] tracking-wider mb-1 uppercase font-bold">🧮 MODELO // NEGOCIO</span>
                                <h5 class="text-white font-bold mb-2 text-sm">Método: generarYSumarSerie()</h5>
                                <p class="text-gray-400 leading-relaxed">
                                    Método con la <span class="text-[var(--dorado)]">única función</span> de iterar la serie fraccionaria (numerador +3, denominador +4), formatear el texto de cada fracción, convertirlas a decimales redondeados y acumular la suma total.
                                </p>
                            </div>
                        </div>

                        <!-- Tarjeta 2: Modelo - getPromedio -->
                        <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                            <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-[var(--dorado)] overflow-x-auto border-l-2 border-[var(--dorado)]">
                                <pre><code>public double getPromedio() {
    if (nTerminos == 0) return 0.0;
    return Math.round((sumaTotal / nTerminos) * 10000.0) / 10000.0;
}</code></pre>
                            </div>
                            <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                <span class="text-[10px] text-[var(--dorado)] tracking-wider mb-1 uppercase font-bold">🧮 MODELO // NEGOCIO</span>
                                <h5 class="text-white font-bold mb-2 text-sm">Método: getPromedio()</h5>
                                <p class="text-gray-400 leading-relaxed">
                                    Encargado <span class="text-[var(--dorado)]">únicamente</span> de calcular el valor promedio numérico de los términos generados y redondear el resultado final a cuatro decimales de precisión.
                                </p>
                            </div>
                        </div>

                        <!-- Tarjeta 3: Controlador - doPost (Validación e Inyección) -->
                        <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                            <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-sky-400 overflow-x-auto border-l-2 border-sky-500">
                                <pre><code>int nTerminos = Integer.parseInt(terminosStr);

S5E2Model simulador = 
    new S5E2Model(nTerminos);

request.setAttribute("resultado", 
    simulador);</code></pre>
                            </div>
                            <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                <span class="text-[10px] text-sky-400 tracking-wider mb-1 uppercase font-bold">🧬 CONTROLADOR // SERVLET</span>
                                <h5 class="text-white font-bold mb-2 text-sm">Procesamiento e Inyección</h5>
                                <p class="text-gray-400 leading-relaxed">
                                    Encargado <span class="text-[var(--dorado)]">únicamente</span> de validar que el número de términos esté entre 1 y 60, instanciar la lógica del modelo e inyectar el objeto resultante en la petición HTTP para la vista.
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
        <footer class="max-w-5xl w-full mx-auto text-center border-t border-zinc-900 pt-4 mt-6">
            <p class="text-[10px] text-gray-500 font-mono tracking-widest uppercase">
                S5E2 - SISTEMA CONVERGENTE DE CÁLCULO ITERATIVO • CASINO PREMIUM
            </p>
        </footer>

    </body>
</html>