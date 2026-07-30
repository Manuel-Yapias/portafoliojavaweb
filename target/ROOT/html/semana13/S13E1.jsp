<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.folderrosalesd3.model.semana13.S13E1Model" %>
<%
    S13E1Model data = (S13E1Model) request.getAttribute("manualUsuario");
    String estudiante = (data != null) ? data.getEstudiante() : "ROSALES YAPIAS MANUEL";
    String curso = (data != null) ? data.getCurso() : "LENGUAJE DE PROGRAMACIÓN";
    String ciclo = (data != null) ? data.getCicloSeccion() : "III - D";
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>S13E1 - Manual de Login & Render cloud</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        :root { --dorado: #ffcc00; --fondo-poker: #0a0a0c; }
        body {
            background-color: var(--fondo-poker);
            background-image: radial-gradient(circle at 50% 0%, rgba(20, 20, 25, 0.9) 0%, rgba(5, 5, 5, 1) 100%);
            color: #e4e4e7;
            font-family: system-ui, -apple-system, sans-serif;
        }
        .nav-active { border-color: var(--dorado) !important; background-color: rgba(255, 204, 0, 0.05) !important; color: #ffffff !important; }
        .tab-active { border-bottom: 2px solid var(--dorado); color: var(--dorado) !important; }
        .custom-scroll::-webkit-scrollbar { width: 6px; }
        .custom-scroll::-webkit-scrollbar-track { background: #0f0f11; }
        .custom-scroll::-webkit-scrollbar-thumb { background: #27272a; border-radius: 4px; }
        .custom-scroll::-webkit-scrollbar-thumb:hover { background: #ffcc00; }
        pre { font-family: 'Courier New', Courier, monospace; }
    </style>
</head>
<body class="min-h-screen flex flex-col justify-between p-4 md:p-8">

    <!-- HEADER -->
    <header class="max-w-7xl mx-auto w-full mb-6 border-b border-zinc-800 pb-4">
        <div class="flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
            <div>
                <span class="text-[10px] bg-amber-950/40 text-yellow-500 border border-yellow-600/30 px-2.5 py-1 rounded-md font-mono tracking-widest uppercase">
                    SEMANA 13 • MANUAL SISTEMA DE LOGIN
                </span>
                <h1 class="text-2xl md:text-3xl font-black text-white uppercase tracking-tight mt-2">
                    Autenticación & Base de Datos Remota
                </h1>
            </div>
            <div class="text-left md:text-right font-mono text-xs text-zinc-400 bg-zinc-900/30 p-3 rounded-xl border border-zinc-800">
                <p>Estudiante: <strong class="text-white"><%= estudiante %></strong></p>
                <p>Curso: <strong class="text-yellow-500"><%= curso %></strong></p>
                <p>Sección: <strong class="text-white"><%= ciclo %></strong></p>
            </div>
        </div>
    </header>

    <!-- CUERPO CENTRAL -->
    <main class="max-w-7xl mx-auto w-full grid grid-cols-1 lg:grid-cols-12 gap-6 flex-grow">
        
        <!-- NAVEGADOR DE PASOS (IZQUIERDA) -->
        <div class="lg:col-span-4 space-y-3">
            <h3 class="text-xs font-mono uppercase tracking-widest text-zinc-500 font-bold mb-2 pl-1">Etapas de la Implementación</h3>
            
            <button onclick="cambiarSeccion(1)" id="btn-sec-1" class="nav-active w-full text-left p-3.5 rounded-xl border border-zinc-800 bg-zinc-950/40 hover:border-zinc-700 transition-all flex items-center gap-3">
                <span class="w-8 h-8 rounded-lg bg-zinc-900 border border-zinc-700 flex items-center justify-center text-yellow-500 font-mono font-bold">01</span>
                <div>
                    <h4 class="text-sm font-bold">Uso de la Interfaz</h4>
                    <p class="text-xs text-zinc-400">Cómo logearse o registrarse en la mesa.</p>
                </div>
            </button>

            <button onclick="cambiarSeccion(2)" id="btn-sec-2" class="w-full text-left p-3.5 rounded-xl border border-zinc-800 bg-zinc-950/40 hover:border-zinc-700 transition-all flex items-center gap-3">
                <span class="w-8 h-8 rounded-lg bg-zinc-900 border border-zinc-700 flex items-center justify-center text-yellow-500 font-mono font-bold">02</span>
                <div>
                    <h4 class="text-sm font-bold">Infraestructura en Render</h4>
                    <p class="text-xs text-zinc-400">Creación del servidor PostgreSQL gratuito.</p>
                </div>
            </button>

            <button onclick="cambiarSeccion(3)" id="btn-sec-3" class="w-full text-left p-3.5 rounded-xl border border-zinc-800 bg-zinc-950/40 hover:border-zinc-700 transition-all flex items-center gap-3">
                <span class="w-8 h-8 rounded-lg bg-zinc-900 border border-zinc-700 flex items-center justify-center text-yellow-500 font-mono font-bold">03</span>
                <div>
                    <h4 class="text-sm font-bold">Conexión & Servlets</h4>
                    <p class="text-xs text-zinc-400">Explicación del código y arquitectura.</p>
                </div>
            </button>
        </div>

        <!-- VISOR DINÁMICO MULTI-TAB (DERECHA) -->
        <div class="lg:col-span-8 flex flex-col bg-zinc-950 border border-zinc-800 rounded-2xl p-5 relative">
            
            <!-- Cambiador de Sub-Imágenes de la Sección Activa -->
            <div class="flex justify-between items-center border-b border-zinc-900 pb-3 mb-3 font-mono text-xs">
                <span id="txt-modulo" class="text-yellow-500 font-bold uppercase tracking-wider">Cargando...</span>
                <div id="controles-imagenes" class="flex gap-2">
                    <!-- Botones para alternar imágenes se inyectan dinámicamente -->
                </div>
            </div>

            <!-- CONTENEDOR GRÁFICO CON LUPA / RECUADRO -->
            <div class="bg-black/40 rounded-xl overflow-hidden border border-zinc-900 p-2 flex items-center justify-center min-h-[240px] max-h-[300px] mb-4">
                <img id="img-visor" src="" alt="Captura de proceso" class="max-h-[280px] w-auto object-contain rounded-lg shadow-xl transition-all duration-200" />
            </div>

            <!-- ÁREA DE EXPLICACIÓN DETALLADA -->
            <div class="flex-grow bg-zinc-900/20 rounded-xl border border-zinc-900/60 p-4">
                <div id="contenido-dinamico" class="text-zinc-300 text-sm leading-relaxed h-[220px] overflow-y-auto custom-scroll pr-1">
                    <!-- Se inyecta vía JS -->
                </div>
            </div>

        </div>
    </main>

    <!-- FOOTER -->
    <footer class="text-center text-[10px] text-zinc-600 mt-6 border-t border-zinc-900 pt-3">
        <%= curso %> • III Ciclo • <%= estudiante %>
    </footer>

<!-- INTERACTIVIDAD COMPLETA CORREGIDA -->
    <script>
        let seccionActual = 1;
        let subImagenActual = 0;

        const manualData = {
            1: {
                modulo: "Uso del Apartado: Inicio de Sesión / Registro",
                imagenes: ["login1.png", "login2.png", "login3.png"],
                textosImagenes: [
                    "Disparador principal integrado en el menú superior del sitio.",
                    "Pestaña de registro con el formulario temático 'NEW_PLAYER'.",
                    "Pestaña de inicio de sesión para ingresar credenciales válidas."
                ],
                explicacion: `
                    <p class="mb-2"><strong>¿Cómo interactuar con este módulo?</strong></p>
                    <ul class="list-disc pl-5 space-y-2 text-zinc-300">
                        <li><strong>Acceso:</strong> Se pulsa el botón <span class="text-yellow-400 font-bold">🔑 Iniciar Sesión / Registrarse</span> en la barra de navegación para dirigirse al entorno seguro.</li>
                        <li><strong>Crear Cuenta:</strong> En la pestaña <code>[ CREAR_CUENTA ]</code>, el usuario ingresa su pseudónimo en 'NUEVO_JUGADOR', establece su clave secreta y presiona <code>JOIN TABLE (REGISTRAR)</code>. El sistema registrará los datos de inmediato en la nube.</li>
                        <li><strong>Iniciar Sesión:</strong> Si ya tiene una cuenta activa, el usuario cambia a la pestaña <code>[ INICIAR_SESION ]</code>, digita sus credenciales y el sistema validará el acceso abriendo una sesión HTTP segura.</li>
                    </ul>
                `
            },
            2: {
                modulo: "Funcionamiento: Infraestructura en Render Cloud",
                imagenes: ["login4.png", "login5.png", "login6.png", "login7.png"],
                textosImagenes: [
                    "Dashboard de Render: Creación de un nuevo servicio PostgreSQL.",
                    "Configuración del plan: Selección de la instancia gratuita.",
                    "Panel informativo de la base de datos recién desplegada.",
                    "Sección de credenciales 'Connections' donde obtenemos el Host, Puerto y URL."
                ],
                explicacion: `
                    <p class="mb-2"><strong>Despliegue de la Base de Datos Remota:</strong></p>
                    <p class="mb-2">Para que el login funcione globalmente, montamos un servidor relacional en la nube usando <strong>Render</strong> de la siguiente manera:</p>
                    <ul class="list-disc pl-5 space-y-1 text-zinc-300">
                        <li>Accedimos al panel de control de Render y pulsamos el botón superior <strong>+ New</strong> para seleccionar la opción <strong>PostgreSQL</strong>.</li>
                        <li>Completamos el formulario asignando un nombre único al proyecto y seleccionamos de manera explícita la opción de <strong>Plan Gratuito</strong> para evitar cobros de hosting.</li>
                        <li>Una vez el estado cambió a <span class="text-green-400 font-bold font-mono">Available</span>, entramos a la sección más importante: el apartado <strong>Connections</strong>. Desde aquí extraemos la cadena de conexión externa (Hostname, Database Name, Username y Password) que utilizaremos para enlazar nuestra aplicación web Java.</li>
                    </ul>
                `
            },
            3: {
                modulo: "Funcionamiento: Arquitectura del Código Backend",
                imagenes: ["login3.png"],
                textosImagenes: ["Esquema lógico de persistencia de datos."],
                explicacion: `
                    <p class="mb-2"><strong>Explicación de la Lógica y Servlets Desarrollados:</strong></p>
                    <p class="mb-2">Tras tener las credenciales de Render, estructuramos todo el flujo con los siguientes componentes de código:</p>
                    <div class="space-y-3 font-mono text-xs mt-2">
                        <div class="bg-zinc-900 p-2.5 rounded border border-zinc-800">
                            <span class="text-yellow-400 block font-bold">1. Conexion.java</span>
                            <p class="text-zinc-400 text-[11px] mt-0.5">Establece el puente JDBC usando parámetros SSL exigidos por Render para transmisiones cifradas, e implementa una rutina de verificación que crea automáticamente la tabla de usuarios si esta no se encuentra en el servidor.</p>
                        </div>
                        <div class="bg-zinc-900 p-2.5 rounded border border-zinc-800">
                            <span class="text-yellow-400 block font-bold">2. RegistroController.java</span>
                            <p class="text-zinc-400 text-[11px] mt-0.5">Recibe los datos mediante el método POST, prepara una sentencia segura SQL para evitar inyecciones, e inserta las nuevas credenciales de forma permanente en PostgreSQL.</p>
                        </div>
                        <div class="bg-zinc-900 p-2.5 rounded border border-zinc-800">
                            <span class="text-yellow-400 block font-bold">3. LoginController & LogoutController.java</span>
                            <p class="text-zinc-400 text-[11px] mt-0.5">El primero busca coincidencias en la base de datos; si la encuentra, inicializa un objeto <code>HttpSession</code> para recordar al usuario. El segundo destruye este objeto mediante <code>session.invalidate()</code> al cerrar la sesión.</p>
                        </div>
                    </div>
                `
            }
        };

        function actualizarSubImagen(index) {
            subImagenActual = index;
            const data = manualData[seccionActual];
            if (!data) return;
            
            // Corrección en la concatenación de la ruta del contexto web
            const rutaBase = "${pageContext.request.contextPath}/assets/";
            document.getElementById('img-visor').src = rutaBase + data.imagenes[index];
            
            // Actualizar estados de selección en los botones pequeños
            const botones = document.querySelectorAll('.btn-sub-img');
            botones.forEach((btn, i) => {
                if (i === index) {
                    btn.classList.add('bg-yellow-500', 'text-black', 'border-yellow-500');
                    btn.classList.remove('bg-zinc-900', 'text-zinc-400');
                } else {
                    btn.classList.remove('bg-yellow-500', 'text-black', 'border-yellow-500');
                    btn.classList.add('bg-zinc-900', 'text-zinc-400');
                }
            });
        }

        function renderizarSeccion() {
            const data = manualData[seccionActual];
            if (!data) return;

            // Inyectar título de módulo interactivo
            document.getElementById('txt-modulo').innerText = data.modulo;
            
            // Limpiar y reconstruir los controles de capturas
            const contenedorControles = document.getElementById('controles-imagenes');
            contenedorControles.innerHTML = '';
            
            data.imagenes.forEach((img, index) => {
                const btn = document.createElement('button');
                btn.className = "btn-sub-img px-2.5 py-0.5 rounded border border-zinc-800 text-[11px] font-mono font-bold transition-all";
                btn.innerText = "Captura " + (index + 1);
                btn.title = data.textosImagenes[index];
                btn.onclick = function() { actualizarSubImagen(index); };
                contenedorControles.appendChild(btn);
            });

            // Cambiar los textos descriptivos inferiores
            document.getElementById('contenido-dinamico').innerHTML = data.explicacion;

            // Inicializar siempre apuntando a la primera captura del bloque
            actualizarSubImagen(0);
        }

        function cambiarSeccion(id) {
            seccionActual = id;
            
            // Resetear clases de navegación activa del menú lateral
            for (let i = 1; i <= 3; i++) {
                const btn = document.getElementById("btn-sec-" + i);
                if (btn) btn.classList.remove('nav-active');
            }
            
            const btnActivo = document.getElementById("btn-sec-" + id);
            if (btnActivo) btnActivo.classList.add('nav-active');

            // Efecto visual rápido de transición en el visor
            const imgVisor = document.getElementById('img-visor');
            if (imgVisor) {
                imgVisor.style.opacity = '0.3';
                setTimeout(() => {
                    renderizarSeccion();
                    imgVisor.style.opacity = '1';
                }, 80);
            }
        }

        // Ejecución inmediata al cargar el entorno DOM
        window.onload = function() {
            renderizarSeccion();
        };
    </script>
</body>
</html>