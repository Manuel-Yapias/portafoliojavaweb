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

    <div class="w-full max-w-2xl bg-[#0d0d0d]/90 border border-zinc-900 rounded-2xl shadow-2xl overflow-hidden backdrop-blur-md">
        
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
            <form action="${pageContext.request.contextPath}/S4E1Controller" method="post" class="space-y-5">
                
                <div>
                    <label class="block text-xs text-gray-400 font-mono uppercase tracking-widest mb-2">
                        🎰 Seleccionar Clase de Auto
                    </label>
                    <div class="relative">
                        <select name="tipoAuto" 
                                class="w-full bg-zinc-950 border border-zinc-800 focus:border-[var(--dorado)] text-white rounded-xl p-3 text-sm outline-none font-mono transition-all appearance-none cursor-pointer">
                            <option value="Pequeño" ${tipoAuto == 'Pequeño' ? 'selected' : ''}>Pequeño (S/. 15.00 por día + S/. 0.20 por km)</option>
                            <option value="Mediano" ${tipoAuto == 'Mediano' ? 'selected' : ''}>Mediano (S/. 20.00 por día + S/. 0.30 por km)</option>
                            <option value="Grande" ${tipoAuto == 'Grande' ? 'selected' : ''}>Grande (S/. 30.00 por día + S/. 0.40 por km)</option>
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
                            🛣 Kilómetros Recorridos
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

            <%-- Mensaje de Error --%>
            <% if (request.getAttribute("error") != null) { %>
                <div class="p-4 bg-red-950/20 border border-[var(--rojo-poker)]/40 text-[var(--rojo-poker)] text-xs rounded-xl font-mono text-center">
                    ⚠️ <%= request.getAttribute("error") %>
                </div>
            <% } %>

            <% if (request.getAttribute("calculado") != null) { %>
                <div class="border-t border-zinc-900 pt-6 space-y-4">
                    <div class="flex items-center space-x-2">
                        <span class="text-[var(--dorado)]">♣</span>
                        <h3 class="text-xs text-gray-400 font-mono tracking-widest uppercase">Resumen de Liquidación</h3>
                    </div>
                    
                    <div class="bg-zinc-950/80 border border-zinc-900 rounded-xl p-5 font-mono text-xs space-y-3">
                        
                        <div class="flex justify-between border-b border-zinc-900 pb-2">
                            <span class="text-gray-400">Tipo de Vehículo:</span>
                            <span class="text-white font-bold">${tipoAuto}</span>
                        </div>

                        <div class="grid grid-cols-2 gap-y-2 text-gray-300">
                            <div>Tarifa fija diaria:</div>
                            <div class="text-right">S/. ${String.format("%.2f", tarifaDia)}</div>

                            <div>Tarifa por kilómetro:</div>
                            <div class="text-right">S/. ${String.format("%.2f", tarifaKm)}</div>

                            <div class="border-t border-zinc-900/60 pt-2 text-gray-400">Costo por Días (${dias} d):</div>
                            <div class="border-t border-zinc-900/60 pt-2 text-right text-white">S/. ${String.format("%.2f", costoDias)}</div>

                            <div class="text-gray-400">Costo por Km (${km} km):</div>
                            <div class="text-right text-white">S/. ${String.format("%.2f", costoKm)}</div>
                        </div>

                        <div class="flex justify-between border-t border-zinc-900 pt-2 text-gray-300 font-bold">
                            <span>Importe de Compra (Base):</span>
                            <span>S/. ${String.format("%.2f", subtotal)}</span>
                        </div>

                        <div class="flex justify-between items-center p-2.5 rounded bg-zinc-900/30 border border-zinc-800">
                            <div>
                                <span class="text-gray-400 block text-[10px]">RECARGO POR SUPERAR LÍMITE</span>
                                <span class="text-[11px] text-amber-500">¿Promedio > 10 km/día? ${superaLimite ? "SÍ (Aumento 2.5%)" : "NO"}</span>
                            </div>
                            <span class="text-right text-amber-500 font-bold">
                                S/. ${String.format("%.2f", recargo)}
                            </span>
                        </div>

                        <div class="flex justify-between items-center text-lg font-black text-[var(--dorado)] border-t border-dashed border-zinc-800 pt-3">
                            <span>TOTAL A PAGAR:</span>
                            <span>S/. ${String.format("%.2f", totalPagar)}</span>
                        </div>
                    </div>
                </div>
            <% } %>
        </div>
    </div>

</body>
</html>