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

            <% if (request.getAttribute("error") != null) { %>
                <div class="mb-4 p-3.5 bg-red-950/30 border border-[var(--rojo-poker)] text-[var(--rojo-poker)] rounded text-xs font-mono flex items-center space-x-2">
                    <span>⚠️</span>
                    <span><%= request.getAttribute("error") %></span>
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
            <% } else { %>
                <div class="bg-zinc-950/80 border border-zinc-900 p-6 rounded-xl shadow-2xl space-y-6">
                    
                    <div class="grid grid-cols-3 gap-4 border-b border-zinc-900 pb-5">
                        <div class="bg-[#050505] p-3.5 border border-zinc-900 rounded-lg text-center">
                            <span class="text-[9px] text-gray-400 block font-mono">MESA (N)</span>
                            <span class="text-lg font-black text-white font-mono"><%= resultado.getnTerminos() %></span>
                        </div>
                        <div class="bg-[#050505] p-3.5 border border-zinc-900 rounded-lg text-center ring-1 ring-amber-500/20">
                            <span class="text-[9px] text-[var(--dorado)] block font-mono">SUMA DE SERIE</span>
                            <span class="text-lg font-black text-[var(--dorado)] font-mono"><%= resultado.getSumaTotal() %></span>
                        </div>
                        <div class="bg-[#050505] p-3.5 border border-zinc-900 rounded-lg text-center">
                            <span class="text-[9px] text-gray-400 block font-mono">PROMEDIO DECIMAL</span>
                            <span class="text-lg font-black text-emerald-400 font-mono"><%= resultado.getPromedio() %></span>
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
                                        <span>N° <%= i + 1 %></span>
                                        <span class="text-[var(--rojo-poker)]">♣</span>
                                    </div>
                                    <div class="my-2">
                                        <span class="text-xl font-extrabold tracking-tight text-white font-mono">
                                            <%= frac.get(i) %>
                                        </span>
                                    </div>
                                    <div class="text-[10px] font-mono text-zinc-400 border-t border-zinc-900/80 w-full pt-1.5 mt-1.5">
                                        ≈ <%= dec.get(i) %>
                                    </div>
                                </div>
                            <% } %>
                        </div>
                    </div>
                    
                </div>
            <% } %>
        </section>

    </main>

    <footer class="max-w-5xl w-full mx-auto text-center border-t border-zinc-900 pt-4 mt-6">
        <p class="text-[10px] text-gray-500 font-mono tracking-widest uppercase">
            S5E2 - SISTEMA CONVERGENTE DE CÁLCULO ITERATIVO • CASINO PREMIUM
        </p>
    </footer>

</body>
</html>