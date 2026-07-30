<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.folderrosalesd3.model.semana09.S9E1Model" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Casino Business - Calculadora de Descuentos</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <style>
            :root {
                --dorado: #ffcc00;
                --fondo: #0a0a0a;
            }
            body {
                background-color: var(--fondo);
                color: #ffffff;
            }
        </style>
    </head>
    <body class="min-h-screen flex flex-col items-center justify-center p-6">
        <header class="max-w-4xl mx-auto w-full text-center my-6">
            <h1 class="text-4xl font-extrabold tracking-wider text-gold uppercase border-b-2 border-gold pb-4 inline-block">
                ♠ CASINO VAULT - VENTA DE PRODUCTOS Y BONIFICACIONES ♣
            </h1>
            <p class="text-gray-400 mt-2 text-sm">Semana 9 - Ejercicio 1 (Cálculo de Importes, Descuentos por Docena y Obsequios)</p>
            <a href="${pageContext.request.contextPath}/index.jsp" 
               class="text-xs font-mono px-4 py-2 border border-zinc-800 bg-zinc-950/60 hover:border-[var(--dorado)] hover:text-[var(--dorado)] transition-all rounded">
                Volver al Deck Principal
            </a>
        </header>
        <div class="max-w-md w-full bg-neutral-900 p-8 rounded-2xl border border-neutral-800 shadow-2xl">
            <h1 class="text-2xl font-bold text-[var(--dorado)] mb-6 text-center uppercase tracking-widest">
                ♦ Sistema de Ventas S9 ♣
            </h1>

            <form action="${pageContext.request.contextPath}/S9E1Controller" method="POST" class="space-y-4">
                <div>
                    <label class="block text-[10px] text-gray-400 uppercase">Docenas Adquiridas:</label>
                    <input type="number" name="docenas" required class="w-full bg-black border border-neutral-700 rounded p-2 text-white">
                </div>
                <div>
                    <label class="block text-[10px] text-gray-400 uppercase">Precio por Docena:</label>
                    <input type="number" step="0.01" name="precio" required class="w-full bg-black border border-neutral-700 rounded p-2 text-white">
                </div>
                <button type="submit" class="w-full bg-[var(--dorado)] text-black font-bold py-2 rounded hover:opacity-90 transition-all uppercase text-xs">
                    Calcular Operación
                </button>
            </form>

            <%
                S9E1Model res = (S9E1Model) request.getAttribute("resultado");
                if (res != null) {
            %>
            <div class="mt-8 space-y-3 border-t border-neutral-800 pt-6">
                <div class="flex justify-between text-sm">
                    <span class="text-gray-500">Importe Compra:</span>
                    <span>$<%= String.format("%.2f", res.getImporteCompra())%></span>
                </div>
                <div class="flex justify-between text-sm">
                    <span class="text-gray-500">Descuento:</span>
                    <span class="text-red-400">-$<%= String.format("%.2f", res.getDescuento())%></span>
                </div>
                <div class="flex justify-between font-bold text-[var(--dorado)] border-t border-neutral-800 pt-2">
                    <span>Importe a Pagar:</span>
                    <span>$<%= String.format("%.2f", res.getImportePagar())%></span>
                </div>
                <div class="bg-neutral-800 p-3 rounded text-center mt-4">
                    <span class="text-[10px] uppercase text-gray-400">Obsequio de la Casa:</span>
                    <p class="text-lg font-bold text-emerald-400"><%= res.getLapicerosObsequio()%> Lapiceros</p>
                </div>
            </div>
            <% }%>
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

                        <!-- Tarjeta 1: Modelo - calcular (Lógica Comercial) -->
                        <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                            <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-[var(--dorado)] overflow-x-auto border-l-2 border-[var(--dorado)]">
                                <pre><code>private void calcular() {
    this.importeCompra = 
        this.docenas * this.precioDocena;
    
    // Regla de descuento
    double tasaDescuento = 
        (this.docenas >= 10) ? 0.20 : 0.10;
    this.descuento = 
        this.importeCompra * tasaDescuento;
    this.importePagar = 
        this.importeCompra - this.descuento;
    
    // Regla de obsequio
    this.lapicerosObsequio = 
        (this.importePagar >= 200) ? (2 * this.docenas) : 0;
}</code></pre>
                            </div>
                            <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                <span class="text-[10px] text-[var(--dorado)] tracking-wider mb-1 uppercase font-bold">🧮 MODELO // NEGOCIO</span>
                                <h5 class="text-white font-bold mb-2 text-sm">Método: calcular()</h5>
                                <p class="text-gray-400 leading-relaxed">
                                    Tiene la <span class="text-[var(--dorado)]">única función</span> de encapsular la lógica comercial de la transacción: evalúa si corresponde un 20% o 10% de descuento por volumen de docenas y calcula la bonificación de 2 lapiceros por docena vendida si el pago total supera S/. 200.
                                </p>
                            </div>
                        </div>

                        <!-- Tarjeta 2: Controlador - doPost (Procesamiento Comercial) -->
                        <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                            <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-sky-400 overflow-x-auto border-l-2 border-sky-500">
                                <pre><code>int docenas = 
    Integer.parseInt(request.getParameter("docenas"));
double precio = 
    Double.parseDouble(request.getParameter("precio"));

S9E1Model calculo = 
    new S9E1Model(docenas, precio);
    
request.setAttribute("resultado", calculo);</code></pre>
                            </div>
                            <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                <span class="text-[10px] text-sky-400 tracking-wider mb-1 uppercase font-bold">🧬 CONTROLADOR // SERVLET</span>
                                <h5 class="text-white font-bold mb-2 text-sm">Captura e Inyección del Cálculo</h5>
                                <p class="text-gray-400 leading-relaxed">
                                    Encargado <span class="text-[var(--dorado)]">únicamente</span> de receptar la cantidad de docenas y el precio por unidad, validar el tipo de dato numérico, instanciar la transacción comercial en el modelo y enviarla al JSP para su despliegue.
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
    </body>
</html>