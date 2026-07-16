<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Casino VIP - Enmascarador de Tarjetas</title>
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
        .border-gold { border-color: var(--dorado); }
        .text-gold { color: var(--dorado); }
        .bg-gold-hover:hover { background-color: var(--dorado-apagado); }
        .text-poker { color: var(--rojo-poker); }
    </style>
</head>
<body class="min-h-screen flex flex-col justify-between p-4 md:p-8">

    <header class="max-w-4xl mx-auto w-full text-center my-6">
        <h1 class="text-4xl font-extrabold tracking-wider text-gold uppercase border-b-2 border-gold pb-4 inline-block">
            ♠ CASINO VAULT - CARD ENCRYPTOR ♣
        </h1>
        <p class="text-gray-400 mt-2 text-sm">Semana 7 - Ejercicio 1 (Métodos String: substring() y repeat())</p>
    </header>

    <main class="max-w-md mx-auto w-full bg-neutral-900 bg-opacity-80 p-8 rounded-2xl border border-neutral-800 shadow-2xl">
        
        <% if (request.getAttribute("error") != null) { %>
            <div class="mb-6 bg-red-950 border-l-4 border-red-500 text-red-200 p-4 rounded text-sm" role="alert">
                <p class="font-bold">Error de Validación</p>
                <p><%= request.getAttribute("error") %></p>
            </div>
        <% } %>

        <form action="${pageContext.request.contextPath}/S7E1Controller" method="POST" class="space-y-6">
            <div>
                <label for="numeroTarjeta" class="block text-xs font-semibold uppercase tracking-wider text-gold mb-2">
                    Número de Tarjeta de Crédito (16 dígitos):
                </label>
                <input type="text" id="numeroTarjeta" name="numeroTarjeta" 
                       placeholder="4509123456784589" 
                       maxlength="19"
                       class="w-full bg-black border border-neutral-700 rounded-lg py-3 px-4 text-white font-mono tracking-widest text-center focus:outline-none focus:border-yellow-400 transition-colors">
            </div>

            <button type="submit" 
                    class="w-full bg-yellow-500 text-black font-bold py-3 px-6 rounded-lg tracking-widest uppercase transition-all duration-200 bg-gold-hover hover:scale-[1.01] shadow-lg">
                ♦ Enmascarar y Proteger ♦
            </button>
        </form>

        <% if (request.getAttribute("exito") != null) { %>
            <div class="mt-8 space-y-4">
                <div class="bg-neutral-950 p-6 rounded-xl border border-neutral-800 text-center relative overflow-hidden">
                    <div class="absolute top-0 right-0 bg-yellow-500 text-black font-bold text-[9px] px-2 py-0.5 uppercase rounded-bl">
                        Secure SSL
                    </div>
                    <span class="text-[10px] text-neutral-500 block uppercase tracking-widest mb-2">Firma Digital Generada</span>
                    
                    <p class="text-2xl font-mono text-gold tracking-widest my-3">
                        <%= request.getAttribute("tarjetaEnmascarada") %>
                    </p>

                    <div class="flex justify-between items-center text-[10px] text-neutral-400 border-t border-neutral-800 pt-3 mt-3">
                        <span>ESTADO: CIFRADO</span>
                        <span class="text-green-400">PRONTO PARA DEPOSITAR</span>
                    </div>
                </div>
            </div>
        <% } %>

    </main>

    <footer class="text-center py-6 text-xs text-neutral-600">
        &copy; 2026 Casino Deck Controller. Seguridad de Cuentas y Tarjetas.
    </footer>

</body>
</html>