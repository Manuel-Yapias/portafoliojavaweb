<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.folderrosalesd3.model.semana12.S12E1Model" %>
<%
    S12E1Model metadata = (S12E1Model) request.getAttribute("manualModel");
    String titulo = (metadata != null) ? metadata.getTitulo() : "Manual de Despliegue";
    String plataforma = (metadata != null) ? metadata.getPlataforma() : "Render & GitHub";
    String versionJava = (metadata != null) ? metadata.getVersionJava() : "Java 17";
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>S12E1 - Manual de Despliegue Continuo</title>
        <!-- Tailwind CSS -->
        <script src="https://cdn.tailwindcss.com"></script>
        <style>
            :root {
                --dorado: #ffcc00;
                --fondo-poker: #0a0a0c;
            }
            body {
                background-color: var(--fondo-poker);
                background-image: radial-gradient(circle at 50% 0%, rgba(24, 24, 30, 0.9) 0%, rgba(5, 5, 5, 1) 100%);
                color: #f3f4f6;
                font-family: 'SF Pro Display', system-ui, -apple-system, sans-serif;
            }
            .glow-title {
                text-shadow: 0 0 25px rgba(255, 204, 0, 0.4);
            }
            .step-active {
                border-color: var(--dorado) !important;
                background-color: rgba(255, 204, 0, 0.05) !important;
            }
            /* Custom scrollbar para la lista de pasos */
            .custom-scroll::-webkit-scrollbar {
                width: 5px;
            }
            .custom-scroll::-webkit-scrollbar-track {
                background: #121214;
            }
            .custom-scroll::-webkit-scrollbar-thumb {
                background: #27272a;
                border-radius: 4px;
            }
            .custom-scroll::-webkit-scrollbar-thumb:hover {
                background: #ffcc00;
            }
        </style>
    </head>
    <body class="min-h-screen flex flex-col justify-between p-4 md:p-8">

        <!-- HEADER -->
        <header class="max-w-7xl mx-auto w-full mb-8">
            <div class="flex flex-col lg:flex-row lg:items-center justify-between border-b border-zinc-800 pb-6 gap-4">
                <div>
                    <div class="inline-flex items-center space-x-2 bg-amber-950/30 border border-yellow-600/30 px-3 py-1 rounded-full text-xs text-yellow-500 font-mono tracking-wider mb-3">
                        <span class="w-2 h-2 rounded-full bg-emerald-500 animate-pulse"></span>
                        <span>MANUAL TÉCNICO • AMBIENTE DE PRODUCCIÓN</span>
                    </div>
                    <h1 class="text-3xl md:text-5xl font-extrabold text-white tracking-tight uppercase glow-title">
                        <%= titulo%>
                    </h1>
                    <p class="text-zinc-400 text-sm md:text-base mt-1">
                        Configuración de servicios en la nube e Integración Continua utilizando <strong class="text-yellow-500"><%= plataforma%></strong>.
                    </p>
                </div>

                <div class="bg-zinc-900/40 border border-zinc-800 rounded-xl p-4 flex flex-col sm:flex-row items-start sm:items-center gap-4 font-mono text-xs">
                    <div class="text-zinc-400">
                        <p>SEMANA: <strong class="text-white text-sm">12</strong></p>
                        <p>ENTORNO: <strong class="text-yellow-500"><%= versionJava%></strong></p>
                    </div>
                    <div class="h-px sm:h-8 w-full sm:w-px bg-zinc-800"></div>
                    <div class="text-zinc-400">
                        <p>ESTADO: <strong class="text-emerald-400 uppercase">ONLINE (SaaS)</strong></p>
                        <p>DESPLIEGUE: <strong class="text-white">AUTOMÁTICO GIT</strong></p>
                    </div>
                </div>
            </div>
            <a href="${pageContext.request.contextPath}/index.jsp" 
               class="text-xs font-mono px-4 py-2 border border-zinc-800 bg-zinc-950/60 hover:border-[var(--dorado)] hover:text-[var(--dorado)] transition-all rounded">
                Volver al Deck Principal
            </a>
        </header>

        <!-- CUERPO DE LA CONSOLA -->
        <main class="max-w-7xl mx-auto w-full grid grid-cols-1 lg:grid-cols-12 gap-8 flex-grow">

            <!-- COLUMNA IZQUIERDA: LISTADO DE PASOS (5 cols) -->
            <div class="lg:col-span-5 space-y-3 max-h-[78vh] overflow-y-auto pr-2 custom-scroll">
                <div class="flex items-center justify-between pb-2">
                    <h3 class="text-xs font-mono uppercase tracking-widest text-zinc-500 font-bold">Pipeline de Despliegue</h3>
                    <span class="text-[10px] bg-zinc-900 text-zinc-400 px-2 py-0.5 rounded border border-zinc-800 font-mono">7 Pasos Activos</span>
                </div>

                <!-- Paso 1 -->
                <button onclick="activarPaso(1)" id="btn-step-1" class="step-active w-full text-left p-4 rounded-xl border border-zinc-800 bg-zinc-950/40 hover:border-zinc-800 transition-all flex items-start gap-3">
                    <span class="w-6 h-6 rounded-full bg-zinc-900 border border-zinc-700 text-xs font-mono flex items-center justify-center text-yellow-500 font-bold shrink-0">01</span>
                    <div>
                        <h4 class="text-sm font-bold text-white">Inicio de Infraestructura en Render</h4>
                        <p class="text-xs text-zinc-400 mt-1">Ingreso al panel principal del ecosistema Cloud.</p>
                    </div>
                </button>

                <!-- Paso 2 -->
                <button onclick="activarPaso(2)" id="btn-step-2" class="w-full text-left p-4 rounded-xl border border-zinc-800 bg-zinc-950/40 hover:border-zinc-800 transition-all flex items-start gap-3">
                    <span class="w-6 h-6 rounded-full bg-zinc-900 border border-zinc-700 text-xs font-mono flex items-center justify-center text-yellow-500 font-bold shrink-0">02</span>
                    <div>
                        <h4 class="text-sm font-bold text-white">Autenticación Segura (GitHub OAuth)</h4>
                        <p class="text-xs text-zinc-400 mt-1">Vinculación de credenciales federadas para automatización CI/CD.</p>
                    </div>
                </button>

                <!-- Paso 3 -->
                <button onclick="activarPaso(3)" id="btn-step-3" class="w-full text-left p-4 rounded-xl border border-zinc-800 bg-zinc-950/40 hover:border-zinc-800 transition-all flex items-start gap-3">
                    <span class="w-6 h-6 rounded-full bg-zinc-900 border border-zinc-700 text-xs font-mono flex items-center justify-center text-yellow-500 font-bold shrink-0">03</span>
                    <div>
                        <h4 class="text-sm font-bold text-white">Panel de Control General (Dashboard)</h4>
                        <p class="text-xs text-zinc-400 mt-1">Vista del Workspace donde interactúan todos los servicios activos.</p>
                    </div>
                </button>

                <!-- Paso 4 -->
                <button onclick="activarPaso(4)" id="btn-step-4" class="w-full text-left p-4 rounded-xl border border-zinc-800 bg-zinc-950/40 hover:border-zinc-800 transition-all flex items-start gap-3">
                    <span class="w-6 h-6 rounded-full bg-zinc-900 border border-zinc-700 text-xs font-mono flex items-center justify-center text-yellow-500 font-bold shrink-0">04</span>
                    <div>
                        <h4 class="text-sm font-bold text-white">Inicialización de un Nuevo Web Service</h4>
                        <p class="text-xs text-zinc-400 mt-1">Configuración técnica de compilación de código fuente.</p>
                    </div>
                </button>

                <!-- Paso 5 -->
                <button onclick="activarPaso(5)" id="btn-step-5" class="w-full text-left p-4 rounded-xl border border-zinc-800 bg-zinc-950/40 hover:border-zinc-800 transition-all flex items-start gap-3">
                    <span class="w-6 h-6 rounded-full bg-zinc-900 border border-zinc-700 text-xs font-mono flex items-center justify-center text-yellow-500 font-bold shrink-0">05</span>
                    <div>
                        <h4 class="text-sm font-bold text-white">Definición de Entornos del Proyecto</h4>
                        <p class="text-xs text-zinc-400 mt-1">Establecimiento de grupos y variables de entorno de producción.</p>
                    </div>
                </button>

                <!-- Paso 6 -->
                <button onclick="activarPaso(6)" id="btn-step-6" class="w-full text-left p-4 rounded-xl border border-zinc-800 bg-zinc-950/40 hover:border-zinc-800 transition-all flex items-start gap-3">
                    <span class="w-6 h-6 rounded-full bg-zinc-900 border border-zinc-700 text-xs font-mono flex items-center justify-center text-yellow-500 font-bold shrink-0">06</span>
                    <div>
                        <h4 class="text-sm font-bold text-white">Vinculación de Repositorio de Código</h4>
                        <p class="text-xs text-zinc-400 mt-1">Selección del repositorio GitHub que contiene nuestro servidor Java.</p>
                    </div>
                </button>

                <!-- Paso 7 -->
                <button onclick="activarPaso(7)" id="btn-step-7" class="w-full text-left p-4 rounded-xl border border-zinc-800 bg-zinc-950/40 hover:border-zinc-800 transition-all flex items-start gap-3">
                    <span class="w-6 h-6 rounded-full bg-zinc-900 border border-zinc-700 text-xs font-mono flex items-center justify-center text-yellow-500 font-bold shrink-0">07</span>
                    <div>
                        <h4 class="text-sm font-bold text-white">Arquitectura de Archivos en GitHub</h4>
                        <p class="text-xs text-zinc-400 mt-1">Verificación de dependencias pom.xml, Dockerfile y carpetas src.</p>
                    </div>
                </button>
            </div>

            <!-- COLUMNA DERECHA: CONSOLA DE VISUALIZACIÓN DINÁMICA DE DETALLES (7 cols) -->
            <div class="lg:col-span-7 flex flex-col justify-between bg-zinc-950 border border-zinc-800 rounded-2xl p-6 relative overflow-hidden">

                <!-- Visor de Captura -->
                <div>
                    <div class="flex justify-between items-center border-b border-zinc-900 pb-3 mb-4">
                        <span class="text-xs font-mono text-zinc-400 uppercase tracking-widest flex items-center gap-1.5">
                            <span class="w-2.5 h-2.5 rounded-full bg-yellow-500 animate-pulse"></span> 
                            <span id="txt-paso-secuencia">Paso 01/07</span>
                        </span>
                        <span id="label-resolucion" class="text-[10px] font-mono text-zinc-500 bg-zinc-900/50 px-2 py-1 rounded border border-zinc-800">render.png</span>
                    </div>

                    <!-- Contenedor Imagen -->
                    <div class="bg-black/80 rounded-xl overflow-hidden border border-zinc-900 p-2 flex items-center justify-center min-h-[220px] md:min-h-[280px]">
                        <img id="visual-image" 
                             src="${pageContext.request.contextPath}/assets/render.png" 
                             alt="Paso del Despliegue" 
                             class="max-h-[260px] md:max-h-[300px] w-auto object-contain transition-all duration-300 transform hover:scale-[1.01] cursor-zoom-in rounded"
                             onclick="abrirZoom()" />
                    </div>
                </div>

                <!-- FICHA TÉCNICA E INFORMACIÓN EXPLICATIVA COMPLETA -->
                <div class="mt-4 grid grid-cols-1 md:grid-cols-2 gap-4 bg-zinc-900/40 p-4 rounded-xl border border-zinc-900 text-xs font-mono">
                    <div>
                        <span class="text-yellow-500 block mb-1">🛠️ DATOS DE CONFIGURACIÓN:</span>
                        <ul class="space-y-1 text-zinc-400" id="data-config">
                            <li>• Proveedor: <strong class="text-white">Render.com</strong></li>
                            <li>• Protocolo: <strong class="text-white">HTTPS Seguro</strong></li>
                            <li>• Redirección: <strong class="text-white">Dashboard Core</strong></li>
                        </ul>
                    </div>
                    <div>
                        <span class="text-yellow-500 block mb-1">💻 LÍNEA DE COMANDO / ESTADO:</span>
                        <code id="terminal-command" class="text-emerald-400 bg-black/60 p-1.5 rounded block border border-zinc-800/60 overflow-x-auto text-[11px]">
                            GET https://render.com HTTP/1.1
                        </code>
                    </div>
                </div>

                <!-- Notas del Desarrollador Avanzadas -->
                <div class="mt-4 pt-4 border-t border-zinc-900">
                    <h4 class="text-yellow-500 font-mono text-xs font-bold mb-2 uppercase flex items-center gap-1">
                        <span>📖 DETALLE TÉCNICO COMPLETO DEL PROCESO:</span>
                    </h4>
                    <div id="visual-notes" class="text-zinc-300 text-xs md:text-sm leading-relaxed space-y-2 h-[120px] overflow-y-auto custom-scroll pr-1">
                        <p>Render es una de las plataformas en la nube más robustas del mercado actual para desarrolladores independientes. Ofrece infraestructura en la nube PaaS de forma gratuita sin requerir tarjetas de crédito para registrarse.</p>
                        <p>Para iniciar nuestro proceso de puesta en producción, accedemos al portal de la plataforma y localizamos el botón de entrada "Dashboard" o "Sign In" situado en la barra de navegación superior. Esta acción nos transferirá al subsistema de balanceo y administración de servidores.</p>
                    </div>
                </div>

            </div>

        </main>

        <!-- MODAL DE ZOOM (Para ver las capturas en detalle) -->
        <div id="zoom-modal" class="hidden fixed inset-0 bg-black/95 z-50 flex items-center justify-center p-4 transition-opacity duration-300" onclick="cerrarZoom()">
            <span class="absolute top-4 right-6 text-zinc-500 hover:text-white text-3xl font-mono cursor-pointer">&times;</span>
            <img id="zoom-img" class="max-w-full max-h-[90vh] object-contain rounded border border-zinc-800" src="" alt="Zoom" />
        </div>

        <!-- FOOTER -->
        <footer class="text-center text-[10px] text-zinc-600 mt-8 border-t border-zinc-950 pt-4 max-w-7xl mx-auto w-full">
            Semana 12 • Manual Técnico e Ingeniería del Despliegue de Aplicaciones • Manuel Rosales Yapias
        </footer>

        <!-- INTERACTIVIDAD Y DETALLES DEL MANUAL -->
        <script>
            // Objeto JSON con el manual de uso super detallado para cada paso técnico real.
            const pasosData = {
                1: {
                    image: "${pageContext.request.contextPath}/assets/render.png",
                    res: "render.png",
                    secuencia: "Paso 01/07",
                    config: [
                        "• Proveedor: <strong>Render.com Cloud</strong>",
                        "• Protocolo: <strong>HTTP/3 + SSL Capa 4</strong>",
                        "• Destino: <strong>Dashboard Core de Servidores</strong>"
                    ],
                    command: "GET https://render.com -I",
                    notes: `
                        <p><strong>Inicio de la Infraestructura:</strong> Render es un proveedor Cloud PaaS (Plataforma como Servicio) que permite desplegar aplicaciones web modernas de forma simplificada.</p>
                        <p>El primer paso técnico obligatorio consiste en ingresar a la URL pública oficial de Render para identificar los portales de inicio. En la esquina superior derecha de la pantalla principal, localizamos la puerta de acceso al <strong>Dashboard</strong>, el cual controla toda nuestra red privada virtual y balanceadores de carga.</p>
                    `
                },
                2: {
                    image: "${pageContext.request.contextPath}/assets/login.png",
                    res: "login.png",
                    secuencia: "Paso 02/07",
                    config: [
                        "• Autenticador: <strong>GitHub OAuth 2.0</strong>",
                        "• Tipo: <strong>Single Sign-On (SSO)</strong>",
                        "• Alcance: <strong>Lectura de Repositorios Públicos</strong>"
                    ],
                    command: "POST /oauth/authorize_device HTTP/1.1",
                    notes: `
                        <p><strong>Seguridad y Enlace:</strong> En lugar de crear cuentas con contraseñas clásicas que aumentan el riesgo de filtraciones, Render utiliza autorización por tokens OAuth 2.0.</p>
                        <p>Seleccionamos la opción de iniciar sesión mediante <strong>GitHub</strong>. Esto es indispensable para habilitar el flujo de Integración Continua (CI): cada vez que subamos un cambio (push) al código de nuestro proyecto Java, Render se enterará de inmediato para reconstruir el servidor de forma automatizada y transparente.</p>
                    `
                },
                3: {
                    image: "${pageContext.request.contextPath}/assets/dashboard.png",
                    res: "dashboard.png",
                    secuencia: "Paso 03/07",
                    config: [
                        "• Panel: <strong>Workspace Central de Manuel</strong>",
                        "• Región Base: <strong>Oregon (US West) / Ohio (US East)</strong>",
                        "• Nodos Activos: <strong>1 Instancia Free</strong>"
                    ],
                    command: "kubectl get pods --namespace=manuel-workspace",
                    notes: `
                        <p><strong>El Espacio de Trabajo:</strong> Al ingresar al Dashboard, se nos presenta el centro de mando donde residen los recursos asignados.</p>
                        <p>En este panel podemos monitorear el estado operativo actual de nuestras bases de datos, buckets de almacenamiento, tareas programadas (cron jobs) y servidores web. Para dar de alta nuestro portafolio de Java, utilizaremos el botón azul de la parte superior derecha <strong>New</strong> o directamente <strong>Create Web Service</strong>.</p>
                    `
                },
                4: {
                    image: "${pageContext.request.contextPath}/assets/creacion.png",
                    res: "creacion.png",
                    secuencia: "Paso 04/07",
                    config: [
                        "• Categoría: <strong>Web Service de Render</strong>",
                        "• Tipo Motor: <strong>Dockerized / Maven Runtime</strong>",
                        "• Trigger: <strong>Automático por Git Push</strong>"
                    ],
                    command: "render-cli services create --type web",
                    notes: `
                        <p><strong>Configuración del Servicio Web:</strong> Es la fase donde definimos qué tipo de servidor requerimos.</p>
                        <p>Render soporta lenguajes nativos de forma directa, pero para aplicaciones corporativas de Java (Jakarta EE / Spring) que requieren un servidor Tomcat o GlassFish interno, la mejor alternativa es seleccionar <strong>Web Service</strong> basado en repositorios de Git. Esto le dice a Render que el código fuente estará alojado y sincronizado de manera externa.</p>
                    `
                },
                5: {
                    image: "${pageContext.request.contextPath}/assets/proyecto.png",
                    res: "proyecto.png",
                    secuencia: "Paso 05/07",
                    config: [
                        "• Nombre Entorno: <strong>Production Environment</strong>",
                        "• Branch: <strong>main (Rama Productiva)</strong>",
                        "• Base OS: <strong>Debian Bullseye Linux / Alpine</strong>"
                    ],
                    command: "git branch -m master main && git push",
                    notes: `
                        <p><strong>Variables y Parametrización:</strong> Creamos la caja organizativa o Workspace del proyecto.</p>
                        <p>Se define el nombre identificador para el proyecto en la nube y se selecciona el entorno (Producción). Es sumamente crítico configurar que Render escuche únicamente la rama <strong>main</strong> de GitHub. Esto previene que errores o pruebas locales subidas en ramas de desarrollo 'dev' o 'test' alteren accidentalmente la versión web pública.</p>
                    `
                },
                6: {
                    image: "${pageContext.request.contextPath}/assets/github.png",
                    res: "github.png",
                    secuencia: "Paso 06/07",
                    config: [
                        "• Repositorio: <strong>portafoliojavaweb</strong>",
                        "• Visibilidad: <strong>Public (Lectura Abierta)</strong>",
                        "• URL Git: <strong>github.com/Manuel-Yapias/...</strong>"
                    ],
                    command: "git remote add origin https://github.com/...git",
                    notes: `
                        <p><strong>El Almacén de Código en GitHub:</strong> El núcleo del despliegue continuado depende de que nuestro código de Java esté en un repositorio remoto público.</p>
                        <p>Como se visualiza, nuestro repositorio se denomina exactamente <strong>portafoliojavaweb</strong> en el perfil del estudiante. Render lee la metadata de este repositorio para preparar las herramientas necesarias como JDK y Maven antes de la descarga de librerías.</p>
                    `
                },
                7: {
                    image: "${pageContext.request.contextPath}/assets/githubarchivos.png",
                    res: "githubarchivos.png",
                    secuencia: "Paso 07/07",
                    config: [
                        "• Build Descriptor: <strong>pom.xml (Maven Core)</strong>",
                        "• Config Docker: <strong>Dockerfile de Tomcat 10</strong>",
                        "• Raíz Proyecto: <strong>src/main/webapp/</strong>"
                    ],
                    command: "mvn clean package -DskipTests",
                    notes: `
                        <p><strong>Estructura de Carpetas e Ingeniería:</strong> Para desplegar Java en hosting modernos y gratuitos como Render, se utiliza tecnología de contenedores.</p>
                        <p>La estructura del repositorio incluye el archivo <strong>pom.xml</strong> que contiene las dependencias (Servlets, Jakarta API, JSON parser, JSTL) y un archivo descriptor <strong>Dockerfile</strong>. El Dockerfile le indica al servidor de Render: <em>'Descarga Java 17, compila el archivo .war mediante Maven y cópialo dentro de la carpeta /webapps/ de Tomcat para que empiece a funcionar'</em>. Esta arquitectura garantiza portabilidad total.</p>
                    `
                }
            };

            function activarPaso(numero) {
                // CORREGIDO: El bucle ahora limpia exactamente del paso 1 al 7
                for (let i = 1; i <= 7; i++) {
                    const btn = document.getElementById(`btn-step-${i}`);
                    if (btn) {
                        btn.classList.remove('step-active');
                    }
                }

                // Añadir estilo activo al presionado
                const btnActivo = document.getElementById(`btn-step-${numero}`);
                if (btnActivo) {
                    btnActivo.classList.add('step-active');
                }

                // Actualizar datos del visor con transición suave
                const imgElement = document.getElementById('visual-image');
                imgElement.style.opacity = '0';

                setTimeout(() => {
                    const paso = pasosData[numero];
                    if (paso) {
                        imgElement.src = paso.image;
                        document.getElementById('visual-notes').innerHTML = paso.notes;
                        document.getElementById('label-resolucion').innerText = paso.res;
                        document.getElementById('txt-paso-secuencia').innerText = paso.secuencia;
                        document.getElementById('terminal-command').innerText = paso.command;

                        // Actualizar la lista de configuración
                        const configContainer = document.getElementById('data-config');
                        configContainer.innerHTML = "";
                        paso.config.forEach(item => {
                            const li = document.createElement('li');
                            li.innerHTML = item;
                            configContainer.appendChild(li);
                        });
                    }
                    imgElement.style.opacity = '1';
                }, 180);
            }

            // Funciones del Modal Zoom
            function abrirZoom() {
                const modal = document.getElementById('zoom-modal');
                const mainImgSrc = document.getElementById('visual-image').src;
                const zoomImg = document.getElementById('zoom-img');

                zoomImg.src = mainImgSrc;
                modal.classList.remove('hidden');
            }

            function cerrarZoom() {
                document.getElementById('zoom-modal').classList.add('hidden');
            }
        </script>

    </body>
</html>