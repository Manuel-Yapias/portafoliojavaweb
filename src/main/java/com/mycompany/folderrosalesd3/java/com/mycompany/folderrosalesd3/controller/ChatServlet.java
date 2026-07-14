package com.mycompany.folderrosalesd3.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ChatServlet")
public class ChatServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String API_URL = "https://generativelanguage.googleapis.com/v1beta/openai/chat/completions";
    private static final String API_KEY = "AIzaSyBNilwAvSRJt5n0QoXAJ7tSQOrMjEYIA8c"; 
    private static final String MODEL = "gemini-2.5-flash"; 

    // Este método procesará la solicitud sin importar si entra por GET o por POST
    private void procesarPeticion(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        
        String userMsg = request.getParameter("msg");
        if (userMsg == null || userMsg.trim().isEmpty()) {
            out.print("{\"reply\": \"No enviaste ningún mensaje.\", \"isSystem\": false}");
            return;
        }

        try {
            String escapedMsg = userMsg.replace("\\", "\\\\")
                                       .replace("\"", "\\\"")
                                       .replace("\n", "\\n")
                                       .replace("\r", "\\r");
            
            String jsonPayload = "{"
                + "\"model\": \"" + MODEL + "\","
                + "\"messages\": ["
                + "  {\"role\": \"system\", \"content\": \"Eres un asistente virtual integrado en el portafolio web de Manuel Rosales Yapias. Eres ingenioso, amigable, conoces de programación en Java y respondes de forma breve (máximo 2 o 3 líneas).\"},"
                + "  {\"role\": \"user\", \"content\": \"" + escapedMsg + "\"}"
                + "],"
                + "\"temperature\": 0.7"
                + "}";

            HttpClient client = HttpClient.newHttpClient();
            HttpRequest apiRequest = HttpRequest.newBuilder()
                    .uri(URI.create(API_URL))
                    .header("Content-Type", "application/json")
                    .header("Authorization", "Bearer " + API_KEY)
                    .POST(HttpRequest.BodyPublishers.ofString(jsonPayload))
                    .build();

            HttpResponse<String> apiResponse = client.send(apiRequest, HttpResponse.BodyHandlers.ofString());
            
            int statusCode = apiResponse.statusCode();
            String responseBody = apiResponse.body();
            String replyText;

            if (statusCode == 200) {
                replyText = extractContent(responseBody);
            } else if (statusCode == 401 || statusCode == 403) {
                replyText = "Error de autorización: Verifica que tu API Key de Gemini sea válida.";
            } else if (statusCode == 429) {
                replyText = "Demasiadas solicitudes. Por favor, espera un momento antes de volver a preguntar.";
            } else {
                replyText = "Error " + statusCode + " al conectar con Gemini.";
            }

            String escapedReply = replyText.replace("\\", "\\\\")
                                           .replace("\"", "\\\"")
                                           .replace("\n", " ")
                                           .replace("\r", "");

            out.print(String.format("{\"reply\": \"%s\", \"isSystem\": false}", escapedReply));

        } catch (Exception e) {
            e.printStackTrace();
            out.print("{\"reply\": \"Error en el servidor Java: " + e.getMessage().replace("\"", "\\\"") + "\", \"isSystem\": false}");
        }
        out.flush();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        procesarPeticion(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        procesarPeticion(request, response);
    }
    
    private String extractContent(String json) {
        try {
            String searchKey = "\"content\":\"";
            int startIndex = json.indexOf(searchKey);
            
            if (startIndex == -1) {
                if (json.contains("\"message\":")) {
                    int msgStart = json.indexOf("\"message\":\"") + 11;
                    int msgEnd = json.indexOf("\"", msgStart);
                    if (msgStart != -1 && msgEnd != -1) {
                        return json.substring(msgStart, msgEnd);
                    }
                }
                return "No pude comprender la respuesta del servidor.";
            }
            
            startIndex += searchKey.length();
            int endIndex = json.indexOf("\"", startIndex);
            
            while (endIndex != -1 && json.charAt(endIndex - 1) == '\\') {
                endIndex = json.indexOf("\"", endIndex + 1);
            }
            
            if (endIndex == -1) return "Respuesta de la IA con formato incompleto.";
            
            return json.substring(startIndex, endIndex)
                       .replace("\\n", " ")
                       .replace("\\t", " ")
                       .replace("\\\"", "\"")
                       .replace("\\\\", "\\");
                                 
        } catch (Exception e) {
            return "Error procesando respuesta: " + e.getMessage();
        }
    }
}