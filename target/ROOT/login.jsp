<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Acceso del Sistema - Cyber Poker Terminal</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="css/style.css">
    
    <style>
        /* Animación de Levitación para la Carta */
        @keyframes floatCard {
            0% { transform: translateY(0px) rotateX(2deg) rotateY(-1deg); box-shadow: 0 15px 35px rgba(255, 204, 0, 0.05), 0 5px 15px rgba(0,0,0,0.5); }
            50% { transform: translateY(-10px) rotateX(1deg) rotateY(1deg); box-shadow: 0 25px 45px rgba(255, 204, 0, 0.15), 0 10px 25px rgba(0,0,0,0.6); }
            100% { transform: translateY(0px) rotateX(2deg) rotateY(-1deg); box-shadow: 0 15px 35px rgba(255, 204, 0, 0.05), 0 5px 15px rgba(0,0,0,0.5); }
        }

        /* Animación de parpadeo de neón para los títulos */
        @keyframes neonFlicker {
            0%, 19%, 21%, 23%, 25%, 54%, 56%, 100% {
                text-shadow: 0 0 4px rgba(255, 204, 0, 0.6), 0 0 12px rgba(255, 204, 0, 0.4);
            }
            20%, 24%, 55% {
                text-shadow: none;
                opacity: 0.7;
            }
        }

        /* Sutil línea de escaneo láser (cyberpunk) */
        @keyframes scanner {
            0% { top: 0%; opacity: 0; }
            10% { opacity: 0.5; }
            90% { opacity: 0.5; }
            100% { top: 100%; opacity: 0; }
        }

        /* Animación de símbolos flotando en el fondo */
        @keyframes floatSuits {
            0% { transform: translateY(100vh) rotate(0deg); opacity: 0; }
            10% { opacity: 0.12; }
            90% { opacity: 0.12; }
            100% { transform: translateY(-10vh) rotate(360deg); opacity: 0; }
        }

        .animated-card {
            perspective: 1000px;
            animation: floatCard 6s ease-in-out infinite;
            transition: all 0.5s ease;
        }

        .animated-card:hover {
            box-shadow: 0 30px 60px rgba(255, 204, 0, 0.25), 0 0 30px rgba(255, 51, 68, 0.1) !important;
        }

        .scan-line {
            position: absolute;
            left: 0;
            width: 100%;
            height: 2px;
            background: linear-gradient(90deg, transparent, rgba(255, 204, 0, 0.4), transparent);
            animation: scanner 4s linear infinite;
            pointer-events: none;
        }

        .neon-text-gold {
            animation: neonFlicker 5s infinite alternate;
        }

        .suit-particle {
            position: absolute;
            bottom: -50px;
            pointer-events: none;
            font-size: 2rem;
            animation: floatSuits linear infinite;
        }

        /* Estilo de inputs enfocados como láser */
        .input-cyber {
            transition: all 0.3s ease;
        }
        .input-cyber:focus {
            box-shadow: 0 0 15px rgba(255, 204, 0, 0.2);
            text-shadow: 0 0 5px rgba(255, 255, 255, 0.5);
        }
    </style>
</head>
<body class="min-h-screen flex items-center justify-center p-4 relative overflow-hidden">

    <div class="absolute inset-0 z-0 overflow-hidden select-none">
        <span class="suit-particle text-red-500/10" style="left: 10%; animation-duration: 18s; animation-delay: 0s;">♥</span>
        <span class="suit-particle text-gray-500/10" style="left: 30%; animation-duration: 22s; animation-delay: 3s;">♠</span>
        <span class="suit-particle text-red-500/10" style="left: 55%; animation-duration: 15s; animation-delay: 1s;">♦</span>
        <span class="suit-particle text-gray-500/10" style="left: 80%; animation-duration: 25s; animation-delay: 5s;">♣</span>
        <span class="suit-particle text-red-500/10" style="left: 20%; animation-duration: 20s; animation-delay: 8s;">♦</span>
        <span class="suit-particle text-gray-500/10" style="left: 70%; animation-duration: 17s; animation-delay: 10s;">♠</span>
    </div>

    <div class="absolute w-[500px] h-[500px] bg-radial-gradient from-[rgba(255,204,0,0.08)] to-transparent rounded-full blur-[100px] pointer-events-none z-0"></div>

    <div class="animated-card z-10 w-full max-w-md bg-[#111111]/95 border border-[#1f1f1f] p-8 rounded-md relative backdrop-blur-md">
        
        <div class="scan-line"></div>

        <div class="absolute top-3 left-3 text-left font-mono leading-none select-none pointer-events-none opacity-80">
            <span class="text-xs font-bold text-[var(--color-dorado-brillante)] block">A</span>
            <span class="text-sm text-white">♠</span>
        </div>
        <div class="absolute top-3 right-3 text-right font-mono leading-none select-none pointer-events-none opacity-80">
            <span class="text-xs font-bold text-[var(--color-dorado-brillante)] block">K</span>
            <span class="text-sm text-red-500">♦</span>
        </div>
        <div class="absolute bottom-3 left-3 text-left font-mono leading-none select-none pointer-events-none opacity-80">
            <span class="text-sm text-red-500 block">♥</span>
            <span class="text-xs font-bold text-[var(--color-dorado-brillante)]">Q</span>
        </div>
        <div class="absolute bottom-3 right-3 text-right font-mono leading-none select-none pointer-events-none opacity-80">
            <span class="text-sm text-white block">♣</span>
            <span class="text-xs font-bold text-[var(--color-dorado-brillante)]">J</span>
        </div>

        <div class="flex justify-center space-x-6 mb-8 border-b border-[#222222] pb-4 relative z-10">
            <button id="tab-login" onclick="switchTab('login')" 
                    class="text-[var(--color-dorado-brillante)] font-bold tracking-widest text-xs uppercase transition-all duration-300 border-b-2 border-[var(--color-dorado-brillante)] pb-2 focus:outline-none">
                ♦ [ INICIAR_SESION ]
            </button>
            <button id="tab-register" onclick="switchTab('register')" 
                    class="text-gray-500 font-bold tracking-widest text-xs uppercase transition-all duration-300 pb-2 hover:text-gray-300 focus:outline-none">
                ♥ [ CREAR_CUENTA ]
            </button>
        </div>

        <form id="form-login" action="login" method="POST" class="space-y-6 relative z-10">
            <div class="text-center mb-4">
                <h2 class="neon-text-gold text-2xl font-bold tracking-widest text-white" style="font-family: 'Orbitron', sans-serif;">
                    DECK_ACCESS
                </h2>
                <p class="text-[10px] text-gray-500 mt-1 uppercase tracking-[0.2em]">// IDENTIFICA TU FIRMA DIGITAL</p>
            </div>

            <% if ("fail".equals(request.getParameter("error"))) { %>
                <div class="border border-red-500/30 bg-red-950/20 text-red-400 text-[10px] p-3 text-center rounded-sm tracking-widest uppercase animate-pulse">
                    ⚠️ ACCESO DENEGADO / CREDENCIALES INVÁLIDAS
                </div>
            <% } %>

            <div>
                <label class="block text-[10px] uppercase tracking-[0.25em] text-gray-400 mb-2">♠ USUARIO_ID</label>
                <input type="text" name="usuario" required
                       class="input-cyber w-full bg-[#070707] border border-[#222] text-white px-4 py-3 rounded-sm focus:outline-none focus:border-[var(--color-dorado-brillante)] placeholder-gray-800 tracking-widest text-sm"
                       placeholder="SISTEMA_USER">
            </div>

            <div>
                <label class="block text-[10px] uppercase tracking-[0.25em] text-gray-400 mb-2">♣ CONTRASENA_KEY</label>
                <input type="password" name="contrasena" required
                       class="input-cyber w-full bg-[#070707] border border-[#222] text-white px-4 py-3 rounded-sm focus:outline-none focus:border-[var(--color-dorado-brillante)] placeholder-gray-800 tracking-widest text-sm"
                       placeholder="••••••••">
            </div>

            <button type="submit" 
                    class="w-full bg-gradient-to-r from-transparent via-[#1c1c1c] to-transparent border border-[var(--color-dorado-apagado)] hover:border-[var(--color-dorado-brillante)] hover:text-black hover:bg-[var(--color-dorado-brillante)] text-[var(--color-dorado-brillante)] font-bold py-3.5 px-4 rounded-sm tracking-widest transition-all duration-300 uppercase text-xs shadow-[0_0_10px_rgba(255,204,0,0.1)]">
                DEAL CARDS (ACCEDER)
            </button>
        </form>

        <form id="form-register" action="registrar" method="POST" class="space-y-6 hidden relative z-10">
            <div class="text-center mb-4">
                <h2 class="neon-text-gold text-2xl font-bold tracking-widest text-white" style="font-family: 'Orbitron', sans-serif;">
                    NEW_PLAYER
                </h2>
                <p class="text-[10px] text-gray-500 mt-1 uppercase tracking-[0.2em]">// ENTRA EN LA MESA DE DATOS</p>
            </div>

            <div>
                <label class="block text-[10px] uppercase tracking-[0.25em] text-gray-400 mb-2">♦ REGISTRAR_USER</label>
                <input type="text" name="usuario" required
                       class="input-cyber w-full bg-[#070707] border border-[#222] text-white px-4 py-3 rounded-sm focus:outline-none focus:border-[var(--color-dorado-brillante)] placeholder-gray-800 tracking-widest text-sm"
                       placeholder="NUEVO_JUGADOR">
            </div>

            <div>
                <label class="block text-[10px] uppercase tracking-[0.25em] text-gray-400 mb-2">♥ ESTABLECER_CLAVE</label>
                <input type="password" name="contrasena" required
                       class="input-cyber w-full bg-[#070707] border border-[#222] text-white px-4 py-3 rounded-sm focus:outline-none focus:border-[var(--color-dorado-brillante)] placeholder-gray-800 tracking-widest text-sm"
                       placeholder="••••••••">
            </div>

            <button type="submit" 
                    class="w-full bg-gradient-to-r from-transparent via-[#1c1c1c] to-transparent border border-[var(--color-dorado-apagado)] hover:border-[var(--color-dorado-brillante)] hover:text-black hover:bg-[var(--color-dorado-brillante)] text-[var(--color-dorado-brillante)] font-bold py-3.5 px-4 rounded-sm tracking-widest transition-all duration-300 uppercase text-xs shadow-[0_0_10px_rgba(255,204,0,0.1)]">
                JOIN TABLE (REGISTRAR)
            </button>
        </form>

        <div class="mt-8 text-center text-[9px] text-gray-600 tracking-[0.3em] uppercase">
            ♠ CASINO DATABASES SYSTEM v2.0 ♠
        </div>
    </div>

    <script>
        function switchTab(tab) {
            const btnLogin = document.getElementById('tab-login');
            const btnRegister = document.getElementById('tab-register');
            const formLogin = document.getElementById('form-login');
            const formRegister = document.getElementById('form-register');

            if (tab === 'login') {
                btnLogin.classList.add('text-[var(--color-dorado-brillante)]', 'border-b-2', 'border-[var(--color-dorado-brillante)]');
                btnLogin.classList.remove('text-gray-500');
                btnRegister.classList.add('text-gray-500');
                btnRegister.classList.remove('text-[var(--color-dorado-brillante)]', 'border-b-2', 'border-[var(--color-dorado-brillante)]');
                
                btnLogin.innerHTML = "♦ [ INICIAR_SESION ]";
                btnRegister.innerHTML = "[ CREAR_CUENTA ]";
                
                formLogin.classList.remove('hidden');
                formRegister.classList.add('hidden');
            } else {
                btnRegister.classList.add('text-[var(--color-dorado-brillante)]', 'border-b-2', 'border-[var(--color-dorado-brillante)]');
                btnRegister.classList.remove('text-gray-500');
                btnLogin.classList.add('text-gray-500');
                btnLogin.classList.remove('text-[var(--color-dorado-brillante)]', 'border-b-2', 'border-[var(--color-dorado-brillante)]');
                
                btnRegister.innerHTML = "♥ [ CREAR_CUENTA ]";
                btnLogin.innerHTML = "[ INICIAR_SESION ]";
                
                formRegister.classList.remove('hidden');
                formLogin.classList.add('hidden');
            }
        }
    </script>
</body>
</html>