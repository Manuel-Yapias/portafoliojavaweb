<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.folderrosalesd3.model.semana09.S9E2Model" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Casino Payroll - S9E2</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-black text-white p-8">
        <header class="max-w-4xl mx-auto w-full text-center my-6">
            <h1 class="text-4xl font-extrabold tracking-wider text-gold uppercase border-b-2 border-gold pb-4 inline-block">
                ♠ CASINO VAULT - CÁLCULO DE PLANILLA Y SUELDOS ♣
            </h1>
            <p class="text-gray-400 mt-2 text-sm">Semana 9 - Ejercicio 2 (Sueldo Básico, Bonificación por Hijos y Descuentos)</p>
            <a href="${pageContext.request.contextPath}/index.jsp" 
               class="text-xs font-mono px-4 py-2 border border-zinc-800 bg-zinc-950/60 hover:border-[var(--dorado)] hover:text-[var(--dorado)] transition-all rounded">
                Volver al Deck Principal
            </a>
        </header>
        <div class="max-w-xl mx-auto bg-zinc-900 p-6 rounded-xl border border-zinc-800">
            <h2 class="text-yellow-500 font-bold mb-4">♦ SISTEMA DE PLANILLAS ♣</h2>
            <form action="${pageContext.request.contextPath}/S9E2Controller" method="POST" class="space-y-3">
                <select name="categoria" class="w-full bg-black p-2 border border-zinc-700">
                    <option value="A">Categoría A (S/45.0)</option>
                    <option value="B">Categoría B (S/37.5)</option>
                </select>
                <input type="number" name="horas" placeholder="Horas trabajadas" class="w-full bg-black p-2 border border-zinc-700">
                <input type="number" name="hijos" placeholder="Número de hijos" class="w-full bg-black p-2 border border-zinc-700">
                <button type="submit" class="w-full bg-yellow-600 text-black font-bold p-2">Calcular Sueldo Neto</button>
            </form>

            <%
                S9E2Model p = (S9E2Model) request.getAttribute("planilla");
                if (p != null) {
            %>
            <div class="mt-6 space-y-2 text-sm text-zinc-300">
                <p>Sueldo Básico: S/ <%= String.format("%.2f", p.getSueldoBasico())%></p>
                <p>Bonificación: S/ <%= String.format("%.2f", p.getBonificacion())%></p>
                <p>Sueldo Bruto: S/ <%= String.format("%.2f", p.getSueldoBruto())%></p>
                <p class="text-red-400">Descuento: -S/ <%= String.format("%.2f", p.getDescuento())%></p>
                <p class="text-yellow-500 font-bold text-lg pt-2 border-t border-zinc-700">Neto a Pagar: S/ <%= String.format("%.2f", p.getSueldoNeto())%></p>
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

                        <!-- Tarjeta 1: Modelo - calcularPlanilla (Lógica Salarial) -->
                        <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                            <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-[var(--dorado)] overflow-x-auto border-l-2 border-[var(--dorado)]">
                                <pre><code>private void calcularPlanilla() {
    // 1. Sueldo Básico
    double tarifa = categoria.equalsIgnoreCase("A") ? 45.0 : 37.5;
    this.sueldoBasico = horasTrabajadas * tarifa;
    
    // 2. Bonificación por Hijos
    double tasaBono = (hijos <= 3) ? 40.5 : 35.0;
    this.bonificacion = hijos * tasaBono;
    
    // 3. Sueldo Bruto y Descuento
    this.sueldoBruto = sueldoBasico + bonificacion;
    double tasaDescuento = (sueldoBruto >= 3500) ? 0.135 : 0.10;
    this.descuento = sueldoBruto * tasaDescuento;
    
    // 4. Sueldo Neto
    this.sueldoNeto = sueldoBruto - descuento;
}</code></pre>
                            </div>
                            <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                <span class="text-[10px] text-[var(--dorado)] tracking-wider mb-1 uppercase font-bold">🧮 MODELO // NEGOCIO</span>
                                <h5 class="text-white font-bold mb-2 text-sm">Método: calcularPlanilla()</h5>
                                <p class="text-gray-400 leading-relaxed">
                                    Tiene la <span class="text-[var(--dorado)]">única función</span> de computar la estructura salarial: determina la tarifa por hora según categoría ("A" o "B"), asigna la asignación familiar por hijo, liquida el sueldo bruto y deduce las retenciones correspondientes para hallar el neto.
                                </p>
                            </div>
                        </div>

                        <!-- Tarjeta 2: Controlador - doPost (Procesamiento de Planilla) -->
                        <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 bg-[#141414] p-4 rounded border border-zinc-800 hover:border-zinc-700 transition-all">
                            <div class="lg:col-span-5 bg-black p-3 rounded font-mono text-[10px] text-sky-400 overflow-x-auto border-l-2 border-sky-500">
                                <pre><code>String categoria = 
    request.getParameter("categoria");
int horas = 
    Integer.parseInt(request.getParameter("horas"));
int hijos = 
    Integer.parseInt(request.getParameter("hijos"));

S9E2Model planilla = 
    new S9E2Model(categoria, horas, hijos);
    
request.setAttribute("planilla", planilla);</code></pre>
                            </div>
                            <div class="lg:col-span-7 flex flex-col justify-center text-xs font-mono">
                                <span class="text-[10px] text-sky-400 tracking-wider mb-1 uppercase font-bold">🧬 CONTROLADOR // SERVLET</span>
                                <h5 class="text-white font-bold mb-2 text-sm">Captura e Inyección de Planilla</h5>
                                <p class="text-gray-400 leading-relaxed">
                                    Encargado <span class="text-[var(--dorado)]">únicamente</span> de receptar los parámetros del empleado (categoría, horas y número de hijos), instanciar la liquidación en el modelo y transferir el objeto cargado a la vista JSP.
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