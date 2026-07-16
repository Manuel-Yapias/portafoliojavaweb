<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.folderrosalesd3.model.semana06.S6E1Model" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>S6E1 - Dulcería Dulce Porvenir</title>
    <!-- Tailwind CSS CDN -->
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

    <!-- Header / Barra superior -->
    <header class="max-w-5xl w-full mx-auto flex justify-between items-center border-b border-zinc-800 pb-4 mb-6">
        <div class="flex items-center space-x-3">
            <span class="text-2xl text-[var(--rojo-poker)]">♦️</span>
            <div>
                <h1 class="text-lg font-bold tracking-widest text-[var(--dorado)] uppercase">MESA S6E1</h1>
                <p class="text-[10px] text-zinc-400 font-mono">LIQUIDACIÓN DE COMPRAS - DULCE PORVENIR</p>
            </div>
        </div>
        <a href="${pageContext.request.contextPath}/index.jsp" 
           class="text-xs font-mono px-4 py-2 border border-zinc-800 bg-zinc-950/60 hover:border-[var(--dorado)] hover:text-[var(--dorado)] transition-all rounded">
            Volver al Deck Principal
        </a>
    </header>

    <!-- Cuerpo principal de la mesa -->
    <main class="max-w-5xl w-full mx-auto grid grid-cols-1 md:grid-cols-12 gap-6 items-start my-auto">
        
        <!-- Panel de transacciones (Izquierda) -->
        <section class="md:col-span-5 bg-zinc-950/90 border border-zinc-900 p-6 rounded-xl shadow-2xl relative overflow-hidden">
            <div class="absolute top-0 right-0 w-32 h-32 bg-yellow-500/5 rounded-full blur-3xl"></div>
            
            <h2 class="text-xl font-extrabold text-[var(--dorado)] tracking-wide mb-2 uppercase">Hacer Pedido</h2>
            <p class="text-xs text-zinc-400 mb-6">Seleccione el tipo de chocolate y defina las unidades para calcular su descuento de mesa y obsequios acumulados.</p>

            <!-- Errores en la mesa -->
            <% if (request.getAttribute("error") != null) { %>
                <div class="mb-4 p-3 bg-red-950/50 border border-red-800 text-red-400 text-xs rounded font-mono">
                    ⚠️ <%= request.getAttribute("error") %>
                </div>
            <% } %>

            <form action="${pageContext.request.contextPath}/S6E1Controller" method="POST" class="space-y-4">
                
                <!-- Input: Tipo Chocolate -->
                <div>
                    <label class="block text-[10px] font-mono uppercase text-zinc-400 tracking-wider mb-2">Variedad de Chocolate</label>
                    <select name="tipoChocolate" class="w-full bg-[#0a0a0a] border border-zinc-800 text-xs text-white rounded p-3 focus:outline-none focus:border-[var(--dorado)] font-mono transition-all">
                        <option value="Primor">Primor — S/. 8.50</option>
                        <option value="Dulzura">Dulzura — S/. 10.00</option>
                        <option value="Tentacion">Tentación — S/. 7.00</option>
                        <option value="Explosion">Explosión — S/. 12.50</option>
                    </select>
                </div>

                <!-- Input: Cantidad -->
                <div>
                    <label class="block text-[10px] font-mono uppercase text-zinc-400 tracking-wider mb-2">Cantidad de Unidades</label>
                    <input type="number" name="cantidad" placeholder="Mínimo 1" min="1" required
                           class="w-full bg-[#0a0a0a] border border-zinc-800 text-xs text-white rounded p-3 focus:outline-none focus:border-[var(--dorado)] font-mono transition-all">
                </div>

                <!-- Botón de Envío -->
                <button type="submit" 
                        class="w-full py-4 bg-gradient-to-r from-amber-800 to-yellow-600 hover:from-amber-700 hover:to-yellow-500 text-white text-xs uppercase tracking-widest font-black rounded-lg transition-all shadow-lg shadow-amber-950/40">
                    🎰 Ejecutar Transacción
                </button>
            </form>

            <!-- Reglas de Distribución de Descuentos -->
            <div class="mt-6 pt-5 border-t border-zinc-900 space-y-2.5 font-mono text-[10px]">
                <span class="text-[9px] text-zinc-500 block uppercase tracking-wider">TABLA DE REGLAS DE DESCUENTO</span>
                <div class="flex justify-between text-zinc-400">
                    <span>Menos de 5 unidades:</span>
                    <span class="text-red-400 font-bold">4.0%</span>
                </div>
                <div class="flex justify-between text-zinc-400">
                    <span>De 5 a 9 unidades:</span>
                    <span class="text-amber-400 font-bold">6.5%</span>
                </div>
                <div class="flex justify-between text-zinc-400">
                    <span>De 10 a 14 unidades:</span>
                    <span class="text-emerald-400 font-bold">9.0%</span>
                </div>
                <div class="flex justify-between text-zinc-400">
                    <span>15 unidades o más:</span>
                    <span class="text-blue-400 font-bold">11.5%</span>
                </div>
            </div>
        </section>

        <!-- Panel de Visualización del Recibo (Derecha) -->
        <section class="md:col-span-7 flex flex-col h-full justify-between">
            <% 
                S6E1Model resultado = (S6E1Model) request.getAttribute("resultado");
                if (resultado == null) { 
            %>
                <!-- Esperando acción del usuario -->
                <div class="h-full min-h-[380px] bg-zinc-950/20 border-2 border-dashed border-zinc-900 rounded-xl flex flex-col items-center justify-center p-8 text-center">
                    <span class="text-4xl mb-4 opacity-30">🎰</span>
                    <h3 class="text-sm font-bold text-zinc-400 uppercase tracking-widest">Croupier Esperando</h3>
                    <p class="text-xs text-zinc-500 max-w-xs mt-2">Introduce las unidades deseadas para calcular el precio bruto, descuentos aplicados, total neto y tus obsequios.</p>
                </div>
            <% } else { %>
                <!-- Recibo de Liquidación Premium -->
                <div class="bg-zinc-950/95 border border-zinc-900 p-6 rounded-xl shadow-2xl space-y-6">
                    
                    <div class="flex justify-between items-center border-b border-zinc-900 pb-4 font-mono">
                        <div>
                            <span class="text-[10px] text-zinc-500 block uppercase">CONTRATO DE VENTA</span>
                            <span class="text-sm text-[var(--dorado)] font-bold tracking-widest"><%= resultado.getTipoChocolate().toUpperCase() %></span>
                        </div>
                        <div class="text-right">
                            <span class="text-[10px] text-zinc-500 block">CANTIDAD</span>
                            <span class="text-sm text-white font-bold"><%= resultado.getCantidad() %> unds</span>
                        </div>
                    </div>

                    <!-- Métricas Principales en Cards Grid -->
                    <div class="grid grid-cols-2 gap-4 font-mono">
                        
                        <!-- Precio Unitario -->
                        <div class="bg-[#050505] p-4 border border-zinc-900 rounded-lg">
                            <span class="text-[9px] text-zinc-500 block">PRECIO UNITARIO</span>
                            <span class="text-lg font-black text-zinc-300">S/. <%= String.format("%.2f", resultado.getPrecioUnitario()) %></span>
                        </div>

                        <!-- Importe Bruto -->
                        <div class="bg-[#050505] p-4 border border-zinc-900 rounded-lg">
                            <span class="text-[9px] text-zinc-500 block">IMPORTE BRUTO</span>
                            <span class="text-lg font-black text-zinc-300">S/. <%= String.format("%.2f", resultado.getImporteCompra()) %></span>
                        </div>

                        <!-- Porcentaje de Descuento -->
                        <div class="bg-[#050505] p-4 border border-zinc-900 rounded-lg">
                            <span class="text-[9px] text-zinc-500 block">DESCUENTO (<%= resultado.getPorcentajeDescuento() %>%)</span>
                            <span class="text-lg font-black text-red-500">- S/. <%= String.format("%.2f", resultado.getImporteDescuento()) %></span>
                        </div>

                        <!-- Caramelos Obsequiados -->
                        <div class="bg-[#050505] p-4 border border-zinc-900 rounded-lg">
                            <span class="text-[9px] text-emerald-500 block font-bold">🍬 OBSEQUIO ACUMULADO</span>
                            <span class="text-lg font-black text-emerald-400">
                                <%= resultado.getCaramelosObsequio() %> <span class="text-xs">unid</span>
                            </span>
                        </div>
                    </div>

                    <!-- Total a Pagar en Grande -->
                    <div class="bg-[#08080c] border border-zinc-800 p-5 rounded-lg flex justify-between items-center font-mono">
                        <div>
                            <span class="text-[10px] text-zinc-500 block uppercase tracking-wider">Monto Final a Pagar</span>
                            <span class="text-xs text-zinc-400 italic">Neto de la transacción</span>
                        </div>
                        <div class="text-right">
                            <span class="text-2xl font-black text-[var(--dorado)]">
                                S/. <%= String.format("%.2f", resultado.getImportePagar()) %>
                            </span>
                        </div>
                    </div>

                    <!-- Información Adicional de Regalo -->
                    <div class="p-3 bg-zinc-900/40 border border-zinc-900 rounded text-[10.5px] text-zinc-400 leading-relaxed font-mono">
                        ℹ️ <strong>Regla de Obsequio:</strong> Debido a que el pago final es 
                        <%= (resultado.getImportePagar() >= 250.0) ? "mayor o igual a S/. 250.00" : "menor a S/. 250.00" %>, 
                        se te han asignado 
                        <strong><%= (resultado.getImportePagar() >= 250.0) ? "3" : "2" %> caramelos</strong> por cada chocolate adquirido.
                    </div>

                </div>
            <% } %>
        </section>

    </main>

    <!-- Footer -->
    <footer class="max-w-5xl w-full mx-auto text-center border-t border-zinc-900 pt-4 mt-6">
        <p class="text-[10px] text-zinc-500 font-mono tracking-widest uppercase">
            S6E1 - SISTEMA DE FACTURACIÓN Y CONTROL • DULCE PORVENIR
        </p>
    </footer>

</body>
</html>