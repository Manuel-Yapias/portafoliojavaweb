package com.mycompany.folderrosalesd3.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Conexion {
    
    // AQUÍ PEGAS LOS DATOS DE TU PESTAÑA "INFO" DE RENDER:
    private static final String HOST = "postgresql://db_portafolio_6ee3_user:MZuscC8s9LmpVoD2D2q4VTD630WiIWIY@dpg-d92j6gcvikkc738g2gk0-a.virginia-postgres.render.com/db_portafolio_6ee3";
    private static final String DB_NAME = "db_portafolio_6ee3";
    private static final String USER = "db_portafolio_6ee3_user";
    private static final String PASS = "MZuscC8s9LmpVoD2D2q4VTD630WiIWIY";
    private static final String PORT = "5432"; // El puerto por defecto de Postgres es 5432

    public static Connection getConexion() throws SQLException {
        try {
            Class.forName("org.postgresql.Driver");
            String url = "jdbc:postgresql://" + HOST + ":" + PORT + "/" + DB_NAME + "?sslmode=require&sslfactory=org.postgresql.ssl.NonValidatingFactory";
            return DriverManager.getConnection(url, USER, PASS);
        } catch (ClassNotFoundException e) {
            throw new SQLException("Driver no encontrado: " + e.getMessage());
        }
    }

    // Este truco creará la tabla automáticamente la primera vez que te conectes
    public static void crearTablaUsuariosSiNoExiste() {
        String sql = "CREATE TABLE IF NOT EXISTS usuarios ("
                   + "id SERIAL PRIMARY KEY, "
                   + "username VARCHAR(50) UNIQUE NOT NULL, "
                   + "password VARCHAR(255) NOT NULL"
                   + ");";
        try (Connection con = getConexion(); Statement stmt = con.createStatement()) {
            stmt.execute(sql);
            System.out.println("Tabla 'usuarios' verificada/creada con éxito.");
        } catch (SQLException e) {
            System.err.println("Error al verificar la tabla: " + e.getMessage());
        }
    }
}