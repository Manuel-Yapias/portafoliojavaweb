<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            /* Fondo sutil con trama geométrica de casino */
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

        /* Botones laterales de navegación como fichas holográficas */
        .poker-nav-btn {
            background: rgba(18, 18, 18, 0.9);
            border: 1px solid var(--dorado-apagado);
            color: var(--dorado);
            transition: all 0.3s ease;
            box-shadow: 0 0 10px rgba(0,0,0,0.5);
        }
        .poker-nav-btn:hover {
            background: var(--dorado);
            color: #000;
            border-color: var(--dorado);
            box-shadow: 0 0 20px rgba(255, 204, 0, 0.5);
            transform: scale(1.1);
        }

        /* Efecto de brillo de mesa */
        .table-glow {
            border: 1px solid rgba(255, 204, 0, 0.15);
            box-shadow: 0 0 30px rgba(0,0,0,0.8), inset 0 0 20px rgba(255, 204, 0, 0.05);
        }
    </style>
</head>
<body class="min-h-screen flex flex-col p-4 md:p-6 justify-between">

    <header class="w-full max-w-[1300px] mx-auto flex items-center justify-between py-6 px-8 bg-[#0d0d0d] border border-[#1c1c1c] rounded-t-lg relative">
        
        <div class="poker-card-logo select-none">
            <div class="card-corner-val top-2 left-2.5 text-white">
                A<br><span class="text-xs">♠</span>
            </div>
            <div class="card-corner-val bottom-2 right-2.5 text-white text-right">
                ♠<br>A
            </div>
            <img src="assets/carrera.png" alt="Carrera" class="max-w-[42px] max-h-[42px] object-contain drop-shadow-[0_2px_4px_rgba(0,0,0,0.8)]">
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
            <img src="assets/instituto.png" alt="Instituto" class="max-w-[42px] max-h-[42px] object-contain drop-shadow-[0_2px_4px_rgba(0,0,0,0.8)]">
        </div>
    </header>

    <div class="w-full max-w-[1300px] mx-auto bg-[#111] border-x border-b border-[#1c1c1c] py-3 px-8 flex justify-between items-center text-xs font-mono text-gray-400">
        <div class="flex items-center space-x-2">
            <span class="inline-block w-2 h-2 rounded-full bg-emerald-500 animate-pulse"></span>
            <span>📡 Servidor Activo</span>
        </div>
        <div>
            <%
                String usuarioLogueado = (String) session.getAttribute("session_usuario");
                if (usuarioLogueado != null) {
            %>
                <span>En línea: <strong class="text-[var(--dorado)]"><%= usuarioLogueado %></strong></span>
                <span class="mx-2 text-gray-600">|</span>
                <a href="logout" class="text-[var(--rojo-poker)] hover:underline">Cerrar Sesión</a>
            <% } else { %>
                <a href="login.jsp" class="text-[var(--dorado)] hover:text-white transition-colors">🔑 Iniciar Sesión / Registrarse</a>
            <% } %>
        </div>
    </div>

    <main class="w-full max-w-[1300px] mx-auto mt-6 flex-1 flex items-center relative">
        
        <button class="poker-nav-btn absolute left-[-16px] z-20 w-12 h-12 rounded-full flex items-center justify-center text-lg focus:outline-none" 
                onclick="alert('Semana anterior')">
            ❮
        </button>

        <button class="poker-nav-btn absolute right-[-16px] z-20 w-12 h-12 rounded-full flex items-center justify-center text-lg focus:outline-none" 
                onclick="alert('Siguiente semana')">
            ❯
        </button>

        <div class="grid grid-cols-1 lg:grid-cols-12 gap-6 w-full px-2">
            
            <section class="lg:col-span-7 bg-[#111111]/95 border border-[#222] p-8 rounded-lg table-glow flex flex-col justify-between relative min-h-[500px]">
                <div>
                    <div class="text-[10px] tracking-widest text-gray-500 font-mono mb-4 uppercase">
                        🗀 PROYECTO_JAVA_ENTERPRISE
                    </div>

                    <div class="bg-[#080808] border border-[#222] rounded p-4 mb-6">
                        <div class="flex items-center space-x-1.5 mb-2">
                            <span class="w-2.5 h-2.5 rounded-full bg-red-500"></span>
                            <span class="w-2.5 h-2.5 rounded-full bg-yellow-500"></span>
                            <span class="w-2.5 h-2.5 rounded-full bg-green-500"></span>
                        </div>
                        <div class="text-[11px] text-gray-500 font-mono mb-3">// Cargando ambiente de pruebas...</div>
                        <div class="flex gap-2">
                            <span class="bg-[#151515] text-[10px] text-gray-400 px-2.5 py-1 rounded font-mono border border-[#222]">JAVA EE</span>
                            <span class="bg-[#151515] text-[10px] text-gray-400 px-2.5 py-1 rounded font-mono border border-[#222]">SPRING BOOT</span>
                            <span class="bg-[#151515] text-[10px] text-gray-400 px-2.5 py-1 rounded font-mono border border-[#222]">POSTGRES</span>
                        </div>
                    </div>

                    <div class="space-y-3">
                        <span class="inline-block bg-[var(--dorado-apagado)]/10 border border-[var(--dorado-apagado)] text-[var(--dorado)] text-[10px] font-mono px-3 py-1 rounded-full uppercase tracking-wider">
                            SEMANA ${numeroSemana != null ? numeroSemana : "N/A"}
                        </span>
                        <h2 class="text-2xl font-bold tracking-wide text-white uppercase">
                            Título: ${tituloSemana != null ? tituloSemana : "Título no asignado"}
                        </h2>
                        <p class="text-xs text-gray-400 leading-relaxed font-mono">
                            ${descripcionSemana != null ? descripcionSemana : "Sin descripción disponible para esta entrega."}
                        </p>
                    </div>
                </div>

                <div class="mt-8">
                    <h4 class="text-[10px] tracking-wider text-gray-500 font-mono mb-3 uppercase">♣ Actividades Programadas</h4>
                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-3">
                        <% 
                            java.util.List<String> listaActividades = (java.util.List<String>) request.getAttribute("listaActividades");
                            if (listaActividades != null && !listaActividades.isEmpty()) {
                                for (String actividad : listaActividades) {
                        %>
                            <button class="bg-[#090909] border border-[#222] hover:border-[var(--dorado)] text-left p-3 rounded text-xs text-gray-300 font-mono transition-colors flex justify-between items-center">
                                <span>🃏 <%= actividad %></span>
                                <span class="text-[var(--dorado)]">→</span>
                            </button>
                        <% 
                                }
                            } else {
                        %>
                            <div class="col-span-2 text-xs text-gray-600 font-mono italic">No hay actividades registradas para esta semana.</div>
                        <% } %>
                    </div>
                </div>
            </section>

            <section class="lg:col-span-5 bg-[#111111]/95 border border-[#222] rounded-lg table-glow flex flex-col h-[500px] overflow-hidden">
                <div class="bg-[#090909] border-b border-[#222] p-4 flex items-center space-x-3">
                    <div class="w-10 h-10 rounded-full border border-[var(--dorado-apagado)] bg-[#151515] flex items-center justify-center text-lg">
                        🤖
                    </div>
                    <div>
                        <h4 class="text-xs font-bold font-mono tracking-wider text-white">ASISTENTE VIRTUAL</h4>
                        <p class="text-[9px] text-emerald-500 font-mono flex items-center">
                            <span class="inline-block w-1.5 h-1.5 rounded-full bg-emerald-500 mr-1.5 animate-pulse"></span>
                            ● EN LÍNEA AHORA
                        </p>
                    </div>
                </div>

                <div class="flex-1 p-4 overflow-y-auto space-y-4 bg-[#070707]/60" id="chatContainer">
                    <div class="msg bot max-w-[85%] bg-[#151515] border border-[#222] p-3 rounded text-xs text-gray-300 font-mono leading-relaxed">
                        Hola, Manuel. He analizado el mazo de actividades. ¿Te gustaría consultar o reportar el progreso del código?
                    </div>
                </div>

                <div class="p-3 bg-[#0a0a0a] border-t border-[#222] flex space-x-2">
                    <input type="text" id="userInput" class="flex-1 bg-[#050505] border border-[#222] text-white px-3 py-2.5 rounded text-xs font-mono focus:outline-none focus:border-[var(--dorado)]" 
                           placeholder="Pregúntale algo a la IA..." onkeypress="evaluarEnter(event)">
                    <button class="bg-[var(--dorado-apagado)] hover:bg-[var(--dorado)] text-black font-bold text-xs px-4 rounded transition-colors font-mono" 
                            onclick="enviarMensaje()">
                        ENVIAR
                    </button>
                </div>
            </section>

        </div>
    </main>

    <footer class="w-full max-w-[1300px] mx-auto mt-8 text-center text-[10px] text-gray-600 tracking-[0.3em] uppercase py-4 border-t border-[#161616]">
        ♦ PORTAFOLIO ACADÉMICO - ROSALES YAPIAS MANUEL © 2026 ♦
    </footer>

<script>
function evaluarEnter(event) {
    if (event.key === "Enter") {
        enviarMensaje();
    }
}

function enviarMensaje() {
    const input = document.getElementById("userInput");
    const mensajeTexto = input.value.trim();
    if (mensajeTexto === "") return;

    const chatContainer = document.getElementById("chatContainer");

    // 1. Crear el mensaje del usuario con la estética de tu portafolio
    const userDiv = document.createElement("div");
    userDiv.className = "msg user"; 
    userDiv.style.alignSelf = "flex-end";
    userDiv.style.background = "#1d1d1d";
    userDiv.style.border = "1px solid #ffcc00"; // Borde dorado
    userDiv.style.color = "white";
    userDiv.style.padding = "12px 16px";
    userDiv.style.borderRadius = "10px";
    userDiv.style.maxWidth = "85%";
    userDiv.style.fontSize = "13px";
    userDiv.style.marginLeft = "auto";
    userDiv.style.marginBottom = "10px";
    userDiv.innerText = mensajeTexto;
    
    chatContainer.appendChild(userDiv);
    
    input.value = "";
    chatContainer.scrollTop = chatContainer.scrollHeight;

    // 2. Llamada AJAX usando POST
    fetch('${pageContext.request.contextPath}/ChatServlet', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: 'msg=' + encodeURIComponent(mensajeTexto)
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Código de estado HTTP: ' + response.status);
        }
        return response.json();
    })
    .then(data => {
        const botDiv = document.createElement("div");
        botDiv.className = "msg bot";
        botDiv.style.alignSelf = "flex-start";
        botDiv.style.background = "#151515";
        botDiv.style.border = "1px solid #222";
        botDiv.style.color = "#d1d5db";
        botDiv.style.padding = "12px 16px";
        botDiv.style.borderRadius = "10px";
        botDiv.style.maxWidth = "85%";
        botDiv.style.fontSize = "13px";
        botDiv.style.marginBottom = "10px";
        
        if (data.isSystem) {
            botDiv.innerHTML = `<div style="font-size: 10px; color: #ffcc00; margin-bottom: 4px;">⚙️ SISTEMA GEN</div>\${data.reply}`;
        } else {
            botDiv.innerText = data.reply;
        }
        
        chatContainer.appendChild(botDiv);
        chatContainer.scrollTop = chatContainer.scrollHeight;
    })
    .catch(error => {
        console.error("Detalle del error:", error);
        const errorDiv = document.createElement("div");
        errorDiv.className = "msg bot";
        errorDiv.style.alignSelf = "flex-start";
        errorDiv.style.background = "rgba(127, 29, 29, 0.2)";
        errorDiv.style.border = "1px solid rgba(153, 27, 27, 0.4)";
        errorDiv.style.color = "#f87171";
        errorDiv.style.padding = "12px 16px";
        errorDiv.style.borderRadius = "10px";
        errorDiv.style.maxWidth = "85%";
        errorDiv.style.fontSize = "12px";
        errorDiv.style.marginBottom = "10px";
        errorDiv.innerText = "Error de conexión (" + error.message + "). Asegúrate de compilar el Servlet.";
        
        chatContainer.appendChild(errorDiv);
        chatContainer.scrollTop = chatContainer.scrollHeight;
    });
}

document.addEventListener("DOMContentLoaded", function() {
    const header = document.querySelector("header");

    if (header) {
        header.addEventListener("click", function() {
            header.classList.add("sobrecarga");
            setTimeout(() => {
                header.classList.remove("sobrecarga");
            }, 1200);
        });
    }
});
</script>

</body>
</html>