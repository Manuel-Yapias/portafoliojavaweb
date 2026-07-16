<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>S1E2 - Área y Longitud de Círculo</title>
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
            <span class="text-[var(--dorado)] text-2xl font-mono">♦</span>
            <div>
                <h1 class="text-xl font-black tracking-wider text-white">PROYECTO 01</h1>
                <p class="text-[10px] text-[var(--dorado)] tracking-widest font-mono uppercase">Semana 1 - Ejercicio 2</p>
            </div>
        </div>
        <a href="${pageContext.request.contextPath}/index.jsp" class="px-4 py-2 bg-[#141414] border border-[#222] rounded text-xs font-mono text-gray-400 hover:text-[var(--dorado)] hover:border-[var(--dorado)] transition-all">
            ↩ Volver al Deck
        </a>
    </header>

    <main class="w-full max-w-[900px] mx-auto bg-[#0d0d0d] border-x border-[#1c1c1c] p-6 md:p-8 space-y-8">
        
        <div class="bg-[#111] p-4 rounded-lg border border-[#222]">
            <h2 class="text-xs font-mono text-[var(--dorado)] uppercase tracking-wider mb-2">📋 Enunciado del Ejercicio</h2>
            <p class="text-sm text-gray-300 leading-relaxed">
                Diseñe un programa que determine el área de un círculo (A) y la longitud de su circunferencia (C) conociendo su radio (r).
            </p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
            <form action="${pageContext.request.contextPath}/S1E2Controller" method="POST" class="space-y-4">
                <h3 class="text-sm font-mono text-white uppercase tracking-widest border-b border-[#222] pb-2">🎰 Ingreso de Datos</h3>
                
                <div>
                    <label for="radio" class="block text-xs font-mono text-gray-400 mb-1">Radio del Círculo (r):</label>
                    <input type="number" step="any" id="radio" name="radio" required 
                           value="${not empty radio ? radio : ''}"
                           class="w-full bg-[#141414] border border-[#222] rounded p-2.5 text-sm text-white focus:outline-none focus:border-[var(--dorado)] transition-colors">
                </div>

                <button type="submit" class="w-full py-3 bg-[#111] border border-[var(--dorado-apagado)] rounded text-xs font-mono font-bold text-[var(--dorado)] uppercase tracking-widest hover:bg-[var(--dorado)] hover:text-black transition-all">
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
                    <% } else if (request.getAttribute("area") != null) { %>
                        <div class="space-y-4 font-mono">
                            <div class="flex justify-between items-center py-2 border-b border-[#1c1c1c]">
                                <span class="text-xs text-gray-400">Radio procesado:</span>
                                <span class="text-sm text-white">${radio} u</span>
                            </div>
                            <div class="flex justify-between items-center py-2 border-b border-[#1c1c1c]">
                                <span class="text-xs text-[var(--dorado)]">Área (A):</span>
                                <span class="text-lg font-bold text-[var(--dorado)]">${area} u²</span>
                            </div>
                            <div class="flex justify-between items-center py-2">
                                <span class="text-xs text-[var(--dorado)]">Longitud (C):</span>
                                <span class="text-lg font-bold text-[var(--dorado)]">${longitud} u</span>
                            </div>
                        </div>
                    <% } else { %>
                        <p class="text-xs text-gray-500 font-mono italic text-center py-12">Inserta el radio y haz clic en calcular para ver los resultados.</p>
                    <% } %>
                </div>
            </div>
        </div>

        <div class="border-t border-[#1c1c1c] pt-6">
            <details class="group bg-[#111] rounded-lg border border-[#222] transition-all duration-300 open:border-[var(--dorado)]">
                <summary class="flex justify-between items-center p-4 cursor-pointer select-none hover:bg-[#161616] transition-colors rounded-lg">
                    <span class="text-xs font-mono text-[var(--dorado)] uppercase tracking-widest flex items-center gap-2">
                        <span>📖</span> MANUAL DE USO Y EXPLICACIÓN DE MÉTODOS (MVC)
                    </span>
                    <span class="text-gray-400 group-open:rotate-180 transition-transform duration-200">▼</span>
                </summary>
                
                <div class="p-6 border-t border-[#222] space-y-6">
                    
                    <div class="bg-amber-950/20 border-l-4 border-[var(--dorado)] p-4 rounded-r-lg">
                        <h4 class="text-xs font-mono text-[var(--dorado)] font-bold uppercase mb-1">Cálculos Seguros y Responsabilidad Singular</h4>
                        <p class="text-[11px] text-gray-300 font-mono leading-relaxed">
                            Bajo nuestra arquitectura estricta, la recopilación de datos, el cálculo de las ecuaciones geométricas de circunferencia y la entrega de los resultados se dividen de manera hermética.
                        </p>
                    </div>

                    <div class="space-y-4">
                        
                        <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                            <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-emerald-400 overflow-x-auto border-l-2 border-emerald-500">
<pre><code>private S1E2Model extraerParametros(
    HttpServletRequest request
) {
    double r = Double.parseDouble(
        request.getParameter("radio")
    );
    return new S1E2Model(r);
}</code></pre>
                            </div>
                            <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                <span class="text-[10px] text-emerald-400 tracking-wider mb-1 uppercase font-bold">🛠️ CONTROLADOR // SERVLET</span>
                                <h5 class="text-white font-bold mb-2 text-sm">Método: extraerParametros()</h5>
                                <p class="text-gray-400 leading-relaxed">
                                    Este método lee y valida que el radio de entrada sea numérico para instanciar el modelo de datos.
                                </p>
                            </div>
                        </div>

                        <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                            <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-[var(--dorado)] overflow-x-auto border-l-2 border-[var(--dorado)]">
<pre><code>public double calcularArea() {
    return PI * Math.pow(radio, 2);
}</code></pre>
                            </div>
                            <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                <span class="text-[10px] text-[var(--dorado)] tracking-wider mb-1 uppercase font-bold">🧮 MODELO // NEGOCIO</span>
                                <h5 class="text-white font-bold mb-2 text-sm">Método: calcularArea()</h5>
                                <p class="text-gray-400 leading-relaxed">
                                    Calcula la superficie del círculo aplicando de forma estricta la fórmula $A = \pi \cdot r^2$.
                                </p>
                            </div>
                        </div>

                    </div>

                </div>
            </details>
        </div>

    </main>

    <footer class="w-full max-w-[900px] mx-auto text-center text-[9px] text-gray-600 tracking-[0.3em] uppercase py-4 border-t border-[#1c1c1c] bg-[#0d0d0d] rounded-b-lg">
        ♦ PROYECTO 01 DESARROLLADO POR MANUEL ROSALES YAPIAS © 2026 ♦
    </footer>

</body>
</html>