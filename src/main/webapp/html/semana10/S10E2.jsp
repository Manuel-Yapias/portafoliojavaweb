<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.folderrosalesd3.model.semana10.S10E2Model" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>S10E2 - Limpiador</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        :root { --dorado: #ffcc00; --fondo: #0a0a0a; }
        body { background-color: var(--fondo); color: white; font-family: 'Courier New', monospace; }
    </style>
</head>
<body class="p-10 flex justify-center">
    <div class="max-w-md w-full bg-zinc-950 p-8 border border-zinc-800 rounded-lg shadow-2xl">
        <h2 class="text-xl font-bold text-[var(--dorado)] mb-6 text-center uppercase tracking-widest">♣ Limpiador de String</h2>
        
        <form action="${pageContext.request.contextPath}/S10E2Controller" method="POST" class="space-y-4">
            <textarea name="texto" required placeholder="Escribe un texto con espacios desordenados..." class="w-full bg-black border border-zinc-700 p-2 text-white h-32"></textarea>
            <button type="submit" class="w-full bg-[var(--dorado)] text-black font-bold py-2 uppercase hover:bg-yellow-500 transition-all">Limpiar Texto</button>
        </form>

        <% S10E2Model res = (S10E2Model) request.getAttribute("resultado");
           if (res != null) { %>
            <div class="mt-6 p-4 border border-[var(--dorado)] bg-zinc-900 text-sm">
                <span class="text-gray-500 uppercase text-[10px]">Resultado procesado:</span>
                <p class="text-white mt-1 break-words italic">"<%= res.getTextoProcesado() %>"</p>
            </div>
        <% } %>
    </div>
</body>
</html>