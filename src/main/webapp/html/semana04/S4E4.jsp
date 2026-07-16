<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>S4E4 - Registro Académico Premium</title>
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
                    <span class="text-[10px] text-gray-400 font-mono tracking-widest uppercase">Mesa S4 - Proyecto 04</span>
                </div>
                <h1 class="text-2xl font-black text-[var(--dorado)] tracking-wide uppercase font-mono">🎓 Royal Academy</h1>
            </div>
            <a href="${pageContext.request.contextPath}/" 
               class="text-xs text-gray-400 hover:text-white font-mono bg-[#141414] px-4 py-2 rounded-lg border border-zinc-800 hover:border-gray-500 transition-all flex items-center gap-2">
                <span>↩</span> Menú Principal
            </a>
        </div>

        <div class="p-6 md:p-8 space-y-6">
            
            <form action="${pageContext.request.contextPath}/S4E4Controller" method="post" class="space-y-5">
                
                <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                    <div>
                        <label class="block text-[10px] text-gray-400 font-mono uppercase tracking-widest mb-2">
                            📝 Práctica 01 (PC1)
                        </label>
                        <input type="number" step="0.1" name="nota1" min="0" max="20" required 
                               value="${nota1 != null ? nota1 : '12.0'}"
                               class="w-full bg-zinc-950 border border-zinc-800 focus:border-[var(--dorado)] text-white rounded-xl p-3 text-center text-sm outline-none font-mono transition-all">
                    </div>
                    <div>
                        <label class="block text-[10px] text-gray-400 font-mono uppercase tracking-widest mb-2">
                            📝 Práctica 02 (PC2)
                        </label>
                        <input type="number" step="0.1" name="nota2" min="0" max="20" required 
                               value="${nota2 != null ? nota2 : '14.5'}"
                               class="w-full bg-zinc-950 border border-zinc-800 focus:border-[var(--dorado)] text-white rounded-xl p-3 text-center text-sm outline-none font-mono transition-all">
                    </div>
                    <div class="relative">
                        <label class="block text-[10px] text-[var(--dorado)] font-mono uppercase tracking-widest mb-2 flex justify-between">
                            <span>🔥 PC3 (Incentivo)</span>
                        </label>
                        <input type="number" step="0.1" name="nota3" min="0" max="20" required 
                               value="${nota3Original != null ? nota3Original : '10.0'}"
                               class="w-full bg-zinc-950 border border-amber-900/60 focus:border-[var(--dorado)] text-white rounded-xl p-3 text-center text-sm outline-none font-mono transition-all">
                    </div>
                </div>

                <div class="p-4 bg-zinc-950/40 border border-zinc-900 rounded-xl text-[10px] text-gray-400 font-mono leading-relaxed space-y-1">
                    <span class="text-[var(--dorado)] block font-bold uppercase">⚖️ Regla del Incentivo Docente:</span>
                    <p>• Si la nota de la PC3 es de 10 a más, se le añaden automáticamente 2 puntos de bonificación (tope académico: 20.0) antes de promediar.</p>
                </div>

                <button type="submit" 
                        class="w-full py-4 bg-gradient-to-r from-amber-950/30 to-amber-900/40 hover:from-[var(--dorado)] hover:to-[var(--dorado-apagado)] hover:text-black border border-[var(--dorado-apagado)] rounded-xl text-xs font-mono font-black tracking-widest uppercase transition-all duration-300 shadow-lg">
                    ♣ Calcular Promedio de Acta
                </button>
            </form>

            <%-- Alertador de errores en formato póker --%>
            <% if (request.getAttribute("error") != null) { %>
                <div class="p-4 bg-red-950/20 border border-[var(--rojo-poker)]/40 text-[var(--rojo-poker)] text-xs rounded-xl font-mono text-center">
                    ⚠️ <%= request.getAttribute("error") %>
                </div>
            <% } %>

            <% if (request.getAttribute("calculado") != null) { %>
                <div class="border-t border-zinc-900 pt-6 space-y-4">
                    <div class="flex items-center space-x-2">
                        <span class="text-[var(--dorado)]">♦</span>
                        <h3 class="text-xs text-gray-400 font-mono tracking-widest uppercase">Boleta Académica Oficial</h3>
                    </div>
                    
                    <div class="bg-zinc-950/80 border border-zinc-900 rounded-xl p-5 font-mono text-xs space-y-4">
                        
                        <div class="grid grid-cols-3 gap-3 text-center border-b border-zinc-900 pb-3">
                            <div>
                                <span class="text-gray-500 text-[10px] block uppercase">PC1</span>
                                <span class="text-white text-sm font-bold">${nota1}</span>
                            </div>
                            <div>
                                <span class="text-gray-500 text-[10px] block uppercase">PC2</span>
                                <span class="text-white text-sm font-bold">${nota2}</span>
                            </div>
                            <div>
                                <span class="text-[var(--dorado)] text-[10px] block uppercase">PC3 Base</span>
                                <span class="text-white text-sm font-bold">${nota3Original}</span>
                            </div>
                        </div>

                        <div class="flex justify-between items-center text-gray-300">
                            <span>Bonificación PC3 (+2 pts):</span>
                            <% if ((Boolean)request.getAttribute("bonificado")) { %>
                                <span class="text-green-500 font-bold bg-green-950/30 border border-green-800/45 px-2 py-0.5 rounded text-[10px]">APLICADO ➔ PC3: ${nota3Final}</span>
                            <% } else { %>
                                <span class="text-red-500 font-bold bg-red-950/30 border border-red-800/45 px-2 py-0.5 rounded text-[10px]">NO APLICA (Nota menor a 10)</span>
                            <% } %>
                        </div>

                        <div class="flex justify-between items-center text-xl font-black text-[var(--dorado)] border-t border-dashed border-zinc-800 pt-4">
                            <span>PROMEDIO FINAL:</span>
                            <span class="text-2xl">${String.format("%.2f", promedioFinal)}</span>
                        </div>
                    </div>
                </div>
            <% } %>
        </div>
    </div>

</body>
</html>