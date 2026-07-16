<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.folderrosalesd3.model.semana06.S6E3Model" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>S6E3 - Becas y Pensiones de Estudio</title>
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
<body class="min-h-screen flex flex-col justify-between py-6 px-4">

    <header class="max-w-5xl w-full mx-auto flex justify-between items-center border-b border-zinc-800 pb-4 mb-6">
        <div class="flex items-center space-x-3">
            <span class="text-2xl text-[var(--rojo-poker)]">♣️</span>
            <div>
                <h1 class="text-lg font-bold tracking-widest text-[var(--dorado)] uppercase">MESA S6E3</h1>
                <p class="text-[10px] text-zinc-400 font-mono">TABLA DE REBAJA DE PENSIONES - ACADÉMICO</p>
            </div>
        </div>
        <a href="${pageContext.request.contextPath}/index.jsp" 
           class="text-xs font-mono px-4 py-2 border border-zinc-800 bg-zinc-950/60 hover:border-[var(--dorado)] hover:text-[var(--dorado)] transition-all rounded">
            Volver al Deck Principal
        </a>
    </header>

    <main class="max-w-5xl w-full mx-auto grid grid-cols-1 md:grid-cols-12 gap-6 items-start my-auto">
        
        <section class="md:col-span-5 bg-zinc-950/90 border border-zinc-900 p-6 rounded-xl shadow-2xl relative overflow-hidden">
            <div class="absolute top-0 right-0 w-32 h-32 bg-yellow-500/5 rounded-full blur-3xl"></div>
            
            <h2 class="text-xl font-extrabold text-[var(--dorado)] tracking-wide mb-2 uppercase">Simulador de Beca</h2>
            <p class="text-xs text-zinc-400 mb-6">Seleccione la categoría del estudiante y declare su promedio ponderado actual para aplicar las deducciones sobre la pensión base.</p>

            <% if (request.getAttribute("error") != null) { %>
                <div class="mb-4 p-3 bg-red-950/50 border border-red-800 text-red-400 text-xs rounded font-mono">
                    ⚠️ <%= request.getAttribute("error") %>
                </div>
            <% } %>

            <form action="${pageContext.request.contextPath}/S6E3Controller" method="POST" class="space-y-4">
                
                <div>
                    <label class="block text-[10px] font-mono uppercase text-zinc-400 tracking-wider mb-2">Categoría de Pensiones</label>
                    <select name="categoria" class="w-full bg-[#0a0a0a] border border-zinc-800 text-xs text-white rounded p-3 focus:outline-none focus:border-[var(--dorado)] font-mono transition-all">
                        <option value="A">Categoría A — S/. 550.00</option>
                        <option value="B">Categoría B — S/. 500.00</option>
                        <option value="C">Categoría C — S/. 460.00</option>
                        <option value="D">Categoría D — S/. 400.00</option>
                    </select>
                </div>

                <div>
                    <label class="block text-[10px] font-mono uppercase text-zinc-400 tracking-wider mb-2">Promedio Ponderado [0.00 - 20.00]</label>
                    <input type="number" step="0.01" min="0" max="20" name="promedio" placeholder="Ejemplo: 16.75" required
                           class="w-full bg-[#0a0a0a] border border-zinc-800 text-xs text-white rounded p-3 focus:outline-none focus:border-[var(--dorado)] font-mono transition-all">
                </div>

                <button type="submit" 
                        class="w-full py-4 bg-gradient-to-r from-amber-800 to-yellow-600 hover:from-amber-700 hover:to-yellow-500 text-white text-xs uppercase tracking-widest font-black rounded-lg transition-all shadow-lg shadow-amber-950/40">
                    🎲 Calcular Pensión
                </button>
            </form>

            <div class="mt-6 pt-5 border-t border-zinc-900 space-y-2.5 font-mono text-[10px]">
                <span class="text-[9px] text-zinc-500 block uppercase tracking-wider">Descuentos por Notas</span>
                <div class="flex justify-between text-zinc-400">
                    <span>De 0 a 13.99:</span>
                    <span class="text-red-400 font-bold">Sin descuento (0%)</span>
                </div>
                <div class="flex justify-between text-zinc-400">
                    <span>De 14 a 15.99:</span>
                    <span class="text-amber-400 font-bold">10% de rebaja</span>
                </div>
                <div class="flex justify-between text-zinc-400">
                    <span>De 16 a 17.99:</span>
                    <span class="text-emerald-400 font-bold">12% de rebaja</span>
                </div>
                <div class="flex justify-between text-zinc-400">
                    <span>De 18 a 20.00:</span>
                    <span class="text-blue-400 font-bold">15% de rebaja</span>
                </div>
            </div>
        </section>

        <section class="md:col-span-7 flex flex-col h-full justify-between">
            <% 
                S6E3Model resultado = (S6E3Model) request.getAttribute("resultado");
                if (resultado == null) { 
            %>
                <div class="h-full min-h-[380px] bg-zinc-950/20 border-2 border-dashed border-zinc-900 rounded-xl flex flex-col items-center justify-center p-8 text-center">
                    <span class="text-4xl mb-4 opacity-30">🏫</span>
                    <h3 class="text-sm font-bold text-zinc-400 uppercase tracking-widest">Carga de Expediente</h3>
                    <p class="text-xs text-zinc-500 max-w-xs mt-2">Defina el promedio del ciclo y la categoría asignada al alumno para emitir la orden de pago estructurada.</p>
                </div>
            <% } else { %>
                <div class="bg-zinc-950/95 border border-zinc-900 p-6 rounded-xl shadow-2xl space-y-6">
                    
                    <div class="flex justify-between items-center border-b border-zinc-900 pb-4 font-mono">
                        <div>
                            <span class="text-[10px] text-zinc-500 block uppercase">CATEGORÍA ACADÉMICA</span>
                            <span class="text-sm text-[var(--dorado)] font-bold tracking-widest">
                                ALUMNO CATEGORÍA "<%= resultado.getCategoria().toUpperCase() %>"
                            </span>
                        </div>
                        <div class="text-right">
                            <span class="text-[10px] text-zinc-500 block">PROMEDIO FINAL</span>
                            <span class="text-sm text-white font-bold">
                                <%= String.format("%.2f", resultado.getPromedio()) %> / 20.00
                            </span>
                        </div>
                    </div>

                    <div class="grid grid-cols-2 gap-4 font-mono">
                        
                        <div class="bg-[#050505] p-4 border border-zinc-900 rounded-lg">
                            <span class="text-[9px] text-zinc-500 block">PENSIÓN COMPLETA</span>
                            <span class="text-lg font-black text-zinc-300">S/. <%= String.format("%.2f", resultado.getPensionActual()) %></span>
                        </div>

                        <div class="bg-[#050505] p-4 border border-zinc-900 rounded-lg">
                            <span class="text-[9px] text-zinc-500 block">AHORRO APLICADO (<%= resultado.getPorcentajeDescuento() %>%)</span>
                            <span class="text-lg font-black text-red-500">- S/. <%= String.format("%.2f", resultado.getImporteDescuento()) %></span>
                        </div>
                    </div>

                    <div class="bg-[#08080c] border border-zinc-800 p-5 rounded-lg flex justify-between items-center font-mono">
                        <div>
                            <span class="text-[10px] text-zinc-500 block uppercase tracking-wider">Pensión Neta a Cancelar</span>
                            <span class="text-xs text-zinc-400 italic">Mensualidad rebajada final</span>
                        </div>
                        <div class="text-right">
                            <span class="text-2xl font-black text-[var(--dorado)]">
                                S/. <%= String.format("%.2f", resultado.getNuevaPension()) %>
                            </span>
                        </div>
                    </div>

                    <div class="p-3 bg-zinc-900/40 border border-zinc-900 rounded text-[10.5px] text-zinc-400 leading-relaxed font-mono">
                        <% if (resultado.getPorcentajeDescuento() > 0) { %>
                            🎉 <strong>¡Mesa ganada!</strong> El estudiante califica para un beneficio del <strong><%= resultado.getPorcentajeDescuento() %>%</strong> sobre su mensualidad gracias a su destacada nota promedio.
                        <% } else { %>
                            ℹ️ El promedio actual no alcanza la marca mínima de <strong>14.00</strong> requerida para el descuento. La pensión se cancelará en su totalidad.
                        <% } %>
                    </div>

                </div>
            <% } %>
        </section>

    </main>

    <footer class="max-w-5xl w-full mx-auto text-center border-t border-zinc-900 pt-4 mt-6">
        <p class="text-[10px] text-zinc-500 font-mono tracking-widest uppercase">
            S6E3 - EVALUACIÓN ACADÉMICA Y CONTROL FINANCIERO DE MATRÍCULA
        </p>
    </footer>

</body>
</html>