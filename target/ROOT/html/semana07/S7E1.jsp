<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Casino VIP - Enmascarador de Tarjetas</title>
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
            .border-gold {
                border-color: var(--dorado);
            }
            .text-gold {
                color: var(--dorado);
            }
            .bg-gold-hover:hover {
                background-color: var(--dorado-apagado);
            }
            .text-poker {
                color: var(--rojo-poker);
            }
        </style>
    </head>
    <body class="min-h-screen flex flex-col justify-between p-4 md:p-8">

        <header class="max-w-4xl mx-auto w-full text-center my-6">
            <h1 class="text-4xl font-extrabold tracking-wider text-gold uppercase border-b-2 border-gold pb-4 inline-block">
                ♠ CASINO VAULT - CARD ENCRYPTOR ♣
            </h1>
            <p class="text-gray-400 mt-2 text-sm">Semana 7 - Ejercicio 1 (Métodos String: substring() y repeat())</p>
            <a href="${pageContext.request.contextPath}/index.jsp" 
               class="text-xs font-mono px-4 py-2 border border-zinc-800 bg-zinc-950/60 hover:border-[var(--dorado)] hover:text-[var(--dorado)] transition-all rounded">
                Volver al Deck Principal
            </a>
        </header>
            
        

        <main class="max-w-md mx-auto w-full bg-neutral-900 bg-opacity-80 p-8 rounded-2xl border border-neutral-800 shadow-2xl">

            <% if (request.getAttribute("error") != null) {%>
            <div class="mb-6 bg-red-950 border-l-4 border-red-500 text-red-200 p-4 rounded text-sm" role="alert">
                <p class="font-bold">Error de Validación</p>
                <p><%= request.getAttribute("error")%></p>
            </div>
            <% } %>

            <form action="${pageContext.request.contextPath}/S7E1Controller" method="POST" class="space-y-6">
                <div>
                    <label for="numeroTarjeta" class="block text-xs font-semibold uppercase tracking-wider text-gold mb-2">
                        Número de Tarjeta de Crédito (16 dígitos):
                    </label>
                    <input type="text" id="numeroTarjeta" name="numeroTarjeta" 
                           placeholder="4509123456784589" 
                           maxlength="19"
                           class="w-full bg-black border border-neutral-700 rounded-lg py-3 px-4 text-white font-mono tracking-widest text-center focus:outline-none focus:border-yellow-400 transition-colors">
                </div>

                <button type="submit" 
                        class="w-full bg-yellow-500 text-black font-bold py-3 px-6 rounded-lg tracking-widest uppercase transition-all duration-200 bg-gold-hover hover:scale-[1.01] shadow-lg">
                    ♦ Enmascarar y Proteger ♦
                </button>
            </form>

            <% if (request.getAttribute("exito") != null) {%>
            <div class="mt-8 space-y-4">
                <div class="bg-neutral-950 p-6 rounded-xl border border-neutral-800 text-center relative overflow-hidden">
                    <div class="absolute top-0 right-0 bg-yellow-500 text-black font-bold text-[9px] px-2 py-0.5 uppercase rounded-bl">
                        Secure SSL
                    </div>
                    <span class="text-[10px] text-neutral-500 block uppercase tracking-widest mb-2">Firma Digital Generada</span>

                    <p class="text-2xl font-mono text-gold tracking-widest my-3">
                        <%= request.getAttribute("tarjetaEnmascarada")%>
                    </p>

                    <div class="flex justify-between items-center text-[10px] text-neutral-400 border-t border-neutral-800 pt-3 mt-3">
                        <span>ESTADO: CIFRADO</span>
                        <span class="text-green-400">PRONTO PARA DEPOSITAR</span>
                    </div>
                </div>
            </div>
            <% }%>

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

                        <!-- Tarjeta 1: Modelo - validarTarjeta -->
                        <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                            <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-[var(--dorado)] overflow-x-auto border-l-2 border-[var(--dorado)]">
                                <pre><code>public boolean validarTarjeta() {
    return numeroTarjeta.matches("^\\d{16}$");
}</code></pre>
                            </div>
                            <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                <span class="text-[10px] text-[var(--dorado)] tracking-wider mb-1 uppercase font-bold">🧮 MODELO // NEGOCIO</span>
                                <h5 class="text-white font-bold mb-2 text-sm">Método: validarTarjeta()</h5>
                                <p class="text-gray-400 leading-relaxed">
                                    Tiene la <span class="text-[var(--dorado)]">única función</span> de verificar que el número ingresado cumpla estrictamente con el estándar numérico de 16 dígitos mediante una expresión regular.
                                </p>
                            </div>
                        </div>

                        <!-- Tarjeta 2: Modelo - enmascarar -->
                        <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                            <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-[var(--dorado)] overflow-x-auto border-l-2 border-[var(--dorado)]">
                                <pre><code>public String enmascarar() {
    String ultimosCuatro = 
        numeroTarjeta.substring(12);
    String asteriscos = "*".repeat(12);
    return asteriscos + ultimosCuatro;
}</code></pre>
                            </div>
                            <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                <span class="text-[10px] text-[var(--dorado)] tracking-wider mb-1 uppercase font-bold">🧮 MODELO // NEGOCIO</span>
                                <h5 class="text-white font-bold mb-2 text-sm">Método: enmascarar()</h5>
                                <p class="text-gray-400 leading-relaxed">
                                    Método con la <span class="text-[var(--dorado)]">única función</span> de proteger los datos sensibles del plástico: extrae los últimos 4 dígitos y antepone 12 asteriscos de enmascaramiento.
                                </p>
                            </div>
                        </div>

                        <!-- Tarjeta 3: Controlador - doPost (Validación y Proceso) -->
                        <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                            <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-sky-400 overflow-x-auto border-l-2 border-sky-500">
                                <pre><code>S7E1Model modelo = new S7E1Model(tarjetaParam);

if (modelo.validarTarjeta()) {
    request.setAttribute("tarjetaOriginal", 
        modelo.getNumeroTarjeta());
    request.setAttribute("tarjetaEnmascarada", 
        modelo.enmascarar());
    request.setAttribute("exito", true);
}</code></pre>
                            </div>
                            <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                <span class="text-[10px] text-sky-400 tracking-wider mb-1 uppercase font-bold">🧬 CONTROLADOR // SERVLET</span>
                                <h5 class="text-white font-bold mb-2 text-sm">Recepción e Inyección del Enmascaramiento</h5>
                                <p class="text-gray-400 leading-relaxed">
                                    Encargado <span class="text-[var(--dorado)]">únicamente</span> de capturar la petición HTTP, verificar la integridad básica del input, solicitar el enmascaramiento al modelo y derivar la respuesta a la vista JSP.
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
        <footer class="text-center py-6 text-xs text-neutral-600">
            &copy; 2026 Casino Deck Controller. Seguridad de Cuentas y Tarjetas.
        </footer>

    </body>
</html>