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

                        <% if (request.getAttribute("error") != null) {%>
                        <div class="bg-red-950/40 border border-[var(--rojo-poker)] p-3 rounded text-xs text-red-300 font-mono">
                            ⚠ Error: <%= request.getAttribute("error")%>
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
                        <% }%>
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

                    <div class="space-y-4">

                        <!-- Método 1: inyectarResultados() -->
                        <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                            <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-sky-400 overflow-x-auto border-l-2 border-sky-500">
                                <pre><code>private void inyectarResultados(
    HttpServletRequest request, 
    S2E1Model modelo
) {
    request.setAttribute("importeCompra", 
        modelo.calcularImporteCompra()
    );
    request.setAttribute("importeDescuento", 
        modelo.calcularDescuento()
    );
    request.setAttribute("importePagar", 
        modelo.calcularImportePagar()
    );
    request.setAttribute("caramelos", 
        modelo.calcularCaramelosObsequio()
    );
}</code></pre>
                            </div>
                            <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                <span class="text-[10px] text-sky-400 tracking-wider mb-1 uppercase font-bold">🧬 CONTROLADOR // SERVLET</span>
                                <h5 class="text-white font-bold mb-2 text-sm">Método: inyectarResultados()</h5>
                                <p class="text-gray-400 leading-relaxed">
                                    Encargado <span class="text-[var(--dorado)]">únicamente</span> de colocar en el Request Scope los datos procesados del modelo: importe de compra, descuento aplicado, pago neto y caramelos otorgados.
                                </p>
                            </div>
                        </div>

                        <!-- Método 2: despacharVista() -->
                        <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                            <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-purple-400 overflow-x-auto border-l-2 border-purple-500">
                                <pre><code>private void despacharVista(
    HttpServletRequest request, 
    HttpServletResponse response
) throws ServletException, IOException {
    request.getRequestDispatcher(
        "/html/semana02/S2E1.jsp"
    ).forward(request, response);
}</code></pre>
                            </div>
                            <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                <span class="text-[10px] text-purple-400 tracking-wider mb-1 uppercase font-bold">🚀 CONTROLADOR // NAVEGACIÓN</span>
                                <h5 class="text-white font-bold mb-2 text-sm">Método: despacharVista()</h5>
                                <p class="text-gray-400 leading-relaxed">
                                    Tiene la <span class="text-[var(--dorado)]">función exclusiva</span> de delegar el flujo de ejecución reenviando la petición hacia la vista JSP correspondiente a la Semana 2.
                                </p>
                            </div>
                        </div>

                        <!-- Método 3: calcularImporteCompra() -->
                        <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                            <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-[var(--dorado)] overflow-x-auto border-l-2 border-[var(--dorado)]">
                                <pre><code>public double calcularImporteCompra() {
    return this.precio * this.cantidad;
}</code></pre>
                            </div>
                            <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                <span class="text-[10px] text-[var(--dorado)] tracking-wider mb-1 uppercase font-bold">🧮 MODELO // NEGOCIO</span>
                                <h5 class="text-white font-bold mb-2 text-sm">Método: calcularImporteCompra()</h5>
                                <p class="text-gray-400 leading-relaxed">
                                    Calcula con <span class="text-[var(--dorado)]">responsabilidad única</span> el subtotal bruto de la compra multiplicando el precio unitario por la cantidad adquirida.
                                </p>
                            </div>
                        </div>

                        <!-- Método 4: calcularDescuento() -->
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
                                    Tiene la <span class="text-[var(--dorado)]">única tarea</span> de obtener el deducción equivalente al **11%** sobre el importe base de la compra.
                                </p>
                            </div>
                        </div>

                        <!-- Método 5: calcularImportePagar() -->
                        <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                            <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-[var(--dorado)] overflow-x-auto border-l-2 border-[var(--dorado)]">
                                <pre><code>public double calcularImportePagar() {
    return calcularImporteCompra() 
            - calcularDescuento();
}</code></pre>
                            </div>
                            <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                <span class="text-[10px] text-[var(--dorado)] tracking-wider mb-1 uppercase font-bold">🧮 MODELO // NEGOCIO</span>
                                <h5 class="text-white font-bold mb-2 text-sm">Método: calcularImportePagar()</h5>
                                <p class="text-gray-400 leading-relaxed">
                                    Determina con <span class="text-[var(--dorado)]">responsabilidad exclusiva</span> el monto final neto a pagar restando el descuento al subtotal original.
                                </p>
                            </div>
                        </div>

                        <!-- Método 6: calcularCaramelosObsequio() -->
                        <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                            <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-[var(--dorado)] overflow-x-auto border-l-2 border-[var(--dorado)]">
                                <pre><code>public int calcularCaramelosObsequio() {
    return this.cantidad * 2;
}</code></pre>
                            </div>
                            <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                <span class="text-[10px] text-[var(--dorado)] tracking-wider mb-1 uppercase font-bold">🧮 MODELO // NEGOCIO</span>
                                <h5 class="text-white font-bold mb-2 text-sm">Método: calcularCaramelosObsequio()</h5>
                                <p class="text-gray-400 leading-relaxed">
                                    Su <span class="text-[var(--dorado)]">única tarea</span> es calcular las unidades de premio asignando **2 caramelos** por cada producto comprado.
                                </p>
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