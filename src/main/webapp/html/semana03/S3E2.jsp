<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>S3E2 - Descuento Sucesivo 10% + 10%</title>
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
                    <h1 class="text-xl font-black tracking-wider text-white">PROYECTO S3</h1>
                    <p class="text-[10px] text-[var(--dorado)] tracking-widest font-mono uppercase">Semana 3 - Ejercicio 2</p>
                </div>
            </div>
            <a href="${pageContext.request.contextPath}/index.jsp" class="px-4 py-2 bg-[#141414] border border-[#222] rounded text-xs font-mono text-gray-400 hover:text-[var(--dorado)] hover:border-[var(--dorado)] transition-all">
                ↩ Volver al Deck
            </a>
        </header>

        <main class="w-full max-w-[900px] mx-auto bg-[#0d0d0d] border-x border-[#1c1c1c] p-6 md:p-8 space-y-8">

            <div class="bg-[#111] p-4 rounded-lg border border-[#222]">
                <h2 class="text-xs font-mono text-[var(--dorado)] uppercase tracking-wider mb-2">📋 Enunciado del Ejercicio (Descuentos Sucesivos)</h2>
                <p class="text-sm text-gray-300 leading-relaxed">
                    Determine el <strong>importe total de la compra</strong> y aplique un esquema de <strong>descuento sucesivo del 10% + 10%</strong>. El primer descuento se aplica al total, y el segundo descuento sobre el saldo restante.
                </p>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                
                <form action="${pageContext.request.contextPath}/S3E2Controller" method="POST" class="space-y-4">
                    <h3 class="text-sm font-mono text-white uppercase tracking-widest border-b border-[#222] pb-2">🎰 Ingreso de Valores</h3>

                    <div>
                        <label for="precio" class="block text-xs font-mono text-gray-400 mb-1">Precio del Producto (S/.):</label>
                        <input type="number" step="any" id="precio" name="precio" required 
                               value="${not empty precio ? precio : ''}"
                               class="w-full bg-[#141414] border border-[#222] rounded p-2.5 text-sm text-white focus:outline-none focus:border-[var(--dorado)] transition-colors"
                               placeholder="Ej. 80.00">
                    </div>

                    <div>
                        <label for="cantidad" class="block text-xs font-mono text-gray-400 mb-1">Cantidad de Unidades:</label>
                        <input type="number" id="cantidad" name="cantidad" required 
                               value="${not empty cantidad ? cantidad : ''}"
                               class="w-full bg-[#141414] border border-[#222] rounded p-2.5 text-sm text-white focus:outline-none focus:border-[var(--dorado)] transition-colors"
                               placeholder="Ej. 5">
                    </div>

                    <button type="submit" class="w-full py-3 bg-[#111] border border-[var(--dorado-apagado)] rounded text-xs font-mono font-bold text-[var(--dorado)] uppercase tracking-widest hover:bg-[var(--dorado)] hover:text-black transition-all shadow-[0_0_15px_rgba(255,204,0,0.05)]">
                        Calcular Descuentos 🎴
                    </button>
                </form>

                <div class="bg-[#121212] border border-[#222] rounded-lg p-6 flex flex-col justify-between">
                    <div>
                        <h3 class="text-sm font-mono text-white uppercase tracking-widest border-b border-[#222] pb-2 mb-4">🏆 Boleta Comercial</h3>

                        <% if (request.getAttribute("error") != null) { %>
                        <div class="bg-red-950/40 border border-[var(--rojo-poker)] p-3 rounded text-xs text-red-300 font-mono">
                            ⚠ Error: <%= request.getAttribute("error") %>
                        </div>
                        <% } else if (request.getAttribute("importeAPagar") != null) { %>
                        <div class="space-y-3 font-mono">
                            <div class="flex justify-between items-center py-2 border-b border-[#1c1c1c]">
                                <span class="text-xs text-gray-400">Precio Unitario:</span>
                                <span class="text-sm text-white">S/. ${precio}</span>
                            </div>
                            <div class="flex justify-between items-center py-2 border-b border-[#1c1c1c]">
                                <span class="text-xs text-gray-400">Cantidad:</span>
                                <span class="text-sm text-white">${cantidad} unidades</span>
                            </div>
                            <div class="flex justify-between items-center py-2 border-b border-[#1c1c1c] text-amber-400">
                                <span class="text-xs">Importe Compra:</span>
                                <span class="text-sm">S/. ${importeCompra}</span>
                            </div>
                            <div class="flex justify-between items-center py-2 border-b border-[#1c1c1c] text-red-400">
                                <span class="text-xs">Primer Descuento (10%):</span>
                                <span class="text-sm">- S/. ${primerDescuento}</span>
                            </div>
                            <div class="flex justify-between items-center py-2 border-b border-[#1c1c1c] text-red-400">
                                <span class="text-xs">Segundo Descuento (10%):</span>
                                <span class="text-sm">- S/. ${segundoDescuento}</span>
                            </div>
                            <div class="flex justify-between items-center py-2 border-b border-[#1c1c1c] text-red-300">
                                <span class="text-xs font-bold">Descuento Total Sucesivo:</span>
                                <span class="text-sm font-bold">- S/. ${descuentoTotal}</span>
                            </div>
                            <div class="flex justify-between items-center py-2 pt-4">
                                <span class="text-xs text-[var(--dorado)] font-bold">Importe Neto a Pagar:</span>
                                <span class="text-lg font-bold text-[var(--dorado)]">S/. ${importeAPagar}</span>
                            </div>
                        </div>
                        <% } else { %>
                        <p class="text-xs text-gray-500 font-mono italic text-center py-12">Ingrese precio y cantidad para observar la aplicación encadenada de descuentos.</p>
                        <% } %>
                    </div>
                </div>
            </div>

            <div class="border-t border-[#1c1c1c] pt-6">
                <details class="group bg-[#111] rounded-lg border border-[#222] transition-all duration-300 open:border-[var(--dorado)]">
                    <summary class="flex justify-between items-center p-4 cursor-pointer select-none hover:bg-[#161616] transition-colors rounded-lg">
                        <span class="text-xs font-mono text-[var(--dorado)] uppercase tracking-widest flex items-center gap-2">
                            <span>📖</span> MANUAL DE USO Y EXPLICACIÓN DE MÉTODOS (S3E2 - MVC)
                        </span>
                        <span class="text-gray-400 group-open:rotate-180 transition-transform duration-200">▼</span>
                    </summary>

                    <div class="p-6 border-t border-[#222] space-y-6">
                        <div class="bg-amber-950/20 border-l-4 border-[var(--dorado)] p-4 rounded-r-lg">
                            <h4 class="text-xs font-mono text-[var(--dorado)] font-bold uppercase mb-1">Cálculo en Cascada</h4>
                            <p class="text-[11px] text-gray-300 font-mono leading-relaxed">
                                El segundo descuento del $10\%$ no se calcula sobre el total original, sino sobre la diferencia remanente posterior al descuento inicial. El modelo gestiona este orden secuencial de forma interna.
                            </p>
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