<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.folderrosalesd3.model.semana11.S11E1Model" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>S11E1 - Manual de Diseño e Infografía Interactiva</title>
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
            .gold-glow {
                text-shadow: 0 0 15px rgba(255, 204, 0, 0.4);
            }
            /* Estilos para el visor interactivo de cartas */
            .visor-container {
                perspective: 1000px;
            }
            .interactive-card {
                transition: transform 0.6s cubic-bezier(0.4, 0, 0.2, 1), box-shadow 0.3s;
            }
            .interactive-card:hover {
                box-shadow: 0 0 25px rgba(255, 204, 0, 0.35);
            }
            .active-dot {
                box-shadow: 0 0 10px var(--dorado);
            }
        </style>
    </head>
    <body class="min-h-screen flex flex-col justify-between p-4 md:p-8">

        <header class="max-w-6xl mx-auto w-full text-center mb-10">
            <div class="inline-block border-b-2 border-yellow-500 pb-2 mb-4">
                <span class="text-xs uppercase tracking-widest text-yellow-500 font-bold">♣ DESIGN SHOWCASE • SEMANA 11 ♣</span>
            </div>
            <h1 class="text-4xl md:text-6xl font-extrabold gold-glow text-yellow-400 tracking-tight uppercase">
                Bitácora de Diseño
            </h1>
            <p class="text-gray-400 text-sm md:text-base mt-2 max-w-2xl mx-auto">
                De la complejidad geométrica del Art Déco a la optimización de código en el "High Roller Dark Mode".
            </p>
            <a href="${pageContext.request.contextPath}/index.jsp" 
               class="text-xs font-mono px-4 py-2 border border-zinc-800 bg-zinc-950/60 hover:border-[var(--dorado)] hover:text-[var(--dorado)] transition-all rounded">
                Volver al Deck Principal
            </a>
        </header>

        <main class="max-w-6xl mx-auto w-full flex-grow space-y-12">

            <section class="bg-zinc-900/80 border border-zinc-800 rounded-3xl p-6 md:p-10">
                <div class="grid grid-cols-1 lg:grid-cols-12 gap-8 items-center">

                    <div class="lg:col-span-5 space-y-6">
                        <div class="inline-flex items-center space-x-2 bg-black px-3 py-1 rounded-full border border-zinc-800">
                            <span id="fase-tag" class="w-2.5 h-2.5 rounded-full bg-yellow-500 active-dot"></span>
                            <span id="fase-numero" class="text-xs font-mono text-yellow-500 uppercase tracking-widest font-bold">Fase 1: El Origen</span>
                        </div>

                        <h2 id="fase-titulo" class="text-3xl font-extrabold text-white tracking-tight">
                            Art Déco Playing Card
                        </h2>

                        <p id="fase-descripcion" class="text-gray-400 text-sm md:text-base leading-relaxed">
                            Nuestra inspiración original nació de barajas físicas clásicas. Un diseño ornamentado de cartas oscuras con corazones rojos, patrones reticulares de líneas punteadas y decoraciones doradas en las esquinas. Aunque estéticamente exquisito, replicar este nivel de detalle fino en HTML/CSS plano suponía un reto de carga y adaptabilidad extremadamente alto.
                        </p>

                        <div class="flex items-center space-x-3 pt-4">
                            <button onclick="cambiarFase(1)" class="px-4 py-2 bg-zinc-800 hover:bg-yellow-500 hover:text-black rounded-lg text-xs font-bold font-mono transition-all">Fase 1</button>
                            <button onclick="cambiarFase(2)" class="px-4 py-2 bg-zinc-800 hover:bg-yellow-500 hover:text-black rounded-lg text-xs font-bold font-mono transition-all">Fase 2</button>
                            <button onclick="cambiarFase(3)" class="px-4 py-2 bg-zinc-800 hover:bg-yellow-500 hover:text-black rounded-lg text-xs font-bold font-mono transition-all">Fase 3</button>
                        </div>
                    </div>

                    <div class="lg:col-span-7 flex justify-center py-6 visor-container">
                        <div id="carta-interactiva" class="interactive-card bg-zinc-950 border-2 border-yellow-500/60 rounded-2xl p-4 md:p-6 w-full max-w-[420px] transform rotate-1 hover:rotate-0">
                            <div class="flex justify-between items-center border-b border-zinc-900 pb-3 mb-4">
                                <span class="text-[10px] font-mono text-zinc-500 uppercase" id="card-serial">Concepto Original</span>
                                <div class="flex space-x-1">
                                    <span class="w-2 h-2 rounded-full bg-red-500"></span>
                                    <span class="w-2 h-2 rounded-full bg-yellow-500"></span>
                                </div>
                            </div>

                            <div class="bg-black/80 rounded-xl overflow-hidden border border-zinc-800 flex items-center justify-center p-2 min-h-[280px]">
                                <img id="fase-imagen" 
                                     src="${pageContext.request.contextPath}/assets/image_f3bbef.jpg" 
                                     alt="Concepto Art Deco" 
                                     class="max-h-[280px] object-contain transition-all duration-500 transform hover:scale-105" />
                            </div>

                            <p class="text-center text-[10px] text-zinc-500 font-mono mt-4 uppercase tracking-wider">
                                Desliza o cambia de fase para barajar el boceto
                            </p>
                        </div>
                    </div>

                </div>
            </section>

            <section class="space-y-8">
                <h3 class="text-2xl font-bold tracking-wider text-center gold-glow text-yellow-400 uppercase">La Ruta de la Simplificación</h3>

                <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                    <div class="bg-zinc-900/60 border border-zinc-800/80 rounded-2xl p-6 hover:border-yellow-500/40 transition-all duration-300">
                        <div class="text-yellow-500 text-3xl font-mono font-bold mb-3">01</div>
                        <h4 class="text-lg font-bold text-white mb-2">Inspiración Física</h4>
                        <p class="text-xs text-gray-400 leading-relaxed">
                            El primer paso consistió en idear un portafolio web que simulara una mesa de juego. Buscábamos capturar la atmósfera inmersiva de los naipes reales con acabados en negro mate y detalles Art Déco.
                        </p>
                    </div>

                    <div class="bg-zinc-900/60 border border-zinc-800/80 rounded-2xl p-6 hover:border-yellow-500/40 transition-all duration-300">
                        <div class="text-yellow-500 text-3xl font-mono font-bold mb-3">02</div>
                        <h4 class="text-lg font-bold text-white mb-2">Boceto Blanco & Estructura</h4>
                        <p class="text-xs text-gray-400 leading-relaxed">
                            Para la segunda propuesta, se estructuraron las secciones del folder en cartas individuales de esquinas redondeadas sobre un fondo blanco clásico de casino de salón. Sin embargo, la paleta de colores aún no lograba la atmósfera inmersiva buscada.
                        </p>
                    </div>

                    <div class="bg-zinc-900/60 border border-zinc-800/80 rounded-2xl p-6 hover:border-yellow-500/40 transition-all duration-300">
                        <div class="text-yellow-500 text-3xl font-mono font-bold mb-3">03</div>
                        <h4 class="text-lg font-bold text-white mb-2">Fusión y "Dark Mode"</h4>
                        <p class="text-xs text-gray-400 leading-relaxed">
                            Se implementó una simplificación técnica drástica: un modo oscuro nativo en negro de alta fidelidad, con cartas estilizadas mediante bordes iluminados de un pixel en dorado que reaccionan de manera fluida al cursor.
                        </p>
                    </div>
                </div>
            </section>

        </main>

        <footer class="text-center text-xs text-zinc-650 mt-12 border-t border-zinc-900 pt-6">
            <p>Semana 11 - Portafolio de Ingeniería de Software • Desarrollado con el Patrón MVC</p>
        </footer>

        <script>
            const fases = {
                1: {
                    tag: "Fase 1: El Origen",
                    titulo: "Art Déco Playing Card",
                    descripcion: "Nuestra inspiración original nació de barajas físicas clásicas. Un diseño ornamentado de cartas oscuras con corazones rojos, patrones reticulares de líneas punteadas y decoraciones doradas en las esquinas. Aunque estéticamente exquisito, replicar este nivel de detalle fino en HTML/CSS plano suponía un reto de carga y adaptabilidad extremadamente alto.",
                    serial: "Concepto de Diseño Físico",
                    imagen: "${pageContext.request.contextPath}/assets/fase1.png",
                    color: "bg-red-500"
                },
                2: {
                    tag: "Fase 2: Estructura Clásica",
                    titulo: "Estructura Clásica en Lienzo",
                    descripcion: "El primer boceto funcional web migró hacia un lienzo limpio de esquinas doradas. Buscaba ordenar los ejercicios mediante cartas sobrias ordenadas por semanas con indicadores clásicos de juego (As, Reina) para la navegación del menú superior. El fondo claro clásico mantenía sobriedad pero perdía la mística inmersiva nocturna del casino.",
                    serial: "Maqueta Estructural Inicial",
                    imagen: "${pageContext.request.contextPath}/assets/fase2.png",
                    color: "bg-amber-500"
                },
                3: {
                    tag: "Fase 3: Optimización Final",
                    titulo: "Diseño Final: High Roller Mode",
                    descripcion: "La solución definitiva. Fusionamos la elegancia del casino con la legibilidad moderna: fondo oscuro profundo con un sutil patrón de red de cartas y naipes minimalistas interactivos delimitados por delgadas líneas de neón dorado. Esta versión facilitó la carga adaptativa, agilizó la interactividad en dispositivos móviles y conservó la atmósfera premium.",
                    serial: "Diseño de Interfaz Finalizado",
                    imagen: "${pageContext.request.contextPath}/assets/fase3.png",
                    color: "bg-emerald-500"
                }
            };

            function cambiarFase(num) {
                const datos = fases[num];
                const cardElement = document.getElementById('carta-interactiva');

                // Animación de barajado (giro 3D rápido al cambiar)
                cardElement.style.transform = "rotateY(90deg) scale(0.95)";

                setTimeout(() => {
                    // Actualización de textos e imágenes durante la transición
                    document.getElementById('fase-numero').innerText = datos.tag;
                    document.getElementById('fase-titulo').innerText = datos.titulo;
                    document.getElementById('fase-descripcion').innerText = datos.descripcion;
                    document.getElementById('card-serial').innerText = datos.serial;
                    document.getElementById('fase-imagen').src = datos.imagen;

                    // Cambiar color del indicador activo
                    const tagDot = document.getElementById('fase-tag');
                    tagDot.className = `w-2.5 h-2.5 rounded-full ${datos.color} active-dot`;

                    // Volver a enderezar la carta
                    cardElement.style.transform = "rotateY(0deg) scale(1)";
                }, 300);
            }
        </script>

    </body>
</html>