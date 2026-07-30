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
            .border-gold {
                border-color: var(--dorado);
            }
            .text-gold {
                color: var(--dorado);
            }
            .bg-gold-hover:hover {
                background-color: var(--dorado-apagado);
            }
            .text-poker {
                color: var(--rojo-poker);
            }
        </style>
    </head>
    <body class="min-h-screen flex flex-col justify-between p-4 md:p-8">

        <header class="max-w-4xl mx-auto w-full text-center my-6">
            <h1 class="text-4xl font-extrabold tracking-wider text-gold uppercase border-b-2 border-gold pb-4 inline-block">
                ♠ VIP VAULT - CONTINUOUS COMPOUND ♣
            </h1>
            <p class="text-gray-400 mt-2 text-sm">Semana 8 - S8E2 (Crecimiento Matemático Exponencial Continuo)</p>
            <a href="${pageContext.request.contextPath}/index.jsp" 
               class="text-xs font-mono px-4 py-2 border border-zinc-800 bg-zinc-950/60 hover:border-[var(--dorado)] hover:text-[var(--dorado)] transition-all rounded">
                Volver al Deck Principal
            </a>
        </header>

        <main class="max-w-2xl mx-auto w-full bg-neutral-900 bg-opacity-80 p-8 rounded-2xl border border-neutral-800 shadow-2xl">

            <% if (request.getAttribute("error") != null) {%>
            <div class="mb-6 bg-red-950 border-l-4 border-red-500 text-red-200 p-4 rounded text-sm" role="alert">
                <p class="font-bold">Aviso de la Banca</p>
                <p><%= request.getAttribute("error")%></p>
            </div>
            <% }%>

            <form action="${pageContext.request.contextPath}/S8E2Controller" method="POST" class="grid grid-cols-1 md:grid-cols-3 gap-6">
                <div>
                    <label for="capital" class="block text-xs font-semibold uppercase tracking-wider text-gold mb-2">
                        Inversión Inicial ($):
                    </label>
                    <input type="number" step="0.01" id="capital" name="capital" 
                           placeholder="Ej: 5000.00" 
                           value="<%= request.getParameter("capital") != null ? request.getParameter("capital") : ""%>"
                           class="w-full bg-black border border-neutral-700 rounded-lg py-3 px-4 text-white text-center focus:outline-none focus:border-yellow-400 transition-colors">
                </div>

                <div>
                    <label for="tasa" class="block text-xs font-semibold uppercase tracking-wider text-gold mb-2">
                        Tasa Anual Nominal (%):
                    </label>
                    <input type="number" step="0.01" id="tasa" name="tasa" 
                           placeholder="Ej: 12.5" 
                           value="<%= request.getParameter("tasa") != null ? request.getParameter("tasa") : ""%>"
                           class="w-full bg-black border border-neutral-700 rounded-lg py-3 px-4 text-white text-center focus:outline-none focus:border-yellow-400 transition-colors">
                </div>

                <div>
                    <label for="tiempo" class="block text-xs font-semibold uppercase tracking-wider text-gold mb-2">
                        Tiempo de Plazo (Años):
                    </label>
                    <input type="number" step="0.1" id="tiempo" name="tiempo" 
                           placeholder="Ej: 5" 
                           value="<%= request.getParameter("tiempo") != null ? request.getParameter("tiempo") : ""%>"
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
                        <span class="text-xl font-bold text-green-400 font-mono">$<%= String.format("%.2f", proy.calcularMontoAcumulado())%></span>
                    </div>
                    <div class="bg-black p-4 rounded-lg border border-neutral-800">
                        <span class="text-[10px] text-neutral-500 block uppercase">Ganancia Neta Generada:</span>
                        <span class="text-xl font-bold text-gold font-mono">$<%= String.format("%.2f", proy.calcularGananciaNeta())%></span>
                    </div>
                </div>
            </div>
            <% }%>

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

                        <!-- Tarjeta 1: Modelo - calcularMontoAcumulado -->
                        <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                            <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-[var(--dorado)] overflow-x-auto border-l-2 border-[var(--dorado)]">
                                <pre><code>public double calcularMontoAcumulado() {
    return this.capitalInicial * 
        Math.exp(this.tasaInteres * this.tiempoAnios);
}</code></pre>
                            </div>
                            <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                <span class="text-[10px] text-[var(--dorado)] tracking-wider mb-1 uppercase font-bold">🧮 MODELO // NEGOCIO</span>
                                <h5 class="text-white font-bold mb-2 text-sm">Método: calcularMontoAcumulado()</h5>
                                <p class="text-gray-400 leading-relaxed">
                                    Tiene la <span class="text-[var(--dorado)]">única función</span> de evaluar la fórmula de interés compuesto continuo ($A = P \cdot e^{r \cdot t}$) apoyándose en la función exponencial nativa <code class="text-[var(--dorado)]">Math.exp()</code>.
                                </p>
                            </div>
                        </div>

                        <!-- Tarjeta 2: Modelo - calcularGananciaNeta -->
                        <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                            <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-[var(--dorado)] overflow-x-auto border-l-2 border-[var(--dorado)]">
                                <pre><code>public double calcularGananciaNeta() {
    return calcularMontoAcumulado() - 
        this.capitalInicial;
}</code></pre>
                            </div>
                            <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                <span class="text-[10px] text-[var(--dorado)] tracking-wider mb-1 uppercase font-bold">🧮 MODELO // NEGOCIO</span>
                                <h5 class="text-white font-bold mb-2 text-sm">Método: calcularGananciaNeta()</h5>
                                <p class="text-gray-400 leading-relaxed">
                                    Método con la <span class="text-[var(--dorado)]">única función</span> de restar el capital invertido inicialmente al monto total acumulado para determinar el rendimiento neto del activo financiero.
                                </p>
                            </div>
                        </div>

                        <!-- Tarjeta 3: Controlador - doPost (Validación y Proceso) -->
                        <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                            <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-sky-400 overflow-x-auto border-l-2 border-sky-500">
                                <pre><code>double capital = Double.parseDouble(capitalStr);
double tasa = Double.parseDouble(tasaStr);
double tiempo = Double.parseDouble(tiempoStr);

if (capital > 0 && tasa > 0 && tiempo > 0) {
    S8E2Model proyeccion = 
        new S8E2Model(capital, tasa, tiempo);
    request.setAttribute("proyeccion", proyeccion);
    request.setAttribute("exito", true);
}</code></pre>
                            </div>
                            <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                <span class="text-[10px] text-sky-400 tracking-wider mb-1 uppercase font-bold">🧬 CONTROLADOR // SERVLET</span>
                                <h5 class="text-white font-bold mb-2 text-sm">Captura e Inyección Financiera</h5>
                                <p class="text-gray-400 leading-relaxed">
                                    Encargado <span class="text-[var(--dorado)]">únicamente</span> de receptar el capital, tasa de interés anual y horizonte temporal, verificar la validez de los rangos numéricos y transferir el objeto de proyección a la vista JSP.
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
        <footer class="text-center py-6 text-xs text-neutral-600">
            &copy; 2026 Casino Deck Software Architecture. Proyecciones Matemáticas Seguras.
        </footer>

    </body>
</html>