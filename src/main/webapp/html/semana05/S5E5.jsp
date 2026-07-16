<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.folderrosalesd3.model.semana05.S5E5Model" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>S5E5 - Control de Venta de Cuadernos</title>
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
                <h1 class="text-lg font-bold tracking-widest text-[var(--dorado)] uppercase">MESA S5E5</h1>
                <p class="text-[10px] text-zinc-400 font-mono">CONTROL DE CAMPAÑA • CUADERNOS ESCOLARES</p>
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
            
            <h2 class="text-xl font-extrabold text-[var(--dorado)] tracking-wide mb-2 uppercase">REGISTRAR VENTA</h2>
            <p class="text-xs text-zinc-400 mb-6">Selecciona el cuaderno escolar de la campaña actual e introduce la cantidad requerida para procesar el importe.</p>

            <% if (request.getAttribute("error") != null) { %>
                <div class="mb-4 p-3.5 bg-red-950/30 border border-[var(--rojo-poker)] text-[var(--rojo-poker)] rounded text-xs font-mono flex items-center space-x-2">
                    <span>⚠️</span>
                    <span><%= request.getAttribute("error") %></span>
                </div>
            <% } %>
            <% if (request.getAttribute("mensaje") != null) { %>
                <div class="mb-4 p-3.5 bg-emerald-950/30 border border-emerald-500 text-emerald-400 rounded text-xs font-mono flex items-center space-x-2">
                    <span>✔️</span>
                    <span><%= request.getAttribute("mensaje") %></span>
                </div>
            <% } %>

            <form action="${pageContext.request.contextPath}/S5E5Controller" method="POST" class="space-y-4 font-mono">
                <div>
                    <label class="block text-[11px] text-zinc-400 uppercase tracking-widest mb-1.5 font-bold">PRODUCTO DISPONIBLE</label>
                    <select name="producto" required
                            class="w-full bg-[#050505] border border-emerald-950 focus:border-[var(--dorado)] text-white text-sm px-4 py-3 rounded outline-none transition-all focus:ring-1 focus:ring-[var(--dorado)]">
                        <option value="Cuadernos LayConsa">Cuadernos LayConsa (S/. 1.50)</option>
                        <option value="Cuadernos Justus">Cuadernos Justus (S/. 1.90)</option>
                        <option value="Cuadernos StanFord">Cuadernos StanFord (S/. 3.50)</option>
                        <option value="Cuadernos David">Cuadernos David (S/. 2.50)</option>
                        <option value="Cuadernos College">Cuadernos College (S/. 3.00)</option>
                        <option value="Cuadernos Alpha">Cuadernos Alpha (S/. 4.50)</option>
                    </select>
                </div>

                <div>
                    <label class="block text-[11px] text-zinc-400 uppercase tracking-widest mb-1.5 font-bold">CANTIDAD DE UNIDADES</label>
                    <input type="number" name="cantidad" required min="1" placeholder="Ej: 12"
                           class="w-full bg-[#050505] border border-emerald-950 focus:border-[var(--dorado)] text-white text-sm px-4 py-3 rounded outline-none transition-all focus:ring-1 focus:ring-[var(--dorado)]">
                </div>

                <div class="pt-2 space-y-2">
                    <button type="submit" 
                            class="w-full py-3.5 bg-gradient-to-r from-emerald-700 to-emerald-500 hover:from-emerald-600 hover:to-emerald-400 text-white text-xs uppercase tracking-widest font-black rounded-lg transition-all shadow-lg shadow-emerald-950/40">
                        ♠️ Confirmar Operación
                    </button>
                    
                    <button type="submit" name="accion" value="limpiar"
                            class="w-full py-2 bg-zinc-900 border border-zinc-800 hover:border-red-900 hover:text-[var(--rojo-poker)] text-zinc-500 text-[10px] uppercase tracking-widest font-bold rounded transition-all">
                        🧹 Reiniciar Caja (Cerrar Mesa)
                    </button>
                </div>
            </form>
        </section>

        <section class="md:col-span-7 flex flex-col h-full justify-between space-y-4">
            <% 
                S5E5Model ultimaVenta = (S5E5Model) session.getAttribute("ultimaVenta");
                List<S5E5Model> historial = (List<S5E5Model>) session.getAttribute("historialVentas");
                
                double totalVendido = 0.0;
                int totalCuadernos = 0;
                
                if (historial != null) {
                    for (S5E5Model v : historial) {
                        totalVendido += v.getImporte();
                        totalCuadernos += v.getCantidad();
                    }
                }
            %>

            <% if (ultimaVenta != null) { %>
                <div class="bg-zinc-950 border border-emerald-900 p-5 rounded-xl relative overflow-hidden">
                    <div class="absolute top-2 right-4 text-[10px] text-emerald-500 font-mono tracking-widest font-bold">TICKET EMITIDO</div>
                    <h3 class="text-xs font-bold uppercase tracking-wider text-zinc-400 mb-3 font-mono">♠️ DETALLE DE ÚLTIMA VENTA</h3>
                    <div class="grid grid-cols-2 gap-4 font-mono text-xs">
                        <div>
                            <span class="text-[10px] text-zinc-500 block">PRODUCTO</span>
                            <span class="text-white font-semibold"><%= ultimaVenta.getProducto() %></span>
                        </div>
                        <div class="text-right">
                            <span class="text-[10px] text-zinc-500 block">PRECIO UNITARIO</span>
                            <span class="text-white font-semibold">S/. <%= String.format("%.2f", ultimaVenta.getPrecio()) %></span>
                        </div>
                        <div>
                            <span class="text-[10px] text-zinc-500 block">CANTIDAD</span>
                            <span class="text-emerald-400 font-bold"><%= ultimaVenta.getCantidad() %> unidades</span>
                        </div>
                        <div class="text-right">
                            <span class="text-[10px] text-[var(--dorado)] block font-bold">SUBTOTAL</span>
                            <span class="text-[var(--dorado)] font-extrabold text-sm">S/. <%= String.format("%.2f", ultimaVenta.getImporte()) %></span>
                        </div>
                    </div>
                </div>
            <% } %>

            <div class="bg-zinc-950/90 border border-emerald-950 p-6 rounded-xl shadow-2xl space-y-6">
                
                <div class="flex justify-between items-center border-b border-emerald-950 pb-4">
                    <div>
                        <span class="text-[10px] text-zinc-500 font-mono block uppercase">CUADERNOS ARQUEADOS</span>
                        <span class="text-xl font-bold text-white font-mono"><%= totalCuadernos %> unidades</span>
                    </div>
                    <div class="text-right">
                        <span class="text-[10px] text-[var(--dorado)] font-mono block uppercase">CAJA GENERAL DE CAMPAÑA</span>
                        <span class="text-2xl font-black text-[var(--dorado)] font-mono tracking-wider">
                            S/. <%= String.format("%.2f", totalVendido) %>
                        </span>
                    </div>
                </div>

                <div>
                    <h4 class="text-[11px] font-bold text-zinc-400 uppercase tracking-widest font-mono mb-3 flex justify-between">
                        <span>Historial de Sesión</span>
                        <span class="text-emerald-600 font-normal">Mesa activa</span>
                    </h4>
                    
                    <% if (historial == null || historial.isEmpty()) { %>
                        <div class="py-12 text-center border-2 border-dashed border-emerald-950/40 rounded-lg">
                            <span class="text-2xl opacity-30 block mb-2">♠️</span>
                            <p class="text-xs text-zinc-500 font-mono">No se han registrado ventas en este turno.</p>
                        </div>
                    <% } else { %>
                        <div class="max-h-56 overflow-y-auto rounded-lg border border-emerald-950/70 bg-[#050505]/40 scrollbar-thin scrollbar-thumb-emerald-900 scrollbar-track-transparent">
                            <table class="w-full text-left font-mono text-xs">
                                <thead class="bg-zinc-950 text-zinc-400 border-b border-emerald-950 sticky top-0">
                                    <tr>
                                        <th class="p-3">Detalle del Producto</th>
                                        <th class="p-3 text-center">Unid.</th>
                                        <th class="p-3 text-right">P. Unit.</th>
                                        <th class="p-3 text-right text-[var(--dorado)]">Importe</th>
                                    </tr>
                                </thead>
                                <tbody class="divide-y divide-zinc-950">
                                    <% for (S5E5Model v : historial) { %>
                                        <tr class="hover:bg-zinc-900/50 transition-colors">
                                            <td class="p-3 font-semibold text-zinc-300"><%= v.getProducto() %></td>
                                            <td class="p-3 text-center text-emerald-400 font-bold"><%= v.getCantidad() %></td>
                                            <td class="p-3 text-right text-zinc-400">S/. <%= String.format("%.2f", v.getPrecio()) %></td>
                                            <td class="p-3 text-right text-[var(--dorado)] font-extrabold">S/. <%= String.format("%.2f", v.getImporte()) %></td>
                                        </tr>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                    <% } %>
                </div>
            </div>
        </section>

    </main>

    <footer class="max-w-5xl w-full mx-auto text-center border-t border-emerald-950/60 pt-4 mt-6">
        <p class="text-[10px] text-zinc-500 font-mono tracking-widest uppercase">
            S5E5 - CONTROL DE CAMPAÑA ESCOLAR • MODELO-VISTA-CONTROLADOR ACUMULATIVO
        </p>
    </footer>

</body>
</html>