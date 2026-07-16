<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.folderrosalesd3.model.semana05.S5E4Model" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>S5E4 - Sumatoria de Serie Alternada (do...while)</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        :root {
            --dorado: #ffcc00;
            --dorado-apagado: #b8860b;
            --rojo-poker: #ff3344;
            --verde-mesa: #072a13;
            --fondo: #0a0a0a;
        }
        body {
            background-color: var(--fondo);
            background-image: 
                radial-gradient(circle at 50% 50%, rgba(15, 35, 20, 0.9) 0%, rgba(5, 5, 5, 1) 100%),
                linear-gradient(315deg, #111111 25%, transparent 25%), 
                linear-gradient(45deg, #111111 25%, transparent 25%);
            background-size: 100% 100%, 30px 30px, 30px 30px;
            color: #ffffff;
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
        }
    </style>
</head>
<body class="min-h-screen flex flex-col justify-between py-6 px-4">

    <header class="max-w-5xl w-full mx-auto flex justify-between items-center border-b border-emerald-950 pb-4 mb-6">
        <div class="flex items-center space-x-3">
            <span class="text-2xl text-emerald-500">♦️</span>
            <div>
                <h1 class="text-lg font-bold tracking-widest text-[var(--dorado)] uppercase">MESA S5E4</h1>
                <p class="text-[10px] text-zinc-400 font-mono">RESOLUCIÓN DE SERIES • FACTORIALES ITERATIVOS</p>
            </div>
        </div>
        <a href="${pageContext.request.contextPath}/index.jsp" 
           class="text-xs font-mono px-4 py-2 border border-emerald-900 bg-zinc-950/60 hover:border-[var(--dorado)] hover:text-[var(--dorado)] transition-all rounded">
            Volver al Deck Principal
        </a>
    </header>

    <main class="max-w-5xl w-full mx-auto grid grid-cols-1 md:grid-cols-12 gap-6 items-start my-auto">
        
        <section class="md:col-span-4 bg-zinc-950/90 border border-emerald-950 p-6 rounded-xl shadow-2xl relative overflow-hidden">
            <div class="absolute top-0 right-0 w-32 h-32 bg-emerald-500/5 rounded-full blur-3xl"></div>
            
            <h2 class="text-xl font-extrabold text-[var(--dorado)] tracking-wide mb-2 uppercase">LÍMITE DE SERIE</h2>
            <p class="text-xs text-zinc-400 mb-6">Define cuántas iteraciones se procesarán utilizando únicamente la instrucción de control iterativo <code class="text-[var(--dorado)]">do...while</code>.</p>

            <div class="mb-6 p-4 bg-[#050505] border border-emerald-950/50 rounded-lg text-center">
                <span class="text-[9px] text-zinc-500 font-mono block mb-1">FÓRMULA EVALUADA</span>
                <span class="text-xs font-mono text-emerald-400 tracking-wider">
                    S = 1 - <span class="text-zinc-400">2/2!</span> + <span class="text-zinc-400">3/3!</span> - <span class="text-zinc-400">4/4!</span> + ...
                </span>
            </div>

            <% if (request.getAttribute("error") != null) { %>
                <div class="mb-4 p-3.5 bg-red-950/30 border border-[var(--rojo-poker)] text-[var(--rojo-poker)] rounded text-xs font-mono flex items-center space-x-2">
                    <span>⚠️</span>
                    <span><%= request.getAttribute("error") %></span>
                </div>
            <% } %>

            <form action="${pageContext.request.contextPath}/S5E4Controller" method="POST" class="space-y-4 font-mono">
                <div>
                    <label class="block text-[11px] text-zinc-400 uppercase tracking-widest mb-1.5 font-bold">NÚMERO DE TÉRMINOS (N)</label>
                    <input type="number" name="terminos" required min="1" max="20" placeholder="Ej: 5"
                           class="w-full bg-[#050505] border border-emerald-950 focus:border-[var(--dorado)] text-white text-sm px-4 py-3 rounded outline-none transition-all focus:ring-1 focus:ring-[var(--dorado)]">
                    <span class="text-[9px] text-zinc-500 mt-1.5 block">Máximo recomendado: 20 iteraciones para evitar desborde computacional.</span>
                </div>

                <button type="submit" 
                        class="w-full py-3.5 mt-2 bg-gradient-to-r from-emerald-700 to-emerald-500 hover:from-emerald-600 hover:to-emerald-400 text-white text-xs uppercase tracking-widest font-black rounded-lg transition-all shadow-lg shadow-emerald-950/40">
                    ♣️ Calcular Sumatoria
                </button>
            </form>
        </section>

        <section class="md:col-span-8 flex flex-col h-full justify-between">
            <% 
                S5E4Model resultado = (S5E4Model) request.getAttribute("resultado");
                if (resultado == null) { 
            %>
                <div class="h-full min-h-[350px] bg-zinc-950/25 border-2 border-dashed border-emerald-950 rounded-xl flex flex-col items-center justify-center p-8 text-center">
                    <span class="text-4xl mb-4 opacity-40">♣️</span>
                    <h3 class="text-sm font-bold text-zinc-400 uppercase tracking-widest">Esperando Parámetro N</h3>
                    <p class="text-xs text-zinc-500 max-w-xs mt-2">Defina el tamaño de la serie en el panel de apuestas para generar el listado y la suma de la sucesión matemática.</p>
                </div>
            <% } else { %>
                <div class="bg-zinc-950/90 border border-emerald-900 p-6 rounded-xl shadow-2xl space-y-6">
                    
                    <div class="flex justify-between items-center border-b border-emerald-950 pb-4">
                        <div>
                            <span class="text-[10px] text-zinc-500 font-mono block uppercase">TÉRMINOS PROCESADOS</span>
                            <span class="text-2xl font-black text-white font-mono"><%= resultado.getN() %> términos</span>
                        </div>
                        <div class="text-right">
                            <span class="text-[10px] text-[var(--dorado)] font-mono block uppercase">VALOR TOTAL DE S</span>
                            <span class="text-3xl font-black text-[var(--dorado)] font-mono tracking-wider">
                                <%= String.format("%.8f", resultado.getSumaTotal()) %>
                            </span>
                        </div>
                    </div>

                    <div>
                        <h4 class="text-[11px] font-bold text-zinc-400 uppercase tracking-widest font-mono mb-3">Historial de Iteración (do...while)</h4>
                        <div class="overflow-x-auto rounded-lg border border-emerald-950/70 bg-zinc-900/30">
                            <table class="w-full text-left font-mono text-xs">
                                <thead class="bg-zinc-950 text-zinc-400 border-b border-emerald-950">
                                    <tr>
                                        <th class="p-3 text-center">N°</th>
                                        <th class="p-3">Estructura del Término</th>
                                        <th class="p-3 text-right">Valor Decimal</th>
                                        <th class="p-3 text-right text-[var(--dorado)]">Suma Acumulada</th>
                                    </tr>
                                </thead>
                                <tbody class="divide-y divide-zinc-950">
                                    <% 
                                        List<S5E4Model.Termino> terminos = resultado.getDetallesTerminos();
                                        for (S5E4Model.Termino t : terminos) {
                                            boolean esNegativo = t.getValor() < 0;
                                    %>
                                        <tr class="hover:bg-zinc-900/50 transition-colors">
                                            <td class="p-3 text-center text-zinc-500"><%= t.getIndice() %></td>
                                            <td class="p-3 font-semibold <%= esNegativo ? "text-[var(--rojo-poker)]" : "text-emerald-400" %>">
                                                <%= t.getRepresentacion() %>
                                            </td>
                                            <td class="p-3 text-right font-bold">
                                                <%= String.format("%.8f", t.getValor()) %>
                                            </td>
                                            <td class="p-3 text-right text-[var(--dorado)] font-bold">
                                                <%= String.format("%.8f", t.getSumaAcumulada()) %>
                                            </td>
                                        </tr>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    
                </div>
            <% } %>
        </section>

    </main>

    <footer class="max-w-5xl w-full mx-auto text-center border-t border-emerald-950/60 pt-4 mt-6">
        <p class="text-[10px] text-zinc-500 font-mono tracking-widest uppercase">
            S5E4 - ESTRUCTURAS DE CONTROL REPETITIVAS EXCLUSIVAS • MESA DE TRABAJO INTELIGENTE
        </p>
    </footer>

</body>
</html>