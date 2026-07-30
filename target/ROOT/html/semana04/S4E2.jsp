<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>S4E2 - Mesa de Horas Extras</title>
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
        details summary::-webkit-details-marker {
            display: none;
        }
    </style>
</head>
<body class="min-h-screen flex items-center justify-center p-4 md:p-8">

    <div class="w-full max-w-2xl bg-[#0d0d0d]/90 border border-zinc-900 rounded-2xl shadow-2xl overflow-hidden backdrop-blur-md">
        
        <!-- Encabezado de la Vista -->
        <div class="p-6 border-b border-zinc-900 bg-gradient-to-r from-zinc-950 via-[#121212] to-zinc-950 flex justify-between items-center">
            <div>
                <div class="flex items-center space-x-2">
                    <span class="text-[var(--rojo-poker)] text-lg">♥</span>
                    <span class="text-[10px] text-gray-400 font-mono tracking-widest uppercase">Mesa S4 - Proyecto 02</span>
                </div>
                <h1 class="text-2xl font-black text-[var(--dorado)] tracking-wide uppercase font-mono">🎰 Crupier de Planillas</h1>
            </div>
            <a href="${pageContext.request.contextPath}/" 
               class="text-xs text-gray-400 hover:text-white font-mono bg-[#141414] px-4 py-2 rounded-lg border border-zinc-800 hover:border-gray-500 transition-all flex items-center gap-2">
               <span>↩</span> Menú Principal
            </a>
        </div>

        <div class="p-6 md:p-8 space-y-6">
            
            <!-- Formulario de Entrada -->
            <form action="${pageContext.request.contextPath}/S4E2Controller" method="post" class="space-y-5">
                
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div>
                        <label class="block text-xs text-gray-400 font-mono uppercase tracking-widest mb-2">
                            ⏱ Horas Trabajadas
                        </label>
                        <input type="number" name="horasTrabajadas" min="0" required 
                               value="${horasTrabajadas != null ? horasTrabajadas : '40'}"
                               class="w-full bg-zinc-950 border border-zinc-800 focus:border-[var(--dorado)] text-white rounded-xl p-3 text-sm outline-none font-mono transition-all">
                    </div>
                    <div>
                        <label class="block text-xs text-gray-400 font-mono uppercase tracking-widest mb-2">
                            💵 Tarifa por Hora Normal (S/.)
                        </label>
                        <input type="number" step="0.01" name="tarifaHora" min="0.01" required 
                               value="${tarifaHora != null ? tarifaHora : '15.00'}"
                               class="w-full bg-zinc-950 border border-zinc-800 focus:border-[var(--dorado)] text-white rounded-xl p-3 text-sm outline-none font-mono transition-all">
                    </div>
                </div>

                <button type="submit" 
                        class="w-full py-4 bg-gradient-to-r from-amber-950/30 to-amber-900/40 hover:from-[var(--dorado)] hover:to-[var(--dorado-apagado)] hover:text-black border border-[var(--dorado-apagado)] rounded-xl text-xs font-mono font-black tracking-widest uppercase transition-all duration-300 shadow-lg">
                    🃏 Liquidar Horas Extras
                </button>
            </form>

            <%-- Mensaje de Error --%>
            <% if (request.getAttribute("error") != null) { %>
                <div class="p-4 bg-red-950/20 border border-[var(--rojo-poker)]/40 text-[var(--rojo-poker)] text-xs rounded-xl font-mono text-center">
                    ⚠️ <%= request.getAttribute("error") %>
                </div>
            <% } %>

            <%-- Result Box --%>
            <% if (request.getAttribute("calculado") != null) { %>
                <div class="border-t border-zinc-900 pt-6 space-y-4">
                    <div class="flex items-center space-x-2">
                        <span class="text-[var(--dorado)]">♠</span>
                        <h3 class="text-xs text-gray-400 font-mono tracking-widest uppercase">Boleta Detallada del Trabajador</h3>
                    </div>
                    
                    <div class="bg-zinc-950/80 border border-zinc-900 rounded-xl p-5 font-mono text-xs space-y-4">
                        
                        <div class="flex justify-between border-b border-zinc-900 pb-2">
                            <span class="text-gray-400">Tarifa Base del Contrato:</span>
                            <span class="text-white font-bold">S/. ${String.format("%.2f", tarifaHora)} / hora</span>
                        </div>

                        <div class="grid grid-cols-2 gap-y-2 text-gray-300">
                            <div>Horas Ordinarias Realizadas (Máx. 40):</div>
                            <div class="text-right">${horasNormales} hrs</div>

                            <div class="text-gray-400 border-b border-zinc-900/40 pb-2">Pago Ordinario:</div>
                            <div class="text-right text-white font-semibold border-b border-zinc-900/40 pb-2">S/. ${String.format("%.2f", pagoNormal)}</div>
                        </div>

                        <div class="pt-2">
                            <span class="text-[10px] text-[var(--dorado)] uppercase tracking-wider block mb-2">✦ Desglose de Horas Extras (Excedente de 40 hrs):</span>
                            
                            <div class="space-y-2 pl-3 border-l-2 border-zinc-800">
                                <div class="flex justify-between text-gray-400">
                                    <span>Horas Dobles Calculadas (0 - 8 hrs):</span>
                                    <span class="text-white">${horasDobles} hrs (S/. ${String.format("%.2f", pagoDobles)})</span>
                                </div>
                                <div class="flex justify-between text-gray-400">
                                    <span>Horas Triples Calculadas (> 8 hrs):</span>
                                    <span class="text-white">${horasTriples} hrs (S/. ${String.format("%.2f", pagoTriples)})</span>
                                </div>
                                <div class="flex justify-between font-bold text-amber-500 pt-1 border-t border-zinc-900/60">
                                    <span>Total Extra Liquidado:</span>
                                    <span>S/. ${String.format("%.2f", totalExtras)}</span>
                                </div>
                            </div>
                        </div>

                        <div class="flex justify-between items-center text-xl font-black text-[var(--dorado)] border-t border-dashed border-zinc-800 pt-4">
                            <span>SALARIO TOTAL NETO:</span>
                            <span>S/. ${String.format("%.2f", salarioTotal)}</span>
                        </div>
                    </div>
                </div>
            <% } %>

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

                <!-- Tarjeta 1: Controlador - extraerParametros -->
                <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                    <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-emerald-400 overflow-x-auto border-l-2 border-emerald-500">
                        <pre><code>private S4E2Model extraerParametros(
    HttpServletRequest request
) {
    int h = Integer.parseInt(
        request.getParameter("horasTrabajadas")
    );
    double t = Double.parseDouble(
        request.getParameter("tarifaHora")
    );
    return new S4E2Model(h, t);
}</code></pre>
                    </div>
                    <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                        <span class="text-[10px] text-emerald-400 tracking-wider mb-1 uppercase font-bold">🛠️ CONTROLADOR // SERVLET</span>
                        <h5 class="text-white font-bold mb-2 text-sm">Método: extraerParametros()</h5>
                        <p class="text-gray-400 leading-relaxed">
                            Este método tiene la <span class="text-[var(--dorado)]">única responsabilidad</span> de capturar las horas trabajadas y la tarifa enviadas por el usuario, convertirlas a sus tipos numéricos correspondientes y empaquetarlas en el Modelo.
                        </p>
                    </div>
                </div>

                <!-- Tarjeta 2: Modelo - getHorasDobles -->
                <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                    <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-[var(--dorado)] overflow-x-auto border-l-2 border-[var(--dorado)]">
                        <pre><code>public int getHorasDobles() {
    int extras = getHorasExtrasTotales();
    return Math.min(extras, 8);
}</code></pre>
                    </div>
                    <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                        <span class="text-[10px] text-[var(--dorado)] tracking-wider mb-1 uppercase font-bold">🧮 MODELO // NEGOCIO</span>
                        <h5 class="text-white font-bold mb-2 text-sm">Método: getHorasDobles()</h5>
                        <p class="text-gray-400 leading-relaxed">
                            Método con la <span class="text-[var(--dorado)]">única función</span> de evaluar las horas extras acumuladas y toparlas a un máximo de 8 horas para el primer tramo abonado al 200%.
                        </p>
                    </div>
                </div>

                <!-- Tarjeta 3: Modelo - getHorasTriples -->
                <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                    <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-[var(--dorado)] overflow-x-auto border-l-2 border-[var(--dorado)]">
                        <pre><code>public int getHorasTriples() {
    int extras = getHorasExtrasTotales();
    return Math.max(0, extras - 8);
}</code></pre>
                    </div>
                    <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                        <span class="text-[10px] text-[var(--dorado)] tracking-wider mb-1 uppercase font-bold">🧮 MODELO // NEGOCIO</span>
                        <h5 class="text-white font-bold mb-2 text-sm">Método: getHorasTriples()</h5>
                        <p class="text-gray-400 leading-relaxed">
                            Encargado <span class="text-[var(--dorado)]">únicamente</span> de calcular el excedente a partir de la novena hora extra en adelante para liquidarlas a tarifa triple (300%).
                        </p>
                    </div>
                </div>

                <!-- Tarjeta 4: Controlador - inyectarResultados -->
                <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                    <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-sky-400 overflow-x-auto border-l-2 border-sky-500">
                        <pre><code>private void inyectarResultados(
    HttpServletRequest request, 
    S4E2Model modelo
) {
    request.setAttribute("pagoNormal", 
        modelo.calcularPagoNormal());
    request.setAttribute("pagoDobles", 
        modelo.calcularPagoDobles());
    request.setAttribute("pagoTriples", 
        modelo.calcularPagoTriples());
    request.setAttribute("salarioTotal", 
        modelo.calcularSalarioTotal());
}</code></pre>
                    </div>
                    <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                        <span class="text-[10px] text-sky-400 tracking-wider mb-1 uppercase font-bold">🧬 CONTROLADOR // SERVLET</span>
                        <h5 class="text-white font-bold mb-2 text-sm">Método: inyectarResultados()</h5>
                        <p class="text-gray-400 leading-relaxed">
                            Encargado <span class="text-[var(--dorado)]">únicamente</span> de adjuntar todos los desgloses calculados por el modelo en el objeto de petición HTTP para que el JSP pueda renderizar la boleta.
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

        </div>
    </div>

</body>
</html>