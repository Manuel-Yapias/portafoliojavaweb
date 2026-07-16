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
    </style>
</head>
<body class="min-h-screen flex items-center justify-center p-4 md:p-8">

    <div class="w-full max-w-2xl bg-[#0d0d0d]/90 border border-zinc-900 rounded-2xl shadow-2xl overflow-hidden backdrop-blur-md">
        
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

            <%-- Contenedor de Alerta ante errores --%>
            <% if (request.getAttribute("error") != null) { %>
                <div class="p-4 bg-red-950/20 border border-[var(--rojo-poker)]/40 text-[var(--rojo-poker)] text-xs rounded-xl font-mono text-center">
                    ⚠️ <%= request.getAttribute("error") %>
                </div>
            <% } %>

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
        </div>
    </div>

</body>
</html>