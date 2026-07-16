<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Portafolio - ROSALES YAPIAS MANUEL</title>
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

            /* Contenedor tipo Carta de Póker para los Logos en el Header */
            .poker-card-logo {
                width: 70px;
                height: 100px;
                background: #141414;
                border: 2px solid var(--dorado-apagado);
                border-radius: 8px;
                position: relative;
                box-shadow: 0 0 15px rgba(255, 204, 0, 0.15), inset 0 0 10px rgba(0, 0, 0, 0.8);
                transition: all 0.3s ease-in-out;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 8px;
            }

            .poker-card-logo:hover {
                transform: translateY(-6px) rotate(3deg);
                border-color: var(--dorado);
                box-shadow: 0 0 25px rgba(255, 204, 0, 0.4);
            }

            .card-corner-val {
                position: absolute;
                font-size: 11px;
                font-family: monospace;
                font-weight: bold;
                line-height: 1;
            }

            /* ==================== EFECTO GIRO DE CARTA (FLIP CARD) ==================== */
            .scene {
                perspective: 1000px;
                min-height: 420px;
            }

            .poker-card {
                width: 100%;
                height: 100%;
                position: relative;
                transform-style: preserve-3d;
                transition: transform 0.8s cubic-bezier(0.175, 0.885, 0.32, 1.275);
                cursor: pointer;
            }

            /* Clase dinámica de rotación aplicada mediante JS */
            .poker-card.is-flipped {
                transform: rotateY(180deg);
            }

            .card-face {
                position: absolute;
                width: 100%;
                height: 100%;
                backface-visibility: hidden;
                border-radius: 16px;
                border: 2px solid var(--dorado-apagado);
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.7), inset 0 0 20px rgba(255, 204, 0, 0.05);
                padding: 24px;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
            }

            /* Cara Delantera (Negra/Art Deco) */
            .card-face-front {
                background: #0d0d0d;
            }

            /* Cara Trasera (Diseño de reverso de naipe con fondo dorado opaco y listado) */
            .card-face-back {
                background: #141414;
                transform: rotateY(180deg);
                border-color: var(--dorado);
            }

            /* Scroll elegante para la lista de ejercicios */
            .exercise-list {
                overflow-y: auto;
                max-height: 260px;
            }

            .exercise-list::-webkit-scrollbar {
                width: 4px;
            }

            .exercise-list::-webkit-scrollbar-thumb {
                background-color: var(--dorado-apagado);
                border-radius: 4px;
            }

            /* Botones de ejercicios dentro de la carta */
            .exercise-link {
                background: #0a0a0a;
                border: 1px solid #222;
                transition: all 0.2s ease;
            }

            .exercise-link:hover {
                border-color: var(--dorado);
                background: #111;
                color: var(--dorado);
            }
        </style>
    </head>

    <body class="min-h-screen flex flex-col p-4 md:p-6 justify-between">

        <header
            class="w-full max-w-[1300px] mx-auto flex items-center justify-between py-6 px-8 bg-[#0d0d0d] border border-[#1c1c1c] rounded-t-lg relative">
            <div class="poker-card-logo select-none">
                <div class="card-corner-val top-2 left-2.5 text-white">
                    A<br><span class="text-xs">♠</span>
                </div>
                <div class="card-corner-val bottom-2 right-2.5 text-white text-right">
                    ♠<br>A
                </div>
                <img src="assets/carrera.png" alt="Carrera"
                     class="max-w-[42px] max-h-[42px] object-contain drop-shadow-[0_2px_4px_rgba(0,0,0,0.8)]">
            </div>

            <div class="text-center flex-1 mx-4">
                <h1 class="text-2xl md:text-3.5xl font-black tracking-[0.2em] text-white uppercase">
                    ROSALES YAPIAS MANUEL
                </h1>
                <p class="text-xs md:text-sm text-[var(--dorado)] tracking-[0.4em] uppercase mt-2 font-mono">
                    ♠ LENGUAJE DE PROGRAMACIÓN ♦
                </p>
            </div>

            <div class="poker-card-logo select-none">
                <div class="card-corner-val top-2 left-2.5 text-[var(--rojo-poker)]">
                    Q<br><span class="text-xs">♦</span>
                </div>
                <div class="card-corner-val bottom-2 right-2.5 text-[var(--rojo-poker)] text-right">
                    ♦<br>Q
                </div>
                <img src="assets/instituto.png" alt="Instituto"
                     class="max-w-[42px] max-h-[42px] object-contain drop-shadow-[0_2px_4px_rgba(0,0,0,0.8)]">
            </div>
        </header>

        <div
            class="w-full max-w-[1300px] mx-auto bg-[#111] border-x border-b border-[#1c1c1c] py-3 px-8 flex justify-between items-center text-xs font-mono text-gray-400 mb-6">
            <div class="flex items-center space-x-2">
                <span class="inline-block w-2 h-2 rounded-full bg-emerald-500 animate-pulse"></span>
                <span>📡 Servidor Activo</span>
            </div>
            <div>
                <% String usuarioLogueado = (String) session.getAttribute("session_usuario");
                    if (usuarioLogueado != null) {%>
                <span>En línea: <strong class="text-[var(--dorado)]">
                        <%= usuarioLogueado%>
                    </strong></span>
                <span class="mx-2 text-gray-600">|</span>
                <a href="logout" class="text-[var(--rojo-poker)] hover:underline">Cerrar Sesión</a>
                <% } else { %>
                <a href="login.jsp" class="text-[var(--dorado)] hover:text-white transition-colors">🔑 Iniciar
                    Sesión / Registrarse</a>
                    <% } %>
            </div>
        </div>

        <main class="w-full max-w-[1300px] mx-auto flex-1">
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 px-2">

                <div class="scene">
                    <div class="poker-card" onclick="flipCard(this)">
                        <div class="card-face card-face-front flex flex-col justify-between p-5">
                            <div class="flex justify-between items-start">
                                <span class="text-[10px] text-gray-500 font-mono tracking-widest uppercase">SN-001</span>
                                <span class="text-[var(--dorado)] text-xs font-mono">♦ A</span>
                            </div>

                            <div class="my-auto text-center space-y-2">
                                <h2 class="text-3xl font-extrabold text-[var(--dorado)] tracking-wider">SEMANA 01</h2>
                                <p class="text-[11px] text-gray-300 uppercase tracking-widest font-bold">Introducción y Estructuras Secuenciales</p>
                                <p class="text-[10px] text-gray-500 font-mono italic">Haz clic para desplegar los 10 ejercicios</p>
                            </div>

                            <div class="border-t border-[#222] pt-3 text-center">
                                <span class="text-[11px] text-emerald-400 font-mono">🎴 Deck de 10 Cartas Completado</span>
                            </div>
                        </div>

                        <div class="card-face card-face-back p-5 flex flex-col justify-between" onclick="event.stopPropagation();">

                            <div class="flex justify-between items-center mb-3 pb-2 border-b border-zinc-900">
                                <div class="text-left">
                                    <span class="text-[10px] text-gray-500 font-mono block">MESA DE TRABAJO</span>
                                    <span class="text-xs text-[var(--dorado)] font-mono font-bold tracking-widest">SEMANA 1</span>
                                </div>
                                <button class="text-gray-500 hover:text-white text-xs font-mono bg-[#111] px-2.5 py-1 rounded border border-[#222] hover:border-gray-600 transition-all" onclick="revertCard(this)">
                                    ↩ Volver
                                </button>
                            </div>

                            <div class="exercise-list space-y-2 pr-1.5 mb-4 max-h-[360px] overflow-y-auto scrollbar-thin scrollbar-thumb-zinc-800 scrollbar-track-transparent">

                                <a href="${pageContext.request.contextPath}/S1E1Controller" 
                                   class="flex justify-between items-center p-2 rounded bg-[#0a0a0a] border border-[#161616] hover:border-[var(--dorado)] text-xs font-mono text-gray-300 hover:text-white transition-all group">
                                    <span class="truncate pr-2">🃏 S1E1 - Área y Perímetro</span>
                                    <span class="text-[var(--dorado)] opacity-70 group-hover:opacity-100 transition-opacity">Jugar →</span>
                                </a>

                                <a href="${pageContext.request.contextPath}/S1E2Controller" 
                                   class="flex justify-between items-center p-2 rounded bg-[#0a0a0a] border border-[#161616] hover:border-[var(--dorado)] text-xs font-mono text-gray-300 hover:text-white transition-all group">
                                    <span class="truncate pr-2">🃏 S1E2 - Círculo y Circunferencia</span>
                                    <span class="text-[var(--dorado)] opacity-70 group-hover:opacity-100 transition-opacity">Jugar →</span>
                                </a>

                                <a href="${pageContext.request.contextPath}/S1E3Controller" 
                                   class="flex justify-between items-center p-2 rounded bg-[#0a0a0a] border border-[#161616] hover:border-[var(--dorado)] text-xs font-mono text-gray-300 hover:text-white transition-all group">
                                    <span class="truncate pr-2">🃏 S1E3 - Área del Rombo</span>
                                    <span class="text-[var(--dorado)] opacity-70 group-hover:opacity-100 transition-opacity">Jugar →</span>
                                </a>

                                <a href="${pageContext.request.contextPath}/S1E4Controller" 
                                   class="flex justify-between items-center p-2 rounded bg-[#0a0a0a] border border-[#161616] hover:border-[var(--dorado)] text-xs font-mono text-gray-300 hover:text-white transition-all group">
                                    <span class="truncate pr-2">🃏 S1E4 - Cilindro (Área y Volumen)</span>
                                    <span class="text-[var(--dorado)] opacity-70 group-hover:opacity-100 transition-opacity">Jugar →</span>
                                </a>

                                <a href="${pageContext.request.contextPath}/S1E5Controller" 
                                   class="flex justify-between items-center p-2 rounded bg-[#0a0a0a] border border-[#161616] hover:border-[var(--dorado)] text-xs font-mono text-gray-300 hover:text-white transition-all group">
                                    <span class="truncate pr-2">🃏 S1E5 - Cubo (Área y Volumen)</span>
                                    <span class="text-[var(--dorado)] opacity-70 group-hover:opacity-100 transition-opacity">Jugar →</span>
                                </a>

                                <a href="${pageContext.request.contextPath}/S1E6Controller" 
                                   class="flex justify-between items-center p-2 rounded bg-[#0a0a0a] border border-[#161616] hover:border-[var(--dorado)] text-xs font-mono text-gray-300 hover:text-white transition-all group">
                                    <span class="truncate pr-2">🃏 S1E6 - Cociente y Residuo</span>
                                    <span class="text-[var(--dorado)] opacity-70 group-hover:opacity-100 transition-opacity">Jugar →</span>
                                </a>

                                <a href="${pageContext.request.contextPath}/S1E7Controller" 
                                   class="flex justify-between items-center p-2 rounded bg-[#0a0a0a] border border-[#161616] hover:border-[var(--dorado)] text-xs font-mono text-gray-300 hover:text-white transition-all group">
                                    <span class="truncate pr-2">🃏 S1E7 - Invertir Número (5 Dígitos)</span>
                                    <span class="text-[var(--dorado)] opacity-70 group-hover:opacity-100 transition-opacity">Jugar →</span>
                                </a>

                                <a href="${pageContext.request.contextPath}/S1E8Controller" 
                                   class="flex justify-between items-center p-2 rounded bg-[#0a0a0a] border border-[#161616] hover:border-[var(--dorado)] text-xs font-mono text-gray-300 hover:text-white transition-all group">
                                    <span class="truncate pr-2">🃏 S1E8 - Conversor de Segundos</span>
                                    <span class="text-[var(--dorado)] opacity-70 group-hover:opacity-100 transition-opacity">Jugar →</span>
                                </a>

                                <a href="${pageContext.request.contextPath}/S1E9Controller" 
                                   class="flex justify-between items-center p-2 rounded bg-[#0a0a0a] border border-[#161616] hover:border-[var(--dorado)] text-xs font-mono text-gray-300 hover:text-white transition-all group">
                                    <span class="truncate pr-2">🃏 S1E9 - Reparto de Herencia</span>
                                    <span class="text-[var(--dorado)] opacity-70 group-hover:opacity-100 transition-opacity">Jugar →</span>
                                </a>

                                <a href="${pageContext.request.contextPath}/S1E10Controller" 
                                   class="flex justify-between items-center p-2 rounded bg-[#0a0a0a] border border-[#161616] hover:border-[var(--dorado)] text-xs font-mono text-gray-300 hover:text-white transition-all group">
                                    <span class="truncate pr-2">🃏 S1E10 - Presupuesto de Feria</span>
                                    <span class="text-[var(--dorado)] opacity-70 group-hover:opacity-100 transition-opacity">Jugar →</span>
                                </a>

                            </div>

                            <button onclick="abrirManual('manualSemana1')" 
                                    class="w-full py-2 bg-amber-950/40 hover:bg-[var(--dorado)] hover:text-black border border-[var(--dorado-apagado)] rounded text-[10px] font-mono text-[var(--dorado)] transition-all uppercase tracking-wider font-bold">
                                📖 Ver Manual Técnico S1
                            </button>
                        </div>
                    </div>
                </div>

                <div class="scene">
                    <div class="poker-card" onclick="flipCard(this)">
                        <div class="card-face card-face-front">
                            <div class="flex justify-between items-start">
                                <span class="text-[10px] text-gray-500 font-mono tracking-widest uppercase">SN-002</span>
                                <span class="text-[var(--dorado)] text-xs font-mono">♦ 2</span>
                            </div>
                            <div class="my-auto text-center space-y-2">
                                <h2 class="text-3xl font-extrabold text-[var(--dorado)] tracking-wider">SEMANA 2</h2>
                                <p class="text-xs text-gray-400 uppercase tracking-widest">Estructuras de Datos</p>
                                <p class="text-[11px] text-gray-500 font-mono italic">Haz clic para ver los ejercicios</p>
                            </div>
                            <div class="border-t border-[#222] pt-3 text-center">
                                <span class="text-[11px] text-emerald-400 font-mono">🎴 6 Ejercicios Listos</span>
                            </div>
                        </div>

                        <div class="card-face card-face-back" onclick="event.stopPropagation();">
                            <div class="flex justify-between items-center mb-3">
                                <span class="text-xs text-[var(--dorado)] font-mono font-bold">EJERCICIOS SEMANA 2</span>
                                <button class="text-gray-500 hover:text-white text-xs font-mono" onclick="revertCard(this)">↩ Volver</button>
                            </div>

                            <div class="exercise-list space-y-2 pr-1 overflow-y-auto max-h-[220px]">
                                <a href="${pageContext.request.contextPath}/S2E1Controller" 
                                   class="flex justify-between items-center p-2 rounded bg-[#0a0a0a] border border-[#161616] hover:border-[var(--dorado)] text-xs font-mono text-gray-300 hover:text-white transition-all group">
                                    <span class="truncate pr-2">🃏 S2E1 - Descuento del 11%</span>
                                    <span class="text-[var(--dorado)] opacity-70 group-hover:opacity-100 transition-opacity">Jugar →</span>
                                </a>

                                <a href="${pageContext.request.contextPath}/S2E2Controller" 
                                   class="flex justify-between items-center p-2 rounded bg-[#0a0a0a] border border-[#161616] hover:border-[var(--dorado)] text-xs font-mono text-gray-300 hover:text-white transition-all group">
                                    <span class="truncate pr-2">🃏 S2E2 - Oferta de Camisas 7%+7%</span>
                                    <span class="text-[var(--dorado)] opacity-70 group-hover:opacity-100 transition-opacity">Jugar →</span>
                                </a>

                                <a href="${pageContext.request.contextPath}/S2E3Controller" 
                                   class="flex justify-between items-center p-2 rounded bg-[#0a0a0a] border border-[#161616] hover:border-[var(--dorado)] text-xs font-mono text-gray-300 hover:text-white transition-all group">
                                    <span class="truncate pr-2">🃏 S2E3 - Pago Mensual Empleado</span>
                                    <span class="text-[var(--dorado)] opacity-70 group-hover:opacity-100 transition-opacity">Jugar →</span>
                                </a>

                                <a href="${pageContext.request.contextPath}/S2E4Controller" 
                                   class="flex justify-between items-center p-2 rounded bg-[#0a0a0a] border border-[#161616] hover:border-[var(--dorado)] text-xs font-mono text-gray-300 hover:text-white transition-all group">
                                    <span class="truncate pr-2">🃏 S2E4 - Donación Hospitalaria</span>
                                    <span class="text-[var(--dorado)] opacity-70 group-hover:opacity-100 transition-opacity">Jugar →</span>
                                </a>

                                <a href="${pageContext.request.contextPath}/S2E5Controller" 
                                   class="flex justify-between items-center p-2 rounded bg-[#0a0a0a] border border-[#161616] hover:border-[var(--dorado)] text-xs font-mono text-gray-300 hover:text-white transition-all group">
                                    <span class="truncate pr-2">🃏 S2E5 - Planilla de Vendedores</span>
                                    <span class="text-[var(--dorado)] opacity-70 group-hover:opacity-100 transition-opacity">Jugar →</span>
                                </a>

                                <a href="${pageContext.request.contextPath}/S2E6Controller" 
                                   class="flex justify-between items-center p-2 rounded bg-[#0a0a0a] border border-[#161616] hover:border-[var(--dorado)] text-xs font-mono text-gray-300 hover:text-white transition-all group">
                                    <span class="truncate pr-2">🃏 S2E6 - Retenciones AFP y ESSALUD</span>
                                    <span class="text-[var(--dorado)] opacity-70 group-hover:opacity-100 transition-opacity">Jugar →</span>
                                </a>
                            </div>

                            <div class="pt-3 mt-2 text-center border-t border-[#222]">
                                <span class="text-[10px] text-gray-500 font-mono">SISTEMAS DE INFORMACIÓN</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="scene">
                    <div class="poker-card" onclick="flipCard(this)">
                        <div class="card-face card-face-front flex flex-col justify-between p-5">
                            <div class="flex justify-between items-start">
                                <span class="text-[10px] text-gray-500 font-mono tracking-widest uppercase">SN-003</span>
                                <span class="text-[var(--dorado)] text-xs font-mono">♦ 3</span>
                            </div>

                            <div class="my-auto text-center space-y-2">
                                <h2 class="text-3xl font-extrabold text-[var(--dorado)] tracking-wider">SEMANA 03</h2>
                                <p class="text-[11px] text-gray-300 uppercase tracking-widest font-bold">Implementación de Métodos en Java</p>
                                <p class="text-[10px] text-gray-500 font-mono italic">Haz clic para desplegar los 6 proyectos</p>
                            </div>

                            <div class="border-t border-[#222] pt-3 text-center">
                                <span class="text-[11px] text-emerald-400 font-mono">🎴 Deck de 6 Cartas Completado</span>
                            </div>
                        </div>

                        <div class="card-face card-face-back p-5 flex flex-col justify-between" onclick="event.stopPropagation();">

                            <div class="flex justify-between items-center mb-3 pb-2 border-b border-zinc-900">
                                <div class="text-left">
                                    <span class="text-[10px] text-gray-500 font-mono block">MESA DE TRABAJO</span>
                                    <span class="text-xs text-[var(--dorado)] font-mono font-bold tracking-widest">SEMANA 3</span>
                                </div>
                                <button class="text-gray-500 hover:text-white text-xs font-mono bg-[#111] px-2.5 py-1 rounded border border-[#222] hover:border-gray-600 transition-all" onclick="revertCard(this)">
                                    ↩ Volver
                                </button>
                            </div>

                            <div class="exercise-list space-y-2 pr-1.5 mb-4 max-h-[360px] overflow-y-auto scrollbar-thin scrollbar-thumb-zinc-800 scrollbar-track-transparent">

                                <a href="${pageContext.request.contextPath}/S3E1Controller" 
                                   class="flex justify-between items-center p-2 rounded bg-[#0a0a0a] border border-[#161616] hover:border-[var(--dorado)] text-xs font-mono text-gray-300 hover:text-white transition-all group">
                                    <span class="truncate pr-2">🃏 S3E1 - Descuento del 11% y Caramelos</span>
                                    <span class="text-[var(--dorado)] opacity-70 group-hover:opacity-100 transition-opacity">Jugar →</span>
                                </a>

                                <a href="${pageContext.request.contextPath}/S3E2Controller" 
                                   class="flex justify-between items-center p-2 rounded bg-[#0a0a0a] border border-[#161616] hover:border-[var(--dorado)] text-xs font-mono text-gray-300 hover:text-white transition-all group">
                                    <span class="truncate pr-2">🃏 S3E2 - Descuento Sucesivo 10% + 10%</span>
                                    <span class="text-[var(--dorado)] opacity-70 group-hover:opacity-100 transition-opacity">Jugar →</span>
                                </a>

                                <a href="${pageContext.request.contextPath}/S3E3Controller" 
                                   class="flex justify-between items-center p-2 rounded bg-[#0a0a0a] border border-[#161616] hover:border-[var(--dorado)] text-xs font-mono text-gray-300 hover:text-white transition-all group">
                                    <span class="truncate pr-2">🃏 S3E3 - Pago Mensual de Empleado</span>
                                    <span class="text-[var(--dorado)] opacity-70 group-hover:opacity-100 transition-opacity">Jugar →</span>
                                </a>

                                <a href="${pageContext.request.contextPath}/S3E4Controller" 
                                   class="flex justify-between items-center p-2 rounded bg-[#0a0a0a] border border-[#161616] hover:border-[var(--dorado)] text-xs font-mono text-gray-300 hover:text-white transition-all group">
                                    <span class="truncate pr-2">🃏 S3E4 - Pasajes con Descuento y Chocolates</span>
                                    <span class="text-[var(--dorado)] opacity-70 group-hover:opacity-100 transition-opacity">Jugar →</span>
                                </a>

                                <a href="${pageContext.request.contextPath}/S3E5Controller" 
                                   class="flex justify-between items-center p-2 rounded bg-[#0a0a0a] border border-[#161616] hover:border-[var(--dorado)] text-xs font-mono text-gray-300 hover:text-white transition-all group">
                                    <span class="truncate pr-2">🃏 S3E5 - Salario de Vendedor (Comisión 9%)</span>
                                    <span class="text-[var(--dorado)] opacity-70 group-hover:opacity-100 transition-opacity">Jugar →</span>
                                </a>

                                <a href="${pageContext.request.contextPath}/S3E6Controller" 
                                   class="flex justify-between items-center p-2 rounded bg-[#0a0a0a] border border-[#161616] hover:border-[var(--dorado)] text-xs font-mono text-gray-300 hover:text-white transition-all group">
                                    <span class="truncate pr-2">🃏 S3E6 - Salario con ESSALUD y AFP</span>
                                    <span class="text-[var(--dorado)] opacity-70 group-hover:opacity-100 transition-opacity">Jugar →</span>
                                </a>

                            </div>

                            <button onclick="abrirManual('manualSemana3')" 
                                    class="w-full py-2 bg-amber-950/40 hover:bg-[var(--dorado)] hover:text-black border border-[var(--dorado-apagado)] rounded text-[10px] font-mono text-[var(--dorado)] transition-all uppercase tracking-wider font-bold">
                                📖 Ver Manual Técnico S3
                            </button>
                        </div>
                    </div>
                </div>

                <div class="scene">
                    <div class="poker-card" onclick="flipCard(this)">
                        <div class="card-face card-face-front flex flex-col justify-between p-5">
                            <div class="flex justify-between items-start">
                                <span class="text-[10px] text-gray-500 font-mono tracking-widest uppercase">SN-004</span>
                                <span class="text-[var(--dorado)] text-xs font-mono">♦ 4</span>
                            </div>

                            <div class="my-auto text-center space-y-2">
                                <h2 class="text-3xl font-extrabold text-[var(--dorado)] tracking-wider">SEMANA 04</h2>
                                <p class="text-[11px] text-gray-300 uppercase tracking-widest font-bold">Sentencias Selectivas e Incentivos</p>
                                <p class="text-[10px] text-gray-500 font-mono italic">Haz clic para desplegar los 4 ejercicios</p>
                            </div>

                            <div class="border-t border-[#222] pt-3 text-center">
                                <span class="text-[11px] text-emerald-400 font-mono">🎴 Deck de 4 Cartas Completado</span>
                            </div>
                        </div>

                        <div class="card-face card-face-back p-5 flex flex-col justify-between" onclick="event.stopPropagation();">

                            <div class="flex justify-between items-center mb-3 pb-2 border-b border-zinc-900">
                                <div class="text-left">
                                    <span class="text-[10px] text-gray-500 font-mono block">MESA DE TRABAJO</span>
                                    <span class="text-xs text-[var(--dorado)] font-mono font-bold tracking-widest">SEMANA 4</span>
                                </div>
                                <button class="text-gray-500 hover:text-white text-xs font-mono bg-[#111] px-2.5 py-1 rounded border border-[#222] hover:border-gray-600 transition-all" onclick="revertCard(this)">
                                    ↩ Volver
                                </button>
                            </div>

                            <div class="exercise-list space-y-2 pr-1.5 mb-4 max-h-[360px] overflow-y-auto scrollbar-thin scrollbar-thumb-zinc-800 scrollbar-track-transparent">

                                <a href="${pageContext.request.contextPath}/S4E1Controller" 
                                   class="flex justify-between items-center p-2 rounded bg-[#0a0a0a] border border-[#161616] hover:border-[var(--dorado)] text-xs font-mono text-gray-300 hover:text-white transition-all group">
                                    <span class="truncate pr-2">🃏 S4E1 - Alquiler Renta Car</span>
                                    <span class="text-[var(--dorado)] opacity-70 group-hover:opacity-100 transition-opacity">Jugar →</span>
                                </a>

                                <a href="${pageContext.request.contextPath}/S4E2Controller" 
                                   class="flex justify-between items-center p-2 rounded bg-[#0a0a0a] border border-[#161616] hover:border-[var(--dorado)] text-xs font-mono text-gray-300 hover:text-white transition-all group">
                                    <span class="truncate pr-2">🃏 S4E2 - Control de Horas Extras</span>
                                    <span class="text-[var(--dorado)] opacity-70 group-hover:opacity-100 transition-opacity">Jugar →</span>
                                </a>

                                <a href="${pageContext.request.contextPath}/S4E3Controller" 
                                   class="flex justify-between items-center p-2 rounded bg-[#0a0a0a] border border-[#161616] hover:border-[var(--dorado)] text-xs font-mono text-gray-300 hover:text-white transition-all group">
                                    <span class="truncate pr-2">🃏 S4E3 - Estacionamiento por Horas</span>
                                    <span class="text-[var(--dorado)] opacity-70 group-hover:opacity-100 transition-opacity">Jugar →</span>
                                </a>

                                <a href="${pageContext.request.contextPath}/S4E4Controller" 
                                   class="flex justify-between items-center p-2 rounded bg-[#0a0a0a] border border-[#161616] hover:border-[var(--dorado)] text-xs font-mono text-gray-300 hover:text-white transition-all group">
                                    <span class="truncate pr-2">🃏 S4E4 - Promedio de Prácticas</span>
                                    <span class="text-[var(--dorado)] opacity-70 group-hover:opacity-100 transition-opacity">Jugar →</span>
                                </a>

                            </div>

                            <button onclick="abrirManual('manualSemana4')" 
                                    class="w-full py-2 bg-amber-950/40 hover:bg-[var(--dorado)] hover:text-black border border-[var(--dorado-apagado)] rounded text-[10px] font-mono text-[var(--dorado)] transition-all uppercase tracking-wider font-bold">
                                Skybook 📖 Ver Manual Técnico S4
                            </button>
                        </div>
                    </div>
                </div>

                <div class="scene">
                    <div class="poker-card" onclick="flipCard(this)">
                        <div class="card-face card-face-front flex flex-col justify-between p-5">
                            <div class="flex justify-between items-start">
                                <span class="text-[10px] text-gray-500 font-mono tracking-widest uppercase">SN-005</span>
                                <span class="text-[var(--dorado)] text-xs font-mono">♣ 5</span>
                            </div>

                            <div class="my-auto text-center space-y-2">
                                <h2 class="text-3xl font-extrabold text-[var(--dorado)] tracking-wider">SEMANA 05</h2>
                                <p class="text-[11px] text-gray-300 uppercase tracking-widest font-bold">Estructuras de Control Repetitivas</p>
                                <p class="text-[10px] text-gray-500 font-mono italic">Haz clic para desplegar los 6 ejercicios</p>
                            </div>

                            <div class="border-t border-[#222] pt-3 text-center">
                                <span class="text-[11px] text-emerald-400 font-mono">🎴 Deck de 6 Cartas Completado</span>
                            </div>
                        </div>

                        <div class="card-face card-face-back p-5 flex flex-col justify-between" onclick="event.stopPropagation();">

                            <div class="flex justify-between items-center mb-3 pb-2 border-b border-zinc-900">
                                <div class="text-left">
                                    <span class="text-[10px] text-gray-500 font-mono block">MESA DE TRABAJO</span>
                                    <span class="text-xs text-[var(--dorado)] font-mono font-bold tracking-widest">SEMANA 5</span>
                                </div>
                                <button class="text-gray-500 hover:text-white text-xs font-mono bg-[#111] px-2.5 py-1 rounded border border-[#222] hover:border-gray-600 transition-all" onclick="revertCard(this)">
                                    ↩ Volver
                                </button>
                            </div>

                            <div class="exercise-list space-y-2 pr-1.5 mb-4 max-h-[360px] overflow-y-auto scrollbar-thin scrollbar-thumb-zinc-800 scrollbar-track-transparent">

                                <a href="${pageContext.request.contextPath}/S5E1Controller" 
                                   class="flex justify-between items-center p-2 rounded bg-[#0a0a0a] border border-[#161616] hover:border-[var(--dorado)] text-xs font-mono text-gray-300 hover:text-white transition-all group">
                                    <span class="truncate pr-2">🃏 S5E1 - Multiplicación por Sumas</span>
                                    <span class="text-[var(--dorado)] opacity-70 group-hover:opacity-100 transition-opacity">Jugar →</span>
                                </a>

                                <a href="${pageContext.request.contextPath}/S5E2Controller" 
                                   class="flex justify-between items-center p-2 rounded bg-[#0a0a0a] border border-[#161616] hover:border-[var(--dorado)] text-xs font-mono text-gray-300 hover:text-white transition-all group">
                                    <span class="truncate pr-2">🃏 S5E2 - Potencia por Multiplicaciones</span>
                                    <span class="text-[var(--dorado)] opacity-70 group-hover:opacity-100 transition-opacity">Jugar →</span>
                                </a>

                                <a href="${pageContext.request.contextPath}/S5E3Controller" 
                                   class="flex justify-between items-center p-2 rounded bg-[#0a0a0a] border border-[#161616] hover:border-[var(--dorado)] text-xs font-mono text-gray-300 hover:text-white transition-all group">
                                    <span class="truncate pr-2">🃏 S5E3 - Análisis de Dígitos</span>
                                    <span class="text-[var(--dorado)] opacity-70 group-hover:opacity-100 transition-opacity">Jugar →</span>
                                </a>

                                <a href="${pageContext.request.contextPath}/S5E4Controller" 
                                   class="flex justify-between items-center p-2 rounded bg-[#0a0a0a] border border-[#161616] hover:border-[var(--dorado)] text-xs font-mono text-gray-300 hover:text-white transition-all group">
                                    <span class="truncate pr-2">🃏 S5E4 - Suma de Serie Alternada</span>
                                    <span class="text-[var(--dorado)] opacity-70 group-hover:opacity-100 transition-opacity">Jugar →</span>
                                </a>

                                <a href="${pageContext.request.contextPath}/S5E5Controller" 
                                   class="flex justify-between items-center p-2 rounded bg-[#0a0a0a] border border-[#161616] hover:border-[var(--dorado)] text-xs font-mono text-gray-300 hover:text-white transition-all group">
                                    <span class="truncate pr-2">🃏 S5E5 - Control de Venta de Cuadernos</span>
                                    <span class="text-[var(--dorado)] opacity-70 group-hover:opacity-100 transition-opacity">Jugar →</span>
                                </a>

                                <a href="${pageContext.request.contextPath}/S5E6Controller" 
                                   class="flex justify-between items-center p-2 rounded bg-[#0a0a0a] border border-[#161616] hover:border-[var(--dorado)] text-xs font-mono text-gray-300 hover:text-white transition-all group">
                                    <span class="truncate pr-2">🃏 S5E6 - Distribución de Stocks</span>
                                    <span class="text-[var(--dorado)] opacity-70 group-hover:opacity-100 transition-opacity">Jugar →</span>
                                </a>

                            </div>

                            <button onclick="abrirManual('manualSemana5')" 
                                    class="w-full py-2 bg-amber-950/40 hover:bg-[var(--dorado)] hover:text-black border border-[var(--dorado-apagado)] rounded text-[10px] font-mono text-[var(--dorado)] transition-all uppercase tracking-wider font-bold">
                                📖 Ver Manual Técnico S5
                            </button>
                        </div>
                    </div>
                </div>

                <div class="scene">
                    <div class="poker-card" onclick="flipCard(this)">
                        <!-- CARA FRONTAL -->
                        <div class="card-face card-face-front flex flex-col justify-between p-5">
                            <div class="flex justify-between items-start">
                                <span class="text-[10px] text-gray-500 font-mono tracking-widest uppercase">SN-006</span>
                                <span class="text-[var(--dorado)] text-xs font-mono">♦ 6</span>
                            </div>

                            <div class="my-auto text-center space-y-2">
                                <h2 class="text-3xl font-extrabold text-[var(--dorado)] tracking-wider">SEMANA 06</h2>
                                <p class="text-[11px] text-gray-300 uppercase tracking-widest font-bold">Estructuras de Control y MVC</p>
                                <p class="text-[10px] text-gray-500 font-mono italic">Haz clic para desplegar los 3 proyectos</p>
                            </div>

                            <div class="border-t border-[#222] pt-3 text-center">
                                <span class="text-[11px] text-emerald-400 font-mono">🎴 Deck de 3 Cartas Completado</span>
                            </div>
                        </div>

                        <!-- CARA TRASERA -->
                        <div class="card-face card-face-back p-5 flex flex-col justify-between" onclick="event.stopPropagation();">

                            <div class="flex justify-between items-center mb-3 pb-2 border-b border-zinc-900">
                                <div class="text-left">
                                    <span class="text-[10px] text-gray-500 font-mono block">MESA DE TRABAJO</span>
                                    <span class="text-xs text-[var(--dorado)] font-mono font-bold tracking-widest">SEMANA 6</span>
                                </div>
                                <button class="text-gray-500 hover:text-white text-xs font-mono bg-[#111] px-2.5 py-1 rounded border border-[#222] hover:border-gray-600 transition-all" onclick="revertCard(this)">
                                    ↩ Volver
                                </button>
                            </div>

                            <!-- Listado de los 3 Proyectos de la Semana 06 -->
                            <div class="exercise-list space-y-2 pr-1.5 mb-4 max-h-[360px] overflow-y-auto scrollbar-thin scrollbar-thumb-zinc-800 scrollbar-track-transparent">

                                <!-- Proyecto 01 -->
                                <a href="${pageContext.request.contextPath}/S6E1Controller" 
                                   class="flex justify-between items-center p-2 rounded bg-[#0a0a0a] border border-[#161616] hover:border-[var(--dorado)] text-xs font-mono text-gray-300 hover:text-white transition-all group">
                                    <span class="truncate pr-2">🃏 S6E1 - Simulación de Pensiones A</span>
                                    <span class="text-[var(--dorado)] opacity-70 group-hover:opacity-100 transition-opacity">Jugar →</span>
                                </a>

                                <!-- Proyecto 02 -->
                                <a href="${pageContext.request.contextPath}/S6E2Controller" 
                                   class="flex justify-between items-center p-2 rounded bg-[#0a0a0a] border border-[#161616] hover:border-[var(--dorado)] text-xs font-mono text-gray-300 hover:text-white transition-all group">
                                    <span class="truncate pr-2">🃏 S6E2 - Gestión de Cuotas y Descuentos</span>
                                    <span class="text-[var(--dorado)] opacity-70 group-hover:opacity-100 transition-opacity">Jugar →</span>
                                </a>

                                <!-- Proyecto 03 -->
                                <a href="${pageContext.request.contextPath}/S6E3Controller" 
                                   class="flex justify-between items-center p-2 rounded bg-[#0a0a0a] border border-[#161616] hover:border-[var(--dorado)] text-xs font-mono text-gray-300 hover:text-white transition-all group">
                                    <span class="truncate pr-2">🃏 S6E3 - Rebaja de Pensión por Promedio</span>
                                    <span class="text-[var(--dorado)] opacity-70 group-hover:opacity-100 transition-opacity">Jugar →</span>
                                </a>

                            </div>

                            <button onclick="abrirManual('manualSemana6')" 
                                    class="w-full py-2 bg-amber-950/40 hover:bg-[var(--dorado)] hover:text-black border border-[var(--dorado-apagado)] rounded text-[10px] font-mono text-[var(--dorado)] transition-all uppercase tracking-wider font-bold">
                                📖 Ver Manual Técnico S6
                            </button>
                        </div>
                    </div>
                </div>

                <div class="scene">
                    <div class="poker-card" onclick="flipCard(this)">
                        <div class="card-face card-face-front">
                            <div class="flex justify-between items-start">
                                <span
                                    class="text-[10px] text-gray-500 font-mono tracking-widest uppercase">SN-006</span>
                                <span class="text-[var(--dorado)] text-xs font-mono">♦ 6</span>
                            </div>
                            <div class="my-auto text-center space-y-2">
                                <h2 class="text-3xl font-extrabold text-[var(--dorado)] tracking-wider">SEMANA 6</h2>
                                <p class="text-xs text-gray-400 uppercase tracking-widest">Persistencia JDBC</p>
                                <p class="text-[11px] text-gray-500 font-mono italic">Haz clic para ver los ejercicios
                                </p>
                            </div>
                            <div class="border-t border-[#222] pt-3 text-center">
                                <span class="text-[11px] text-emerald-400 font-mono">🎴 10 Ejercicios Listos</span>
                            </div>
                        </div>
                        <div class="card-face card-face-back" onclick="event.stopPropagation();">
                            <div class="flex justify-between items-center mb-3">
                                <span class="text-xs text-[var(--dorado)] font-mono font-bold">EJERCICIOS SEMANA
                                    6</span>
                                <button class="text-gray-500 hover:text-white text-xs font-mono"
                                        onclick="revertCard(this)">↩ Volver</button>
                            </div>
                            <div class="exercise-list space-y-2 pr-1">
                                <% for (int i = 1; i <= 10; i++) {%>
                                <a href="html/semana06/ejercicio<%= String.format(" %02d", i)%>.jsp"
                                   class="exercise-link flex justify-between items-center p-2 rounded text-xs
                                   font-mono text-gray-300">
                                    <span>🃏 Ejercicio <%= i%></span>
                                    <span class="text-[var(--dorado)]">Ver →</span>
                                </a>
                                <% }%>
                            </div>
                            <div class="pt-3 text-center border-t border-[#222]">
                                <span class="text-[10px] text-gray-500 font-mono">SISTEMAS DE INFORMACIÓN</span>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </main>

        <footer
            class="w-full max-w-[1300px] mx-auto mt-12 text-center text-[10px] text-gray-600 tracking-[0.3em] uppercase py-4 border-t border-[#161616]">
            ♦ PORTAFOLIO ACADÉMICO - ROSALES YAPIAS MANUEL © 2026 ♦
        </footer>

        <script>
            function flipCard(cardElement) {
                // Girar la carta aplicando la clase CSS
                cardElement.classList.add('is-flipped');
            }

            function revertCard(buttonElement) {
                // Detener la propagación del evento para evitar que el div padre vuelva a disparar flipCard
                event.stopPropagation();
                // Buscar la carta contenedora y quitarle la clase de rotación
                const card = buttonElement.closest('.poker-card');
                card.classList.remove('is-flipped');
            }
        </script>

    </body>

</html>