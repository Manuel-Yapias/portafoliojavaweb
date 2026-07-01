<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portafolio Avanzado MVC - Manuel Rosales</title>
    
    <!-- CDNs Oficiales de Frameworks -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    
    <!-- Hoja de estilos -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="tech-portfolio">

    <!-- ==========================================================================
       1. HEADER BANNER - CONTROL DE MARCA INSTITUCIONAL & ACCESO
       ========================================================================== -->
    <header class="main-header-banner">
        <div class="header-overlay-circles"></div>
        <div class="container d-flex align-items-center justify-content-between position-relative py-3">
            
            <!-- LOGO IZQUIERDO (INSTITUTO) -->
            <div class="academic-seal-box">
                <div class="seal-circle">
                    <img src="assets/instituto.png" alt="Logo Instituto" class="real-tech-logo">
                </div>
            </div>
            
            <!-- IDENTIDAD CENTRAL -->
            <div class="student-identity text-center">
                <h1 class="student-name">ROSALES YAPIAS MANUEL</h1>
                <p class="course-label">LENGUAJE DE PROGRAMACIÓN</p>
            </div>
            
            <!-- LOGO DERECHO Y ACCESO ADMINISTRATIVO -->
            <div class="d-flex align-items-center gap-3">
                <button class="btn btn-login-nav" id="btn-open-login">
                    <i class="bi bi-shield-lock-fill me-2"></i>Login
                </button>
                <div class="institution-logo-box">
                    <div class="inst-circle">
                        <img src="assets/carrera.png" alt="Logo Carrera" class="real-tech-logo">
                    </div>
                </div>
            </div>
        </div>
    </header>

        <!-- ==========================================================================
           2. CUERPO PRINCIPAL INTERACTIVO (REPOSITORIO)
           ========================================================================== -->
        <div class="portfolio-layout container my-5">
            <div class="row g-4">

                <main class="col-lg-8">
                    <div class="tech-folder-card">
                        <div class="folder-tab">
                            <i class="bi bi-folder-fill me-2"></i>
                            <span id="folder-repo-name">PROYECTO_JAVA_ENTERPRISE</span>
                        </div>

                        <div class="folder-body">
                            <div class="row align-items-center">

                                <div class="col-md-5 mb-4 mb-md-0">
                                    <div class="code-mockup-frame">
                                        <div class="mockup-header-dots">
                                            <span class="dot-m red"></span><span class="dot-m yellow"></span><span class="dot-m green"></span>
                                        </div>
                                        <div class="mockup-interior-box text-center py-5">
                                            <div class="preview-icon-wrapper mb-3">
                                                <i id="week-icon" class="bi bi-cpu-fill"></i>
                                            </div>
                                            <div class="tech-tags-container" id="week-tags"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-7 ps-md-4">
                                    <div class="week-text-m">
                                        <span class="week-badge-top" id="week-number">SEMANA 01</span>
                                        <h3 class="week-main-title" id="week-title">Título de la Semana</h3>
                                        <div class="mt-4">
    <a href="html/semana01/ejerciciomaestro.jsp" class="btn btn-primary w-100 mb-2">
        Ir a Ejercicios de la Semana 01
    </a>
</div>
                                    </div>

                                    <div class="mt-3">
                                        <button class="btn btn-manual-semanal" id="btn-open-manual">
                                            <i class="bi bi-journal-code me-2"></i> Ver Manual de la Semana
                                        </button>
                                    </div>

                                    <div class="activities-grid mt-4" id="activities-container"></div>
                                </div>

                            </div>
                        </div>

                        <button class="nav-arrow-control left-arrow" onclick="cambiarSemana(-1)">
                            <i class="bi bi-chevron-left"></i>
                        </button>
                        <button class="nav-arrow-control right-arrow" onclick="cambiarSemana(1)">
                            <i class="bi bi-chevron-right"></i>
                        </button>
                    </div>
                </main>

            <!-- ==========================================================================
               3. SIDEBAR DE ASISTENCIA VIRTUAL (CHATBOT)
               ========================================================================== -->
            <aside class="col-lg-4">
                <div class="sidebar-assistant-card">
                    <div class="assistant-header-bar d-flex align-items-center">
                        <div class="assistant-avatar"><i class="bi bi-robot"></i></div>
                        <div class="assistant-status">
                            <h6>Asistente IA Real</h6>
                            <span id="ai-status">NÚCLEO ACTIVO</span>
                        </div>
                    </div>
                    
                    <div class="assistant-chat-body" id="chat-box-body">
                        <div class="chat-bubble bot-msg">
                            <p style="color: #ffffff !important;">¡Hola Manuel! Soy tu asistente inteligente. Pregúntame sobre programación, tu estructura en NetBeans, Servlets o lo que necesites.</p>
                        </div>
                    </div>
                    
                    <div class="chat-footer-input">
                        <form id="chat-form" class="input-group">
    <input type="text" id="chat-user-input" class="form-control" placeholder="Escribe un mensaje aquí..." required autocomplete="off">
    <button type="submit" id="btn-submit-chat" class="btn btn-send-mock">
        <i class="bi bi-send-fill"></i>
    </button>
</form>
                    </div>
                </div>
            </aside>
            
        </div>
    </div>

    <!-- ==========================================================================
       4. VENTANAS MODALES (LOGINS Y MANUALES)
       ========================================================================== -->
    
    <!-- MODAL DE LOGIN -->
    <div class="custom-modal-overlay" id="login-modal">
        <div class="custom-modal-box form-modal">
            <div class="modal-box-header">
                <h4><i class="bi bi-shield-lock me-2"></i> Panel de Autenticación</h4>
                <button class="btn-close-modal" id="btn-close-login">&times;</button>
            </div>
            <div class="modal-box-body">
                <form action="#" method="POST" onsubmit="event.preventDefault(); alert('Modo demo activo');" class="auth-tech-form">
                    <p class="form-instructions text-muted small mb-3">Sección administrativa temporal para simular accesos de docente.</p>
                    <div class="mb-3">
                        <label class="form-label text-white small fw-bold">Usuario</label>
                        <div class="input-group">
                            <span class="input-group-text bg-dark border-secondary text-white"><i class="bi bi-person"></i></span>
                            <input type="text" class="form-control" placeholder="mrosales" required>
                        </div>
                    </div>
                    <div class="mb-4">
                        <label class="form-label text-white small fw-bold">Contraseña</label>
                        <div class="input-group">
                            <span class="input-group-text bg-dark border-secondary text-white"><i class="bi bi-key"></i></span>
                            <input type="password" class="form-control" placeholder="••••••••" required>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-submit-auth w-100">
                        <i class="bi bi-box-arrow-in-right me-2"></i>Ingresar al Sistema
                    </button>
                </form>
            </div>
        </div>
    </div>

    <!-- MODAL DE MANUALES TÉCNICOS -->
    <div class="custom-modal-overlay" id="manual-modal">
        <div class="custom-modal-box">
            <div class="modal-box-header">
                <h4><i class="bi bi-terminal-box me-2"></i> <span id="modal-manual-title">Manual Técnico</span></h4>
                <button class="btn-close-modal" id="btn-close-manual">&times;</button>
            </div>
            <div class="modal-box-body" id="modal-manual-body"></div>
        </div>
    </div>

    <!-- ==========================================================================
       5. CONTROLADOR SCRIPT (LÓGICA DEL CLIENTE E IA DE 14 SEMANAS)
       ========================================================================== -->
    <script>
        const AMBIENTE_GEMINI_KEY = 'TU_API_KEY_AQUI'; 
        // --- SISTEMA DEL CHATBOT CON ALTO CONTRASTE FORZADO ---
function appendMsg(text, type) {
    const bubble = document.createElement("div");
    bubble.className = "chat-bubble " + type;
    bubble.innerHTML = '<p style="color: #ffffff !important; display: block; margin: 0; padding: 0;">' + text + '</p>';
    
    const chatBody = document.getElementById("chat-box-body");
    chatBody.appendChild(bubble);
    chatBody.scrollTop = chatBody.scrollHeight;
}

// Forzamos al navegador a registrar los eventos del chat pase lo que pase
document.addEventListener("DOMContentLoaded", function() {
    // Aseguramos que los elementos existan antes de mover nada
    const chatForm = document.getElementById("chat-form");
    const userInput = document.getElementById("chat-user-input");
    const chatBody = document.getElementById("chat-box-body");

    if (!chatForm || !userInput || !chatBody) {
        console.warn("Faltan elementos del chat en el HTML.");
        return;
    }

    chatForm.addEventListener("submit", function(e) {
        e.preventDefault();
        
        const text = userInput.value.trim();
        if (!text) return;

        try {
            // 1. Insertar mensaje del usuario
            const userBubble = document.createElement("div");
            userBubble.className = "chat-bubble user-msg";
            userBubble.innerHTML = '<p style="color: #ffffff !important; display: block; margin: 0;">' + text + '</p>';
            chatBody.appendChild(userBubble);
            userInput.value = "";
            chatBody.scrollTop = chatBody.scrollHeight;

            // 2. Insertar burbuja de carga
            const loadingBubble = document.createElement("div");
            loadingBubble.className = "chat-bubble bot-msg thinking";
            loadingBubble.innerHTML = '<p style="color: #00d2ff !important; margin:0;"><i class="bi bi-cpu me-2"></i> Procesando...</p>';
            chatBody.appendChild(loadingBubble);
            chatBody.scrollTop = chatBody.scrollHeight;

            // 3. Respuesta simulada inmune a fallos
            setTimeout(function() {
                if (chatBody.contains(loadingBubble)) {
                    chatBody.removeChild(loadingBubble);
                }
                
                let respuesta = "Recibí tu consulta: " + text + ". El núcleo Java Web está respondiendo correctamente.";
                const cleanText = text.toLowerCase();
                
                if (cleanText.includes("hola") || cleanText.includes("buenos")) {
                    respuesta = "¡Hola Manuel! He analizado tu portafolio de 14 semanas en NetBeans. ¿Qué tema deseas revisar?";
                } else if (cleanText.includes("servlet") || cleanText.includes("mvc")) {
                    respuesta = "Recuerda que un Servlet extiende de HttpServlet y captura parámetros usando request.getParameter().";
                }
                
                const botBubble = document.createElement("div");
                botBubble.className = "chat-bubble bot-msg";
                botBubble.innerHTML = '<p style="color: #ffffff !important; display: block; margin: 0;">' + respuesta + '</p>';
                chatBody.appendChild(botBubble);
                chatBody.scrollTop = chatBody.scrollHeight;
            }, 600);

        } catch (err) {
            console.error("Error en el flujo del chat: ", err);
        }
    });
});

        function appendMsg(text, type) {
            const bubble = document.createElement("div");
            bubble.className = `chat-bubble ${type}`;
            // Forzado explícito de color inline en las etiquetas p para que hereden blanco puro sin importar la herencia CSS
            bubble.innerHTML = `<p style="color: #ffffff !important; display: block; margin: 0;">${text}</p>`;
            chatBody.appendChild(bubble);
            chatBody.scrollTop = chatBody.scrollHeight;
        }

        // Lógica de Modales
        const manualModal = document.getElementById("manual-modal");
        const loginModal = document.getElementById("login-modal");

        document.getElementById("btn-open-manual").addEventListener("click", () => manualModal.classList.add("active"));
        document.getElementById("btn-close-manual").addEventListener("click", () => manualModal.classList.remove("active"));
        document.getElementById("btn-open-login").addEventListener("click", () => loginModal.classList.add("active"));
        document.getElementById("btn-close-login").addEventListener("click", () => loginModal.classList.remove("active"));

        window.onload = renderSemana;
    </script>
</body>
</html>