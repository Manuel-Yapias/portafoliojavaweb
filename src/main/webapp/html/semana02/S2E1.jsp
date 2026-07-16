<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>S2E1 - Importes de Compra y Obsequio</title>
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
    <body class="min-h-screen flex flex-col p-4 md:p-6 justify-between">

        <header class="w-full max-w-[900px] mx-auto flex items-center justify-between py-5 px-6 bg-[#0d0d0d] border border-[#1c1c1c] rounded-t-lg">
            <div class="flex items-center space-x-4">
                <span class="text-[var(--dorado)] text-2xl font-mono">♠</span>
                <div>
                    <h1 class="text-xl font-black tracking-wider text-white">PROYECTO S2</h1>
                    <p class="text-[10px] text-[var(--dorado)] tracking-widest font-mono uppercase">Semana 2 - Ejercicio 1</p>
                </div>
            </div>
            <a href="${pageContext.request.contextPath}/index.jsp" class="px-4 py-2 bg-[#141414] border border-[#222] rounded text-xs font-mono text-gray-400 hover:text-[var(--dorado)] hover:border-[var(--dorado)] transition-all">
                ↩ Volver al Deck
            </a>
        </header>

        <main class="w-full max-w-[900px] mx-auto bg-[#0d0d0d] border-x border-[#1c1c1c] p-6 md:p-8 space-y-8">

            <div class="bg-[#111] p-4 rounded-lg border border-[#222]">
                <h2 class="text-xs font-mono text-[var(--dorado)] uppercase tracking-wider mb-2">📋 Enunciado del Ejercicio (Tienda en Oferta)</h2>
                <p class="text-sm text-gray-300 leading-relaxed">
                    Determine el <strong>importe de la compra</strong> (Precio &times; Cantidad), el <strong>importe del descuento (11%)</strong>, el <strong>importe final a pagar</strong> y la entrega de un incentivo especial consistente en <strong>2 caramelos</strong> por cada unidad adquirida.
                </p>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                
                <form action="${pageContext.request.contextPath}/S2E1Controller" method="POST" class="space-y-4">
                    <h3 class="text-sm font-mono text-white uppercase tracking-widest border-b border-[#222] pb-2">🎰 Ingreso de Datos</h3>

                    <div>
                        <label for="precio" class="block text-xs font-mono text-gray-400 mb-1">Precio Unitario del Producto (S/.):</label>
                        <input type="number" step="any" id="precio" name="precio" required 
                               value="${not empty precio ? precio : ''}"
                               class="w-full bg-[#141414] border border-[#222] rounded p-2.5 text-sm text-white focus:outline-none focus:border-[var(--dorado)] transition-colors"
                               placeholder="Ej. 15.50">
                    </div>

                    <div>
                        <label for="cantidad" class="block text-xs font-mono text-gray-400 mb-1">Cantidad de Unidades Adquiridas:</label>
                        <input type="number" step="1" id="cantidad" name="cantidad" required 
                               value="${not empty cantidad ? cantidad : ''}"
                               class="w-full bg-[#141414] border border-[#222] rounded p-2.5 text-sm text-white focus:outline-none focus:border-[var(--dorado)] transition-colors"
                               placeholder="Ej. 5">
                    </div>

                    <button type="submit" class="w-full py-3 bg-[#111] border border-[var(--dorado-apagado)] rounded text-xs font-mono font-bold text-[var(--dorado)] uppercase tracking-widest hover:bg-[var(--dorado)] hover:text-black transition-all shadow-[0_0_15px_rgba(255,204,0,0.05)]">
                        Calcular Valores 🎴
                    </button>
                </form>

                <div class="bg-[#121212] border border-[#222] rounded-lg p-6 flex flex-col justify-between">
                    <div>
                        <h3 class="text-sm font-mono text-white uppercase tracking-widest border-b border-[#222] pb-2 mb-4">🏆 Mesa de Resultados</h3>

                        <% if (request.getAttribute("error") != null) { %>
                        <div class="bg-red-950/40 border border-[var(--rojo-poker)] p-3 rounded text-xs text-red-300 font-mono">
                            ⚠ Error: <%= request.getAttribute("error") %>
                        </div>
                        <% } else if (request.getAttribute("importePagar") != null) { %>
                        <div class="space-y-4 font-mono">
                            <div class="flex justify-between items-center py-2 border-b border-[#1c1c1c]">
                                <span class="text-xs text-gray-400">Precio analizado:</span>
                                <span class="text-sm text-white">S/. ${precio}</span>
                            </div>
                            <div class="flex justify-between items-center py-2 border-b border-[#1c1c1c]">
                                <span class="text-xs text-gray-400">Unidades solicitadas:</span>
                                <span class="text-sm text-white">${cantidad} uds.</span>
                            </div>
                            <div class="flex justify-between items-center py-2 border-b border-[#1c1c1c]">
                                <span class="text-xs text-gray-400">Importe de Compra:</span>
                                <span class="text-sm text-white">S/. ${importeCompra}</span>
                            </div>
                            <div class="flex justify-between items-center py-2 border-b border-[#1c1c1c] text-red-400">
                                <span class="text-xs">Descuento Realizado (11%):</span>
                                <span class="text-sm">- S/. ${importeDescuento}</span>
                            </div>
                            <div class="flex justify-between items-center py-2 border-b border-[#1c1c1c]">
                                <span class="text-xs text-[var(--dorado)] font-bold">Importe Neto a Pagar:</span>
                                <span class="text-lg font-bold text-[var(--dorado)]">S/. ${importePagar}</span>
                            </div>
                            <div class="flex justify-between items-center py-2 bg-[#181818]/50 px-2 rounded border border-[#222]">
                                <span class="text-xs text-emerald-400 flex items-center gap-1">🍬 Dulce Obsequio:</span>
                                <span class="text-sm font-bold text-emerald-400">${caramelos} caramelos</span>
                            </div>
                        </div>
                        <% } else { %>
                        <p class="text-xs text-gray-500 font-mono italic text-center py-12">Coloca el monto del producto y las unidades, luego haz clic en calcular para ver los importes.</p>
                        <% } %>
                    </div>
                </div>
            </div>

            <div class="border-t border-[#1c1c1c] pt-6">
                <details class="group bg-[#111] rounded-lg border border-[#222] transition-all duration-300 open:border-[var(--dorado)]">
                    <summary class="flex justify-between items-center p-4 cursor-pointer select-none hover:bg-[#161616] transition-colors rounded-lg">
                        <span class="text-xs font-mono text-[var(--dorado)] uppercase tracking-widest flex items-center gap-2">
                            <span>📖</span> MANUAL DE USO Y EXPLICACIÓN DE MÉTODOS (S2E1 - MVC)
                        </span>
                        <span class="text-gray-400 group-open:rotate-180 transition-transform duration-200">▼</span>
                    </summary>

                    <div class="p-6 border-t border-[#222] space-y-6">

                        <div class="bg-amber-950/20 border-l-4 border-[var(--dorado)] p-4 rounded-r-lg">
                            <h4 class="text-xs font-mono text-[var(--dorado)] font-bold uppercase mb-1">Arquitectura Limpia & Responsabilidad Única</h4>
                            <p class="text-[11px] text-gray-300 font-mono leading-relaxed">
                                Para este ejercicio de la <span class="text-[var(--dorado)] font-bold">Semana 2</span> se ha encapsulado el cálculo transaccional del descuento y la distribución de caramelos en métodos específicos del Modelo para evitar colisiones de lógica en la vista JSP.
                            </p>
                        </div>

                        <div class="space-y-4">
                            <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                                <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-[var(--dorado)] overflow-x-auto border-l-2 border-[var(--dorado)]">
                                    <pre><code>public double calcularDescuento() {
    return calcularImporteCompra() * 0.11;
}</code></pre>
                                </div>
                                <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                    <span class="text-[10px] text-[var(--dorado)] tracking-wider mb-1 uppercase font-bold">🧮 MODELO // NEGOCIO</span>
                                    <h5 class="text-white font-bold mb-2 text-sm">Método: calcularDescuento()</h5>
                                    <p class="text-gray-400 leading-relaxed">
                                        Calcula el valor exacto de la rebaja aplicando el <span class="text-[var(--dorado)]">11%</span> sobre el importe de la compra calculado dinámicamente.
                                    </p>
                                </div>
                            </div>

                            <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                                <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-sky-400 overflow-x-auto border-l-2 border-sky-500">
                                    <pre><code>private void inyectarResultados(
    HttpServletRequest request, 
    S2E1Model modelo
) {
    request.setAttribute("importeCompra", 
        modelo.calcularImporteCompra());
    request.setAttribute("importeDescuento", 
        modelo.calcularDescuento());
    request.setAttribute("importePagar", 
        modelo.calcularImportePagar());
    request.setAttribute("caramelos", 
        modelo.calcularCaramelosObsequio());
}</code></pre>
                                </div>
                                <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                    <span class="text-[10px] text-sky-400 tracking-wider mb-1 uppercase font-bold">🧬 CONTROLADOR // SERVLET</span>
                                    <h5 class="text-white font-bold mb-2 text-sm">Método: inyectarResultados()</h5>
                                    <p class="text-gray-400 leading-relaxed">
                                        Este método centraliza el envío de todos los resultados calculados por el modelo directo al request scope para que la vista los renderice usando etiquetas EL.
                                    </p>
                                </div>
                            </div>
                        </div>

                    </div>
                </details>
            </div>

        </main>

        <footer class="w-full max-w-[900px] mx-auto text-center text-[9px] text-gray-600 tracking-[0.3em] uppercase py-4 border-t border-[#1c1c1c] bg-[#0d0d0d] rounded-b-lg">
            ♦ PROYECTO DESARROLLADO POR MANUEL ROSALES YAPIAS © 2026 ♦
        </footer>

    </body>
</html>