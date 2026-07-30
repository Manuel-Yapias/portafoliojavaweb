<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>S4E3 - Valet Parking Premium</title>
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
    <body class="min-h-screen flex items-center justify-center p-4 md:p-8">

        <div class="w-full max-w-2xl bg-[#0d0d0d]/90 border border-zinc-900 rounded-2xl shadow-2xl overflow-hidden backdrop-blur-md">

            <div class="p-6 border-b border-zinc-900 bg-gradient-to-r from-zinc-950 via-[#121212] to-zinc-950 flex justify-between items-center">
                <div>
                    <div class="flex items-center space-x-2">
                        <span class="text-[var(--rojo-poker)] text-lg">♠</span>
                        <span class="text-[10px] text-gray-400 font-mono tracking-widest uppercase">Mesa S4 - Proyecto 03</span>
                    </div>
                    <h1 class="text-2xl font-black text-[var(--dorado)] tracking-wide uppercase font-mono">🚙 Royal Parking</h1>
                </div>
                <a href="${pageContext.request.contextPath}/" 
                   class="text-xs text-gray-400 hover:text-white font-mono bg-[#141414] px-4 py-2 rounded-lg border border-zinc-800 hover:border-gray-500 transition-all flex items-center gap-2">
                    <span>↩</span> Menú Principal
                </a>
            </div>

            <div class="p-6 md:p-8 space-y-6">
                <form action="${pageContext.request.contextPath}/S4E3Controller" method="post" class="space-y-5">

                    <div>
                        <label class="block text-xs text-gray-400 font-mono uppercase tracking-widest mb-2">
                            📅 Día de la Semana (Tarifario Fijo)
                        </label>
                        <div class="relative">
                            <select name="diaSemana" 
                                    class="w-full bg-zinc-950 border border-zinc-800 focus:border-[var(--dorado)] text-white rounded-xl p-3 text-sm outline-none font-mono transition-all appearance-none cursor-pointer">
                                <option value="lunes-jueves" ${diaSemana == 'lunes-jueves' ? 'selected' : ''}>Lunes a Jueves — S/. 3.50 por hora/fracción</option>
                                <option value="viernes-sabado" ${diaSemana == 'viernes-sabado' ? 'selected' : ''}>Viernes a Sábado — S/. 4.50 por hora/fracción</option>
                                <option value="domingo" ${diaSemana == 'domingo' ? 'selected' : ''}>Domingo — S/. 2.50 por hora/fracción</option>
                            </select>
                            <div class="absolute inset-y-0 right-3 flex items-center pointer-events-none text-[var(--dorado)] text-xs">
                                ▼
                            </div>
                        </div>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div class="bg-zinc-950/50 p-4 border border-zinc-900 rounded-xl space-y-3">
                            <span class="text-xs text-[var(--dorado)] font-mono uppercase tracking-wider block">🔑 Hora de Entrada</span>
                            <div class="grid grid-cols-2 gap-2">
                                <div>
                                    <label class="text-[10px] text-gray-500 font-mono block mb-1">Hora (0-23)</label>
                                    <input type="number" name="horaEntrada" min="0" max="23" required 
                                           value="${horaEntrada != null ? horaEntrada : '08'}"
                                           class="w-full bg-zinc-950 border border-zinc-850 text-white rounded-lg p-2.5 text-center text-sm outline-none font-mono focus:border-[var(--dorado)]">
                                </div>
                                <div>
                                    <label class="text-[10px] text-gray-500 font-mono block mb-1">Min (0-59)</label>
                                    <input type="number" name="minEntrada" min="0" max="59" required 
                                           value="${minEntrada != null ? minEntrada : '00'}"
                                           class="w-full bg-zinc-950 border border-zinc-850 text-white rounded-lg p-2.5 text-center text-sm outline-none font-mono focus:border-[var(--dorado)]">
                                </div>
                            </div>
                        </div>

                        <div class="bg-zinc-950/50 p-4 border border-zinc-900 rounded-xl space-y-3">
                            <span class="text-xs text-[var(--rojo-poker)] font-mono uppercase tracking-wider block">🚗 Hora de Salida</span>
                            <div class="grid grid-cols-2 gap-2">
                                <div>
                                    <label class="text-[10px] text-gray-500 font-mono block mb-1">Hora (0-23)</label>
                                    <input type="number" name="horaSalida" min="0" max="23" required 
                                           value="${horaSalida != null ? horaSalida : '10'}"
                                           class="w-full bg-zinc-950 border border-zinc-850 text-white rounded-lg p-2.5 text-center text-sm outline-none font-mono focus:border-[var(--dorado)]">
                                </div>
                                <div>
                                    <label class="text-[10px] text-gray-500 font-mono block mb-1">Min (0-59)</label>
                                    <input type="number" name="minSalida" min="0" max="59" required 
                                           value="${minSalida != null ? minSalida : '15'}"
                                           class="w-full bg-zinc-950 border border-zinc-850 text-white rounded-lg p-2.5 text-center text-sm outline-none font-mono focus:border-[var(--dorado)]">
                                </div>
                            </div>
                        </div>
                    </div>

                    <button type="submit" 
                            class="w-full py-4 bg-gradient-to-r from-amber-950/30 to-amber-900/40 hover:from-[var(--dorado)] hover:to-[var(--dorado-apagado)] hover:text-black border border-[var(--dorado-apagado)] rounded-xl text-xs font-mono font-black tracking-widest uppercase transition-all duration-300 shadow-lg">
                        🃏 Calcular Ticket de Pago
                    </button>
                </form>

                <%-- Mensajes de Error --%>
                <% if (request.getAttribute("error") != null) {%>
                <div class="p-4 bg-red-950/20 border border-[var(--rojo-poker)]/40 text-[var(--rojo-poker)] text-xs rounded-xl font-mono text-center">
                    ⚠️ <%= request.getAttribute("error")%>
                </div>
                <% } %>

                <% if (request.getAttribute("calculado") != null) { %>
                <div class="border-t border-zinc-900 pt-6 space-y-4">
                    <div class="flex items-center space-x-2">
                        <span class="text-[var(--dorado)]">♣</span>
                        <h3 class="text-xs text-gray-400 font-mono tracking-widest uppercase">Detalle de Estancia</h3>
                    </div>

                    <div class="bg-zinc-950/80 border border-zinc-900 rounded-xl p-5 font-mono text-xs space-y-3">

                        <div class="flex justify-between border-b border-zinc-900 pb-2 text-gray-400">
                            <span>Horario Marcado:</span>
                            <span class="text-white font-bold">
                                ${String.format("%02d:%02d", horaEntrada, minEntrada)} 
                                ➔ 
                                ${String.format("%02d:%02d", horaSalida, minSalida)}
                            </span>
                        </div>

                        <div class="grid grid-cols-2 gap-y-2 text-gray-300 border-b border-zinc-900/60 pb-3">
                            <div>Estancia efectiva:</div>
                            <div class="text-right text-white font-semibold">
                                ${horasVisuales}h y ${minutosVisuales}m (${minutosTotales} min totales)
                            </div>

                            <div>Tarifa fija aplicada:</div>
                            <div class="text-right">S/. ${String.format("%.2f", tarifaHora)} / hora</div>

                            <div class="text-gray-400">Horas facturables (fracción):</div>
                            <div class="text-right text-amber-500 font-bold">${horasFacturadas} hr(s)</div>
                        </div>

                        <div class="flex justify-between items-center text-xl font-black text-[var(--dorado)] pt-2">
                            <span>TOTAL NETO A PAGAR:</span>
                            <span>S/. ${String.format("%.2f", totalPagar)}</span>
                        </div>
                    </div>
                </div>
                <% }%>
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

                                <!-- Tarjeta 1: Modelo - getTarifaPorHora -->
                                <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                                    <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-[var(--dorado)] overflow-x-auto border-l-2 border-[var(--dorado)]">
                                        <pre><code>public double getTarifaPorHora() {
    if (diaSemana == null) return 0.0;
    switch (diaSemana.toLowerCase()) {
        case "lunes-jueves": 
            return 3.5;
        case "viernes-sabado": 
            return 4.5;
        case "domingo": 
            return 2.5;
        default: 
            return 0.0;
    }
}</code></pre>
                                    </div>
                                    <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                        <span class="text-[10px] text-[var(--dorado)] tracking-wider mb-1 uppercase font-bold">🧮 MODELO // NEGOCIO</span>
                                        <h5 class="text-white font-bold mb-2 text-sm">Método: getTarifaPorHora()</h5>
                                        <p class="text-gray-400 leading-relaxed">
                                            Método con la <span class="text-[var(--dorado)]">única función</span> de evaluar el día de la semana ingresado y devolver el precio correspondiente por hora según las reglas de negocio fijadas.
                                        </p>
                                    </div>
                                </div>

                                <!-- Tarjeta 2: Modelo - calcularMinutosTotales -->
                                <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                                    <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-[var(--dorado)] overflow-x-auto border-l-2 border-[var(--dorado)]">
                                        <pre><code>public int calcularMinutosTotales() {
    int entradaEnMin = (horaEntrada * 60) + minEntrada;
    int salidaEnMin = (horaSalida * 60) + minSalida;

    if (salidaEnMin < entradaEnMin) {
        salidaEnMin += 24 * 60;
    }
    return salidaEnMin - entradaEnMin;
}</code></pre>
                                    </div>
                                    <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                        <span class="text-[10px] text-[var(--dorado)] tracking-wider mb-1 uppercase font-bold">🧮 MODELO // NEGOCIO</span>
                                        <h5 class="text-white font-bold mb-2 text-sm">Método: calcularMinutosTotales()</h5>
                                        <p class="text-gray-400 leading-relaxed">
                                            Encargado <span class="text-[var(--dorado)]">únicamente</span> de estandarizar las horas/minutos a una sola escala temporal en minutos, considerando automáticamente el cambio de día a medianoche.
                                        </p>
                                    </div>
                                </div>

                                <!-- Tarjeta 3: Modelo - calcularHorasAFacturar -->
                                <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                                    <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-[var(--dorado)] overflow-x-auto border-l-2 border-[var(--dorado)]">
                                        <pre><code>public int calcularHorasAFacturar() {
    int minutosTotales = calcularMinutosTotales();
    if (minutosTotales == 0) return 0;
    
    int horasCompletas = minutosTotales / 60;
    int residuoMinutos = minutosTotales % 60;

    if (residuoMinutos > 0) {
        return horasCompletas + 1;
    }
    return horasCompletas;
}</code></pre>
                                    </div>
                                    <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                        <span class="text-[10px] text-[var(--dorado)] tracking-wider mb-1 uppercase font-bold">🧮 MODELO // NEGOCIO</span>
                                        <h5 class="text-white font-bold mb-2 text-sm">Método: calcularHorasAFacturar()</h5>
                                        <p class="text-gray-400 leading-relaxed">
                                            Tiene la <span class="text-[var(--dorado)]">única responsabilidad</span> de aplicar la norma comercial "hora o fracción", redondeando al entero superior en caso existan minutos remanentes.
                                        </p>
                                    </div>
                                </div>

                                <!-- Tarjeta 4: Controlador - doPost (Procesamiento) -->
                                <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                                    <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-sky-400 overflow-x-auto border-l-2 border-sky-500">
                                        <pre><code>request.setAttribute("tarifaHora", 
    model.getTarifaPorHora());
request.setAttribute("minutosTotales", 
    model.calcularMinutosTotales());
request.setAttribute("horasFacturadas", 
    model.calcularHorasAFacturar());
request.setAttribute("totalPagar", 
    model.calcularTotalPagar());</code></pre>
                                    </div>
                                    <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                        <span class="text-[10px] text-sky-400 tracking-wider mb-1 uppercase font-bold">🧬 CONTROLADOR // SERVLET</span>
                                        <h5 class="text-white font-bold mb-2 text-sm">Inyección de Resultados</h5>
                                        <p class="text-gray-400 leading-relaxed">
                                            Encargado <span class="text-[var(--dorado)]">únicamente</span> de enlazar las lecturas del modelo con la vista web, sirviendo de canal para renderizar los importes finales mediante EL.
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