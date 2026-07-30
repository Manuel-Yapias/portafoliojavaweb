<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.folderrosalesd3.model.semana05.S5E3Model" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>S5E3 - Análisis de Dígitos de un Entero</title>
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
                <span class="text-2xl text-emerald-500">♠️</span>
                <div>
                    <h1 class="text-lg font-bold tracking-widest text-[var(--dorado)] uppercase">MESA S5E3</h1>
                    <p class="text-[10px] text-zinc-400 font-mono">DESCOMPOSICIÓN POLINÓMICA E ITERACIONES</p>
                </div>
            </div>
            <a href="${pageContext.request.contextPath}/index.jsp" 
               class="text-xs font-mono px-4 py-2 border border-emerald-900 bg-zinc-950/60 hover:border-[var(--dorado)] hover:text-[var(--dorado)] transition-all rounded">
                Volver al Deck Principal
            </a>
        </header>

        <main class="max-w-5xl w-full mx-auto grid grid-cols-1 md:grid-cols-12 gap-6 items-start my-auto">

            <section class="md:col-span-5 bg-zinc-950/90 border border-emerald-950 p-6 rounded-xl shadow-2xl relative overflow-hidden">
                <div class="absolute top-0 right-0 w-32 h-32 bg-emerald-500/5 rounded-full blur-3xl"></div>

                <h2 class="text-xl font-extrabold text-[var(--dorado)] tracking-wide mb-2 uppercase">ANALIZAR CIFRA</h2>
                <p class="text-xs text-zinc-400 mb-6">Ingresa cualquier número entero para descomponerlo en sus dígitos fundamentales, sumando pares e impares por separado.</p>

                <% if (request.getAttribute("error") != null) {%>
                <div class="mb-4 p-3.5 bg-red-950/30 border border-[var(--rojo-poker)] text-[var(--rojo-poker)] rounded text-xs font-mono flex items-center space-x-2">
                    <span>⚠️</span>
                    <span><%= request.getAttribute("error")%></span>
                </div>
                <% } %>

                <form action="${pageContext.request.contextPath}/S5E3Controller" method="POST" class="space-y-4 font-mono">
                    <div>
                        <label class="block text-[11px] text-zinc-400 uppercase tracking-widest mb-1.5 font-bold">NÚMERO ENTERO</label>
                        <input type="number" name="numero" required placeholder="Ej: 450812"
                               class="w-full bg-[#050505] border border-emerald-950 focus:border-[var(--dorado)] text-white text-sm px-4 py-3 rounded outline-none transition-all focus:ring-1 focus:ring-[var(--dorado)]">
                        <span class="text-[9px] text-zinc-500 mt-1.5 block">Se admite desestructuración de valores negativos y ceros.</span>
                    </div>

                    <button type="submit" 
                            class="w-full py-3.5 mt-2 bg-gradient-to-r from-emerald-700 to-emerald-500 hover:from-emerald-600 hover:to-emerald-400 text-white text-xs uppercase tracking-widest font-black rounded-lg transition-all shadow-lg shadow-emerald-950/40">
                        ♦️ Revelar Mano
                    </button>
                </form>
            </section>

            <section class="md:col-span-7 flex flex-col h-full justify-between">
                <%
                    S5E3Model resultado = (S5E3Model) request.getAttribute("resultado");
                    if (resultado == null) {
                %>
                <div class="h-full min-h-[310px] bg-zinc-950/25 border-2 border-dashed border-emerald-950 rounded-xl flex flex-col items-center justify-center p-8 text-center">
                    <span class="text-4xl mb-4 opacity-40">♠️</span>
                    <h3 class="text-sm font-bold text-zinc-400 uppercase tracking-widest">Esperando Fichas</h3>
                    <p class="text-xs text-zinc-500 max-w-xs mt-2">Coloque un número entero en el panel izquierdo para calcular el peso de sus dígitos pares e impares.</p>
                </div>
                <% } else {%>
                <div class="bg-zinc-950/90 border border-emerald-900 p-6 rounded-xl shadow-2xl space-y-6">

                    <div>
                        <span class="text-[10px] text-zinc-500 font-mono block uppercase">NÚMERO EVALUADO</span>
                        <h3 class="text-3xl font-black text-white font-mono tracking-wider">
                            <%= resultado.getNumeroOriginal()%>
                        </h3>
                    </div>

                    <div class="grid grid-cols-1 sm:grid-cols-3 gap-4">

                        <div class="bg-zinc-900/60 p-4 border border-zinc-800 rounded-lg">
                            <span class="text-[9px] text-zinc-400 block font-mono uppercase">TOTAL DÍGITOS</span>
                            <span class="text-2xl font-black text-blue-400 font-mono">
                                <%= resultado.getCantidadDigitos()%>
                            </span>
                        </div>

                        <div class="bg-zinc-900/60 p-4 border border-zinc-800 rounded-lg border-l-2 border-l-[var(--dorado)]">
                            <span class="text-[9px] text-[var(--dorado)] block font-mono uppercase">SUMA PARES (con 0)</span>
                            <span class="text-2xl font-black text-[var(--dorado)] font-mono">
                                <%= resultado.getSumaPares()%>
                            </span>
                        </div>

                        <div class="bg-zinc-900/60 p-4 border border-zinc-800 rounded-lg border-l-2 border-l-[var(--rojo-poker)]">
                            <span class="text-[9px] text-[var(--rojo-poker)] block font-mono uppercase">SUMA IMPARES</span>
                            <span class="text-2xl font-black text-[var(--rojo-poker)] font-mono">
                                <%= resultado.getSumaImpares()%>
                            </span>
                        </div>

                    </div>

                    <div class="border-t border-emerald-950/60 pt-5">
                        <h4 class="text-[11px] font-bold text-zinc-400 uppercase tracking-widest font-mono mb-3">
                            Análisis Visual de los Dígitos
                        </h4>
                        <div class="flex flex-wrap gap-2.5">
                            <%
                                String numStr = String.valueOf(Math.abs(resultado.getNumeroOriginal()));
                                for (int i = 0; i < numStr.length(); i++) {
                                    char dChar = numStr.charAt(i);
                                    int d = Character.getNumericValue(dChar);
                                    boolean esPar = (d % 2 == 0);
                            %>
                            <div class="w-12 h-12 rounded-full border-2 flex flex-col items-center justify-center font-mono shadow-md transition-transform hover:scale-110 cursor-default
                                 <%= esPar
                                            ? "border-[var(--dorado)] bg-amber-950/20 text-[var(--dorado)]"
                                            : "border-[var(--rojo-poker)] bg-red-950/20 text-[var(--rojo-poker)]"%>">
                                <span class="text-base font-bold"><%= d%></span>
                                <span class="text-[8px] -mt-1"><%= esPar ? "PAR" : "IMP"%></span>
                            </div>
                            <% } %>
                        </div>
                    </div>

                </div>
                <% }%>
            </section>

        </main>
        <div class="border-t border-[#1c1c1c] pt-6">
            <details class="group bg-[#111] rounded-lg border border-[#222] transition-all duration-300 open:border-[var(--dorado)]">
                <summary class="flex justify-between items-center p-4 cursor-pointer select-none hover:bg-[#161616] transition-colors rounded-lg">
                    <span class="text-xs font-mono text-[var(--dorado)] uppercase tracking-widest flex items-center gap-2">
                        <span>📖</span> MANUAL DE USO Y EXPLICACIÓN DE MÉTODOS (MVC)
                    </span>
                    <span class="text-gray-400 group-open:rotate-180 transition-transform duration-200">▼</span>
                </summary>

                <div class="p-6 border-t border-[#222] space-y-6">

                    <!-- Banner Informativo -->
                    <div class="bg-amber-950/20 border-l-4 border-[var(--dorado)] p-4 rounded-r-lg">
                        <h4 class="text-xs font-mono text-[var(--dorado)] font-bold uppercase mb-1">Arquitectura Limpia & Responsabilidad Única</h4>
                        <p class="text-[11px] text-gray-300 font-mono leading-relaxed">
                            Para este proyecto, aplicamos la regla de <span class="text-[var(--dorado)] font-bold">Un Método, Una Única Función</span>. 
                            Cada bloque de código de nuestro controlador y modelo ha sido fragmentado para encargarse exclusivamente de una tarea lógica (capturar, calcular o renderizar), 
                            evitando métodos acoplados y facilitando el mantenimiento.
                        </p>
                    </div>

                    <div class="space-y-4">

                        <!-- Tarjeta 1: Modelo - analizarNumero -->
                        <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                            <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-[var(--dorado)] overflow-x-auto border-l-2 border-[var(--dorado)]">
                                <pre><code>private void analizarNumero() {
    long temp = Math.abs(this.numeroOriginal);
    if (temp == 0) {
        this.cantidadDigitos = 1;
        return;
    }
    while (temp > 0) {
        int digito = (int) (temp % 10);
        this.cantidadDigitos++;
        if (digito % 2 == 0) {
            this.sumaPares += digito;
        } else {
            this.sumaImpares += digito;
        }
        temp /= 10;
    }
}</code></pre>
                            </div>
                            <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                <span class="text-[10px] text-[var(--dorado)] tracking-wider mb-1 uppercase font-bold">🧮 MODELO // NEGOCIO</span>
                                <h5 class="text-white font-bold mb-2 text-sm">Método: analizarNumero()</h5>
                                <p class="text-gray-400 leading-relaxed">
                                    Método con la <span class="text-[var(--dorado)]">única función</span> de descomponer iterativamente un número dígito por dígito mediante divisiones y residuos entre 10, contabilizando la cantidad total de cifras y acumulando de forma independiente la suma de pares e impares.
                                </p>
                            </div>
                        </div>

                        <!-- Tarjeta 2: Modelo - Getters Específicos -->
                        <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                            <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-[var(--dorado)] overflow-x-auto border-l-2 border-[var(--dorado)]">
                                <pre><code>public int getCantidadDigitos() { 
    return cantidadDigitos; 
}
public int getSumaPares() { 
    return sumaPares; 
}
public int getSumaImpares() { 
    return sumaImpares; 
}</code></pre>
                            </div>
                            <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                <span class="text-[10px] text-[var(--dorado)] tracking-wider mb-1 uppercase font-bold">🧮 MODELO // NEGOCIO</span>
                                <h5 class="text-white font-bold mb-2 text-sm">Getters del Análisis</h5>
                                <p class="text-gray-400 leading-relaxed">
                                    Tienen la <span class="text-[var(--dorado)]">única responsabilidad</span> de proveer acceso encapsulado y seguro a cada métrica individual del número (total de dígitos, suma par y suma impar) para ser procesadas de manera independiente en la vista.
                                </p>
                            </div>
                        </div>

                        <!-- Tarjeta 3: Controlador - doPost (Validación y Proceso) -->
                        <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                            <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-sky-400 overflow-x-auto border-l-2 border-sky-500">
                                <pre><code>long numero = Long.parseLong(numeroStr.trim());

S5E3Model analizado = 
    new S5E3Model(numero);

request.setAttribute("resultado", 
    analizado);</code></pre>
                            </div>
                            <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                <span class="text-[10px] text-sky-400 tracking-wider mb-1 uppercase font-bold">🧬 CONTROLADOR // SERVLET</span>
                                <h5 class="text-white font-bold mb-2 text-sm">Procesamiento de Entrada e Inyección</h5>
                                <p class="text-gray-400 leading-relaxed">
                                    Encargado <span class="text-[var(--dorado)]">únicamente</span> de validar la presencia del parámetro, transformarlo a un entero de precisión extendida (<code class="text-sky-300">long</code> de hasta 19 dígitos) e inyectar el objeto modelo analizado en el ámbito del request HTTP.
                                </p>
                            </div>
                        </div>

                    </div>

                    <div class="text-center pt-2 border-t border-[#222]">
                        <p class="text-[10px] text-gray-500 font-mono">
                            * El flujo termina delegando la visualización dinámica a las etiquetas Expression Language (EL) en este archivo JSP.
                        </p>
                    </div>

                </div>
            </details>
        </div>
        <footer class="max-w-5xl w-full mx-auto text-center border-t border-emerald-950/60 pt-4 mt-6">
            <p class="text-[10px] text-zinc-500 font-mono tracking-widest uppercase">
                S5E3 - ALGORITMO ITERATIVO DE DESCOMPOSICIÓN NUMÉRICA • CASINO INTELIGENTE
            </p>
        </footer>

    </body>
</html>