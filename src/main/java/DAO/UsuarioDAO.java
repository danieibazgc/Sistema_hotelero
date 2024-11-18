// DAO/UsuarioDAO.java
package DAO;

import Interfaces.IUsuarioDAO;
import Modelo.Usuario;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuarioDAO implements IUsuarioDAO {

    private Connection connection;

    public UsuarioDAO() {
        // Configuración de la conexión
        String url = "jdbc:mysql://localhost:3306/sigh_hoteldg";
        String driver = "com.mysql.jdbc.Driver";
        String user = "root";
        String password = "";

        try {
            // Cargar el driver JDBC
            Class.forName(driver);

            // Establecer la conexión
            connection = DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean validarUsuario(Usuario usuario) {
        boolean estado = false;
        String sql = "SELECT * FROM administrador WHERE Email = ? AND password = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, usuario.getEmail());
            preparedStatement.setString(2, usuario.getPassword());
            try (ResultSet rs = preparedStatement.executeQuery()) {
                estado = rs.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return estado;
    }

    @Override
    public boolean registrarUsuario(Usuario usuario) {
        String sql = "INSERT INTO administrador (username, Email, password) VALUES (?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, usuario.getUsername());
            preparedStatement.setString(2, usuario.getEmail());
            preparedStatement.setString(3, usuario.getPassword());

            // Ejecutar la consulta de inserción
            int filasAfectadas = preparedStatement.executeUpdate();

            // Si se insertó al menos una fila, devolver true
            return filasAfectadas > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    
    public Usuario obtenerUsuarioPorEmail(String email) {
        Usuario usuario = null;
        String sql = "SELECT * FROM administrador WHERE Email = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, email);
            try (ResultSet rs = preparedStatement.executeQuery()) {
                if (rs.next()) {
                    usuario = new Usuario();
                    usuario.setEmail(rs.getString("email"));
                    usuario.setUsername(rs.getString("username"));
                    usuario.setPassword(rs.getString("password"));
                    // establece otros campos si es necesario
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuario;
    }
}
