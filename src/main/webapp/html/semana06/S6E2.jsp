<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.folderrosalesd3.model.semana06.S6E2Model" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>S6E2 - Transportes Angelito Azules</title>
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
            <span class="text-2xl text-[var(--rojo-poker)]">♠️</span>
            <div>
                <h1 class="text-lg font-bold tracking-widest text-[var(--dorado)] uppercase">MESA S6E2</h1>
                <p class="text-[10px] text-zinc-400 font-mono">BOLETERÍA EXPRÉS - ANGELITO AZULES</p>
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
            
            <h2 class="text-xl font-extrabold text-[var(--dorado)] tracking-wide mb-2 uppercase">Comprar Boleto</h2>
            <p class="text-xs text-zinc-400 mb-6">Arme su viaje eligiendo la ruta y categoría de cabina en el panel de apuestas de la casa.</p>

            <% if (request.getAttribute("error") != null) { %>
                <div class="mb-4 p-3 bg-red-950/50 border border-red-800 text-red-400 text-xs rounded font-mono">
                    ⚠️ <%= request.getAttribute("error") %>
                </div>
            <% } %>

            <form action="${pageContext.request.contextPath}/S6E2Controller" method="POST" class="space-y-4">
                
                <div>
                    <label class="block text-[10px] font-mono uppercase text-zinc-400 tracking-wider mb-2">Ruta de Destino</label>
                    <select name="ruta" class="w-full bg-[#0a0a0a] border border-zinc-800 text-xs text-white rounded p-3 focus:outline-none focus:border-[var(--dorado)] font-mono transition-all">
                        <option value="huanuco">Lima — Huánuco</option>
                        <option value="huancayo">Lima — Huancayo</option>
                    </select>
                </div>

                <div>
                    <label class="block text-[10px] font-mono uppercase text-zinc-400 tracking-wider mb-2">Clase / Calidad de Servicio</label>
                    <select name="calidad" class="w-full bg-[#0a0a0a] border border-zinc-800 text-xs text-white rounded p-3 focus:outline-none focus:border-[var(--dorado)] font-mono transition-all">
                        <option value="A">Clase A (Premium)</option>
                        <option value="B">Clase B (Ejecutivo)</option>
                        <option value="C">Clase C (Económico)</option>
                    </select>
                </div>

                <div>
                    <label class="block text-[10px] font-mono uppercase text-zinc-400 tracking-wider mb-2">Boletos Requeridos</label>
                    <input type="number" name="cantidad" placeholder="Mínimo 1 boleto" min="1" required
                           class="w-full bg-[#0a0a0a] border border-zinc-800 text-xs text-white rounded p-3 focus:outline-none focus:border-[var(--dorado)] font-mono transition-all">
                </div>

                <button type="submit" 
                        class="w-full py-4 bg-gradient-to-r from-amber-800 to-yellow-600 hover:from-amber-700 hover:to-yellow-500 text-white text-xs uppercase tracking-widest font-black rounded-lg transition-all shadow-lg shadow-amber-950/40">
                    🃏 Procesar Pasaje
                </button>
            </form>

            <div class="mt-6 pt-5 border-t border-zinc-900 space-y-2 font-mono text-[10px]">
                <span class="text-[9px] text-zinc-500 block uppercase tracking-wider">Regla de Descuento Especial 5%</span>
                <p class="text-zinc-400 leading-relaxed text-[9.5px]">
                    El descuento de mesa del <strong class="text-[var(--dorado)]">5.0%</strong> se otorga exclusivamente para pasajeros de <strong class="text-white">Clase A</strong> al adquirir <strong class="text-emerald-400">más de 4 pasajes</strong>.
                </p>
            </div>
        </section>

        <section class="md:col-span-7 flex flex-col h-full justify-between">
            <% 
                S6E2Model resultado = (S6E2Model) request.getAttribute("resultado");
                if (resultado == null) { 
            %>
                <div class="h-full min-h-[380px] bg-zinc-950/20 border-2 border-dashed border-zinc-900 rounded-xl flex flex-col items-center justify-center p-8 text-center">
                    <span class="text-4xl mb-4 opacity-30">🎰</span>
                    <h3 class="text-sm font-bold text-zinc-400 uppercase tracking-widest">Crupier en Espera</h3>
                    <p class="text-xs text-zinc-500 max-w-xs mt-2">Defina sus destinos y la cantidad de pasajes para liquidar los descuentos correspondientes en la boletería.</p>
                </div>
            <% } else { %>
                <div class="bg-zinc-950/95 border border-zinc-900 p-6 rounded-xl shadow-2xl space-y-6">
                    
                    <div class="flex justify-between items-center border-b border-zinc-900 pb-4 font-mono">
                        <div>
                            <span class="text-[10px] text-zinc-500 block uppercase">RUTA IMPRESA</span>
                            <span class="text-sm text-[var(--dorado)] font-bold tracking-widest">
                                LIMA — <%= resultado.getRuta().toUpperCase() %>
                            </span>
                        </div>
                        <div class="text-right">
                            <span class="text-[10px] text-zinc-500 block">CATEGORÍA / BOLETOS</span>
                            <span class="text-sm text-white font-bold">
                                Clase <%= resultado.getCalidad() %> • <%= resultado.getCantidad() %> unds
                            </span>
                        </div>
                    </div>

                    <div class="grid grid-cols-2 gap-4 font-mono">
                        
                        <div class="bg-[#050505] p-4 border border-zinc-900 rounded-lg">
                            <span class="text-[9px] text-zinc-500 block">VALOR DEL BOLETO</span>
                            <span class="text-lg font-black text-zinc-300">S/. <%= String.format("%.2f", resultado.getPrecioUnitario()) %></span>
                        </div>

                        <div class="bg-[#050505] p-4 border border-zinc-900 rounded-lg">
                            <span class="text-[9px] text-zinc-500 block">IMPORTE BRUTO</span>
                            <span class="text-lg font-black text-zinc-300">S/. <%= String.format("%.2f", resultado.getImporteCompra()) %></span>
                        </div>

                        <div class="bg-[#050505] p-4 border border-zinc-900 rounded-lg col-span-2 flex justify-between items-center">
                            <div>
                                <span class="text-[9px] text-zinc-500 block">DESCUENTO DE MESA</span>
                                <span class="text-xs text-red-500 font-bold font-mono">Aplicado: <%= resultado.getPorcentajeDescuento() %>%</span>
                            </div>
                            <span class="text-lg font-black text-red-500">- S/. <%= String.format("%.2f", resultado.getImporteDescuento()) %></span>
                        </div>
                    </div>

                    <div class="bg-[#08080c] border border-zinc-800 p-5 rounded-lg flex justify-between items-center font-mono">
                        <div>
                            <span class="text-[10px] text-zinc-500 block uppercase tracking-wider">Monto Líquido a Pagar</span>
                            <span class="text-xs text-zinc-400 italic">Total con impuestos incluidos</span>
                        </div>
                        <div class="text-right">
                            <span class="text-2xl font-black text-[var(--dorado)]">
                                S/. <%= String.format("%.2f", resultado.getImportePagar()) %>
                            </span>
                        </div>
                    </div>

                    <div class="p-3 bg-zinc-900/40 border border-zinc-900 rounded text-[10.5px] text-zinc-400 leading-relaxed font-mono">
                        <% if (resultado.getPorcentajeDescuento() > 0) { %>
                            🎉 ¡Felicidades! Se ha aplicado el <strong>5% de descuento</strong> debido a que compró <strong><%= resultado.getCantidad() %> boletos</strong> (más de 4) en <strong>Clase A</strong>.
                        <% } else { %>
                            ℹ️ En esta mano <strong>no se aplicó el descuento</strong> de mesa. Recuerde que requiere adquirir <strong>más de 4 boletos</strong> y que estos correspondan exclusivamente a la <strong>Clase A</strong>.
                        <% } %>
                    </div>

                </div>
            <% } %>
        </section>

    </main>

    <footer class="max-w-5xl w-full mx-auto text-center border-t border-zinc-900 pt-4 mt-6">
        <p class="text-[10px] text-zinc-500 font-mono tracking-widest uppercase">
            S6E2 - CONTROL DE FLOTA Y PASAJES • ANGELITO AZULES
        </p>
    </footer>

</body>
</html>