
package DAO;

import Controlador.ConexionCli;
import Modelo.Usuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UsuarioTablaDAO extends ConexionCli {
    public int insertarUsuarios(Usuario u){
        int res = 0;
        try {
            this.conectar();
            String sql = "INSERT INTO administrador(username, email, password) VALUES (?, ?, ?)";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, u.getUsername());
            pre.setString(2, u.getEmail());
            pre.setString(3, u.getPassword());
            
            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al insertar "+e.getMessage());
        } finally {
            this.desconectar();
        }
        
        return res;
    }
    
    public ArrayList<Usuario> mostrarUsuarios(){
        ArrayList<Usuario> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT * FROM administrador";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            ResultSet rs;
            rs = pre.executeQuery();
            while(rs.next()){
                Usuario u = new Usuario();
                u.setUser_id(rs.getInt(1));
                u.setUsername(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setPassword(rs.getString(4));
                
                lista.add(u);
            }
        } catch (SQLException e) {
            System.out.println("Error al mostrar "+e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }
    
    public int modificarUsuarios(Usuario u){
        int res = 0;
        try {
            this.conectar();
            String sql = "UPDATE administrador SET username=?, email=?, password=? WHERE user_id=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, u.getUsername());
            pre.setString(2, u.getEmail());
            pre.setString(3, u.getPassword());
            pre.setInt(4, u.getUser_id());
            
            res = pre.executeUpdate();            
        } catch (SQLException e) {
            System.out.println("Error al modificar "+e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }    
    
    public int eliminarUsuarios(Usuario u){
        int res = 0;
        try {
            this.conectar();
            String sql = "DELETE FROM administrador WHERE user_id=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, u.getUser_id());
            
            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al eliminar "+e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }
}
