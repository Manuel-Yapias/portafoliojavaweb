<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>S3E3 - Cálculo de Planilla Mensual</title>
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
                    <p class="text-[10px] text-[var(--dorado)] tracking-widest font-mono uppercase">Semana 3 - Ejercicio 3</p>
                </div>
            </div>
            <a href="${pageContext.request.contextPath}/index.jsp" class="px-4 py-2 bg-[#141414] border border-[#222] rounded text-xs font-mono text-gray-400 hover:text-[var(--dorado)] hover:border-[var(--dorado)] transition-all">
                ↩ Volver al Deck
            </a>
        </header>

        <main class="w-full max-w-[900px] mx-auto bg-[#0d0d0d] border-x border-[#1c1c1c] p-6 md:p-8 space-y-8">

            <div class="bg-[#111] p-4 rounded-lg border border-[#222]">
                <h2 class="text-xs font-mono text-[var(--dorado)] uppercase tracking-wider mb-2">📋 Enunciado del Ejercicio (Planilla con Bonificación)</h2>
                <p class="text-sm text-gray-300 leading-relaxed">
                    Diseñe un algoritmo que calcule el <strong>sueldo básico</strong> a partir de las horas trabajadas y la tarifa, asigne una <strong>bonificación del 20%</strong>, determine el <strong>sueldo bruto</strong>, aplique un <strong>descuento único del 10%</strong> y muestre el <strong>sueldo neto</strong> resultante.
                </p>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                
                <form action="${pageContext.request.contextPath}/S3E3Controller" method="POST" class="space-y-4">
                    <h3 class="text-sm font-mono text-white uppercase tracking-widest border-b border-[#222] pb-2">🎰 Declaración de Horas</h3>

                    <div>
                        <label for="horas" class="block text-xs font-mono text-gray-400 mb-1">Horas Trabajadas:</label>
                        <input type="number" step="any" id="horas" name="horas" required 
                               value="${not empty horas ? horas : ''}"
                               class="w-full bg-[#141414] border border-[#222] rounded p-2.5 text-sm text-white focus:outline-none focus:border-[var(--dorado)] transition-colors"
                               placeholder="Ej. 160">
                    </div>

                    <div>
                        <label for="tarifa" class="block text-xs font-mono text-gray-400 mb-1">Tarifa Horaria del Colaborador (S/.):</label>
                        <input type="number" step="any" id="tarifa" name="tarifa" required 
                               value="${not empty tarifa ? tarifa : ''}"
                               class="w-full bg-[#141414] border border-[#222] rounded p-2.5 text-sm text-white focus:outline-none focus:border-[var(--dorado)] transition-colors"
                               placeholder="Ej. 25.50">
                    </div>

                    <button type="submit" class="w-full py-3 bg-[#111] border border-[var(--dorado-apagado)] rounded text-xs font-mono font-bold text-[var(--dorado)] uppercase tracking-widest hover:bg-[var(--dorado)] hover:text-black transition-all shadow-[0_0_15px_rgba(255,204,0,0.05)]">
                        Calcular Nómina 🎴
                    </button>
                </form>

                <div class="bg-[#121212] border border-[#222] rounded-lg p-6 flex flex-col justify-between">
                    <div>
                        <h3 class="text-sm font-mono text-white uppercase tracking-widest border-b border-[#222] pb-2 mb-4">🏆 Detalle de Haberes</h3>

                        <% if (request.getAttribute("error") != null) { %>
                        <div class="bg-red-950/40 border border-[var(--rojo-poker)] p-3 rounded text-xs text-red-300 font-mono">
                            ⚠ Error: <%= request.getAttribute("error") %>
                        </div>
                        <% } else if (request.getAttribute("sueldoNeto") != null) { %>
                        <div class="space-y-3 font-mono">
                            <div class="flex justify-between items-center py-2 border-b border-[#1c1c1c]">
                                <span class="text-xs text-gray-400">Total horas:</span>
                                <span class="text-sm text-white">${horas} hrs</span>
                            </div>
                            <div class="flex justify-between items-center py-2 border-b border-[#1c1c1c]">
                                <span class="text-xs text-gray-400">Tarifa por Hora:</span>
                                <span class="text-sm text-white">S/. ${tarifa}</span>
                            </div>
                            <div class="flex justify-between items-center py-2 border-b border-[#1c1c1c] text-amber-400">
                                <span class="text-xs">Sueldo Básico:</span>
                                <span class="text-sm">S/. ${sueldoBasico}</span>
                            </div>
                            <div class="flex justify-between items-center py-2 border-b border-[#1c1c1c] text-emerald-400">
                                <span class="text-xs">🎁 Bonificación (20%):</span>
                                <span class="text-sm">+ S/. ${bonificacion}</span>
                            </div>
                            <div class="flex justify-between items-center py-2 border-b border-[#1c1c1c] text-sky-400">
                                <span class="text-xs">Sueldo Bruto:</span>
                                <span class="text-sm">S/. ${sueldoBruto}</span>
                            </div>
                            <div class="flex justify-between items-center py-2 border-b border-[#1c1c1c] text-red-400">
                                <span class="text-xs">📉 Retención (10%):</span>
                                <span class="text-sm">- S/. ${descuento}</span>
                            </div>
                            <div class="flex justify-between items-center py-2 pt-4">
                                <span class="text-xs text-[var(--dorado)] font-bold">Neto Efectivo a Cobrar:</span>
                                <span class="text-lg font-bold text-[var(--dorado)]">S/. ${sueldoNeto}</span>
                            </div>
                        </div>
                        <% } else { %>
                        <p class="text-xs text-gray-500 font-mono italic text-center py-12">Por favor ingrese las horas laboradas y la tarifa correspondiente para desplegar los detalles de la planilla.</p>
                        <% } %>
                    </div>
                </div>
            </div>

            <div class="border-t border-[#1c1c1c] pt-6">
                <details class="group bg-[#111] rounded-lg border border-[#222] transition-all duration-300 open:border-[var(--dorado)]">
                    <summary class="flex justify-between items-center p-4 cursor-pointer select-none hover:bg-[#161616] transition-colors rounded-lg">
                        <span class="text-xs font-mono text-[var(--dorado)] uppercase tracking-widest flex items-center gap-2">
                            <span>📖</span> MANUAL DE USO Y EXPLICACIÓN DE MÉTODOS (S3E3 - MVC)
                        </span>
                        <span class="text-gray-400 group-open:rotate-180 transition-transform duration-200">▼</span>
                    </summary>

                    <div class="p-6 border-t border-[#222] space-y-6">
                        <div class="bg-amber-950/20 border-l-4 border-[var(--dorado)] p-4 rounded-r-lg">
                            <h4 class="text-xs font-mono text-[var(--dorado)] font-bold uppercase mb-1">Encadenamiento de Métodos Salariales</h4>
                            <p class="text-[11px] text-gray-300 font-mono leading-relaxed">
                                El cálculo de haberes se ejecuta de manera secuencial y estructurada dentro del modelo, manteniendo las responsabilidades matemáticas desacopladas del flujo del servlet.
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