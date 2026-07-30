<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>S4E1 - Crupier Renta Car</title>
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

    <%-- El contenedor se ajusta automáticamente: max-w-2xl si no hay calculo, max-w-5xl cuando se muestran resultados --%>
    <div class="w-full ${requestScope.calculado != null ? 'max-w-5xl' : 'max-w-2xl'} bg-[#0d0d0d]/90 border border-zinc-900 rounded-2xl shadow-2xl overflow-hidden backdrop-blur-md transition-all duration-500">
        
        <!-- Header -->
        <div class="p-6 border-b border-zinc-900 bg-gradient-to-r from-zinc-950 via-[#121212] to-zinc-950 flex justify-between items-center">
            <div>
                <div class="flex items-center space-x-2">
                    <span class="text-[var(--rojo-poker)] text-lg">♦</span>
                    <span class="text-[10px] text-gray-400 font-mono tracking-widest uppercase">Mesa S4 - Proyecto 01</span>
                </div>
                <h1 class="text-2xl font-black text-[var(--dorado)] tracking-wide uppercase font-mono">🚗 Renta Car</h1>
            </div>
            <a href="${pageContext.request.contextPath}/" 
               class="text-xs text-gray-400 hover:text-white font-mono bg-[#141414] px-4 py-2 rounded-lg border border-zinc-800 hover:border-gray-500 transition-all flex items-center gap-2">
                <span>↩</span> Menú Principal
            </a>
        </div>

        <div class="p-6 md:p-8 space-y-6">
            
            <%-- Mensaje de Error --%>
            <% if (request.getAttribute("error") != null) { %>
                <div class="p-4 bg-red-950/20 border border-[var(--rojo-poker)]/40 text-[var(--rojo-poker)] text-xs rounded-xl font-mono text-center">
                    ⚠️ <%= request.getAttribute("error") %>
                </div>
            <% } %>

            <!-- Layout principal: 2 columnas si hay cálculo, 1 columna si no lo hay -->
            <div class="grid grid-cols-1 ${requestScope.calculado != null ? 'lg:grid-cols-12' : ''} gap-8 items-start">
                
                <!-- COLUMNA IZQUIERDA: Formulario -->
                <div class="${requestScope.calculado != null ? 'lg:col-span-6' : 'w-full'} space-y-5">
                    <form action="${pageContext.request.contextPath}/S4E1Controller" method="post" class="space-y-5">
                        
                        <div>
                            <label class="block text-xs text-gray-400 font-mono uppercase tracking-widest mb-2">
                                🎰 Seleccionar Clase de Auto
                            </label>
                            <div class="relative">
                                <select name="tipoAuto" 
                                        class="w-full bg-zinc-950 border border-zinc-800 focus:border-[var(--dorado)] text-white rounded-xl p-3 text-sm outline-none font-mono transition-all appearance-none cursor-pointer">
                                    <option value="Pequeño" ${tipoAuto == 'Pequeño' ? 'selected' : ''}>Pequeño (S/. 15.00/día + S/. 0.20/km)</option>
                                    <option value="Mediano" ${tipoAuto == 'Mediano' ? 'selected' : ''}>Mediano (S/. 20.00/día + S/. 0.30/km)</option>
                                    <option value="Grande" ${tipoAuto == 'Grande' ? 'selected' : ''}>Grande (S/. 30.00/día + S/. 0.40/km)</option>
                                </select>
                                <div class="absolute inset-y-0 right-3 flex items-center pointer-events-none text-[var(--dorado)] text-xs">
                                    ▼
                                </div>
                            </div>
                        </div>

                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div>
                                <label class="block text-xs text-gray-400 font-mono uppercase tracking-widest mb-2">
                                    ⏱ Días de Alquiler
                                </label>
                                <input type="number" name="dias" min="1" required 
                                       value="${dias != null ? dias : '1'}"
                                       class="w-full bg-zinc-950 border border-zinc-800 focus:border-[var(--dorado)] text-white rounded-xl p-3 text-sm outline-none font-mono transition-all">
                            </div>
                            <div>
                                <label class="block text-xs text-gray-400 font-mono uppercase tracking-widest mb-2">
                                    🛣 Km Recorridos
                                </label>
                                <input type="number" step="0.01" name="km" min="0" required 
                                       value="${km != null ? km : '0'}"
                                       class="w-full bg-zinc-950 border border-zinc-800 focus:border-[var(--dorado)] text-white rounded-xl p-3 text-sm outline-none font-mono transition-all">
                            </div>
                        </div>

                        <button type="submit" 
                                class="w-full py-4 bg-gradient-to-r from-amber-950/30 to-amber-900/40 hover:from-[var(--dorado)] hover:to-[var(--dorado-apagado)] hover:text-black border border-[var(--dorado-apagado)] rounded-xl text-xs font-mono font-black tracking-widest uppercase transition-all duration-300 shadow-lg">
                            🎰 Calcular Liquidación de Renta
                        </button>
                    </form>
                </div>

                <!-- COLUMNA DERECHA: Resumen de Resultados (Lado a lado en pantallas medianas/grandes) -->
                <% if (request.getAttribute("calculado") != null) { %>
                    <div class="lg:col-span-6 bg-zinc-950/90 border border-zinc-800/80 rounded-xl p-5 font-mono text-xs space-y-4 shadow-xl self-stretch flex flex-col justify-between animate-fade-in">
                        
                        <div class="space-y-3">
                            <div class="flex items-center justify-between border-b border-zinc-800 pb-3">
                                <div class="flex items-center space-x-2">
                                    <span class="text-[var(--dorado)]">♣</span>
                                    <h3 class="text-xs text-gray-300 font-mono tracking-widest uppercase font-bold">Resumen de Liquidación</h3>
                                </div>
                                <span class="text-[10px] text-zinc-500 font-mono">TICKET #S4E1</span>
                            </div>

                            <div class="flex justify-between items-center bg-zinc-900/50 p-2.5 rounded-lg border border-zinc-800/50">
                                <span class="text-gray-400">Tipo de Vehículo:</span>
                                <span class="text-[var(--dorado)] font-bold text-sm uppercase">${tipoAuto}</span>
                            </div>

                            <div class="space-y-2 text-gray-300 pt-1">
                                <div class="flex justify-between text-zinc-400 text-[11px]">
                                    <span>Tarifa fija diaria:</span>
                                    <span>S/. ${String.format("%.2f", tarifaDia)}</span>
                                </div>
                                <div class="flex justify-between text-zinc-400 text-[11px]">
                                    <span>Tarifa por kilómetro:</span>
                                    <span>S/. ${String.format("%.2f", tarifaKm)}</span>
                                </div>
                                
                                <div class="border-t border-zinc-900 my-1"></div>

                                <div class="flex justify-between">
                                    <span class="text-gray-400">Costo por Días (${dias} d):</span>
                                    <span class="text-white">S/. ${String.format("%.2f", costoDias)}</span>
                                </div>

                                <div class="flex justify-between">
                                    <span class="text-gray-400">Costo por Km (${km} km):</span>
                                    <span class="text-white">S/. ${String.format("%.2f", costoKm)}</span>
                                </div>

                                <div class="flex justify-between border-t border-zinc-900 pt-2 font-bold">
                                    <span class="text-gray-300">Importe Base:</span>
                                    <span class="text-white">S/. ${String.format("%.2f", subtotal)}</span>
                                </div>
                            </div>

                            <div class="p-3 rounded-lg bg-zinc-900/80 border border-zinc-800/80 flex justify-between items-center">
                                <div>
                                    <span class="text-gray-400 block text-[9px] uppercase tracking-wider">RECARGO POR LÍMITE (10 km/día)</span>
                                    <span class="text-[11px] ${superaLimite ? 'text-amber-400' : 'text-zinc-500'}">
                                        ${superaLimite ? "⚠️ Exceso detectado (+2.5%)" : "✓ Dentro del límite (0%)"}
                                    </span>
                                </div>
                                <span class="text-right text-amber-500 font-bold text-xs">
                                    S/. ${String.format("%.2f", recargo)}
                                </span>
                            </div>
                        </div>

                        <!-- Total a Pagar destacado al final de la tarjeta -->
                        <div class="bg-gradient-to-r from-amber-950/40 to-zinc-900 p-3.5 rounded-lg border border-[var(--dorado-apagado)]/40 flex justify-between items-center mt-4">
                            <span class="text-xs font-bold text-gray-200">TOTAL A PAGAR:</span>
                            <span class="text-xl font-black text-[var(--dorado)]">S/. ${String.format("%.2f", totalPagar)}</span>
                        </div>
                    </div>
                <% } %>

            </div>

            <!-- MANUAL DE USO (Permanece en la parte inferior abarcando todo el ancho) -->
            <div class="border-t border-zinc-900 pt-6">
                <details class="group bg-[#111] rounded-lg border border-[#222] transition-all duration-300 open:border-[var(--dorado)]">
                    <summary class="flex justify-between items-center p-4 cursor-pointer select-none hover:bg-[#161616] transition-colors rounded-lg">
                        <span class="text-xs font-mono text-[var(--dorado)] uppercase tracking-widest flex items-center gap-2">
                            <span>📖</span> MANUAL DE USO Y EXPLICACIÓN DE MÉTODOS (S4E1 - MVC)
                        </span>
                        <span class="text-gray-400 group-open:rotate-180 transition-transform duration-200">▼</span>
                    </summary>
                    
                    <div class="p-4 pt-0 space-y-4">

                        <!-- Método 1: getTarifaDiaria() -->
                        <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                            <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-[var(--dorado)] overflow-x-auto border-l-2 border-[var(--dorado)]">
                                <pre><code>public double getTarifaDiaria() {
    if (tipoAuto == null) return 0.0;
    switch (tipoAuto.toLowerCase()) {
        case "pequeño": return 15.0;
        case "mediano": return 20.0;
        case "grande":  return 30.0;
        default: return 0.0;
    }
}</code></pre>
                            </div>
                            <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                <span class="text-[10px] text-[var(--dorado)] tracking-wider mb-1 uppercase font-bold">🧮 MODELO // NEGOCIO</span>
                                <h5 class="text-white font-bold mb-2 text-sm">Método: getTarifaDiaria()</h5>
                                <p class="text-gray-400 leading-relaxed">
                                    Determina la tarifa fija por día en función de la categoría del vehículo seleccionado (<span class="text-[var(--dorado)]">Pequeño: S/.15, Mediano: S/.20, Grande: S/.30</span>).
                                </p>
                            </div>
                        </div>

                        <!-- Método 2: getTarifaKilometro() -->
                        <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                            <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-[var(--dorado)] overflow-x-auto border-l-2 border-[var(--dorado)]">
                                <pre><code>public double getTarifaKilometro() {
    if (tipoAuto == null) return 0.0;
    switch (tipoAuto.toLowerCase()) {
        case "pequeño": return 0.20;
        case "mediano": return 0.30;
        case "grande":  return 0.40;
        default: return 0.0;
    }
}</code></pre>
                            </div>
                            <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                <span class="text-[10px] text-[var(--dorado)] tracking-wider mb-1 uppercase font-bold">🧮 MODELO // NEGOCIO</span>
                                <h5 class="text-white font-bold mb-2 text-sm">Método: getTarifaKilometro()</h5>
                                <p class="text-gray-400 leading-relaxed">
                                    Retorna la tarifa por kilómetro recorrido según la categoría (<span class="text-[var(--dorado)]">Pequeño: S/.0.20, Mediano: S/.0.30, Grande: S/.0.40</span>).
                                </p>
                            </div>
                        </div>

                        <!-- Método 3: calcularCostoDias() -->
                        <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                            <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-[var(--dorado)] overflow-x-auto border-l-2 border-[var(--dorado)]">
                                <pre><code>public double calcularCostoDias() {
    return getTarifaDiaria() * dias;
}</code></pre>
                            </div>
                            <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                <span class="text-[10px] text-[var(--dorado)] tracking-wider mb-1 uppercase font-bold">🧮 MODELO // NEGOCIO</span>
                                <h5 class="text-white font-bold mb-2 text-sm">Método: calcularCostoDias()</h5>
                                <p class="text-gray-400 leading-relaxed">
                                    Calcula el subtotal acumulado por la cantidad total de días de alquiler solicitados.
                                </p>
                            </div>
                        </div>

                        <!-- Método 4: calcularCostoKm() -->
                        <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                            <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-[var(--dorado)] overflow-x-auto border-l-2 border-[var(--dorado)]">
                                <pre><code>public double calcularCostoKm() {
    return getTarifaKilometro() * km;
}</code></pre>
                            </div>
                            <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                <span class="text-[10px] text-[var(--dorado)] tracking-wider mb-1 uppercase font-bold">🧮 MODELO // NEGOCIO</span>
                                <h5 class="text-white font-bold mb-2 text-sm">Método: calcularCostoKm()</h5>
                                <p class="text-gray-400 leading-relaxed">
                                    Obtiene el subtotal derivado de la distancia total recorrida en kilómetros.
                                </p>
                            </div>
                        </div>

                        <!-- Método 5: calcularImporteBase() -->
                        <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                            <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-[var(--dorado)] overflow-x-auto border-l-2 border-[var(--dorado)]">
                                <pre><code>public double calcularImporteBase() {
    return calcularCostoDias() 
            + calcularCostoKm();
}</code></pre>
                            </div>
                            <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                <span class="text-[10px] text-[var(--dorado)] tracking-wider mb-1 uppercase font-bold">🧮 MODELO // NEGOCIO</span>
                                <h5 class="text-white font-bold mb-2 text-sm">Método: calcularImporteBase()</h5>
                                <p class="text-gray-400 leading-relaxed">
                                    Suma el costo total por días más el costo por kilómetros recorridos para formar el valor base del servicio.
                                </p>
                            </div>
                        </div>

                        <!-- Método 6: superaLimiteKmDiario() -->
                        <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                            <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-[var(--dorado)] overflow-x-auto border-l-2 border-[var(--dorado)]">
                                <pre><code>public boolean superaLimiteKmDiario() {
    if (dias <= 0) return false;
    return (km / dias) > 10.0;
}</code></pre>
                            </div>
                            <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                <span class="text-[10px] text-[var(--dorado)] tracking-wider mb-1 uppercase font-bold">🧮 MODELO // NEGOCIO</span>
                                <h5 class="text-white font-bold mb-2 text-sm">Método: superaLimiteKmDiario()</h5>
                                <p class="text-gray-400 leading-relaxed">
                                    Evalúa si el promedio de kilometraje diario recorrido supera la cuota permitida de <span class="text-[var(--dorado)]">10 km/día</span>.
                                </p>
                            </div>
                        </div>

                        <!-- Método 7: calcularMontoRecargo() -->
                        <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                            <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-[var(--dorado)] overflow-x-auto border-l-2 border-[var(--dorado)]">
                                <pre><code>public double calcularMontoRecargo() {
    if (superaLimiteKmDiario()) {
        return calcularImporteBase() * 0.025;
    }
    return 0.0;
}</code></pre>
                            </div>
                            <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                <span class="text-[10px] text-[var(--dorado)] tracking-wider mb-1 uppercase font-bold">🧮 MODELO // NEGOCIO</span>
                                <h5 class="text-white font-bold mb-2 text-sm">Método: calcularMontoRecargo()</h5>
                                <p class="text-gray-400 leading-relaxed">
                                    Aplica una penalización del <span class="text-[var(--dorado)]">2.5%</span> sobre el importe base únicamente en caso de exceder el límite diario de kilometraje.
                                </p>
                            </div>
                        </div>

                        <!-- Método 8: calcularTotalPagar() -->
                        <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                            <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-[var(--dorado)] overflow-x-auto border-l-2 border-[var(--dorado)]">
                                <pre><code>public double calcularTotalPagar() {
    return calcularImporteBase() 
            + calcularMontoRecargo();
}</code></pre>
                            </div>
                            <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                <span class="text-[10px] text-[var(--dorado)] tracking-wider mb-1 uppercase font-bold">🧮 MODELO // NEGOCIO</span>
                                <h5 class="text-white font-bold mb-2 text-sm">Método: calcularTotalPagar()</h5>
                                <p class="text-gray-400 leading-relaxed">
                                    Calcula la liquidación final a cobrar sumando el importe base y los recargos adicionales correspondientes.
                                </p>
                            </div>
                        </div>

                    </div>
                </details>
            </div>

        </div>
    </div>

</body>
</html>