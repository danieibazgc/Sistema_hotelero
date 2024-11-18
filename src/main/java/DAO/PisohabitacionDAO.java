
package DAO;

import Controlador.ConexionCli;
import Modelo.Pisohabitacion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PisohabitacionDAO extends ConexionCli {
    public int insertarPisohabitacion(Pisohabitacion p){
        int res = 0;
        try {
            this.conectar();
            String sql = "INSERT INTO Pisohabitacion(Codigopisohabitacion, Nombrenivel, Cantidadhabitacion) VALUES (?, ?, ?)";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, p.getCodigoPisoHabitacion());
            pre.setString(2, p.getNombreNivel());
            pre.setInt(3, p.getCantidadHabitacion());
            
            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al insertar "+e.getMessage());
        } finally {
            this.desconectar();
        }
        
        return res;
    }
    
    public ArrayList<Pisohabitacion> mostrarPisohabitacion(){
        ArrayList<Pisohabitacion> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT idPisohabitacion, Codigopisohabitacion, Nombrenivel, Cantidadhabitacion FROM Pisohabitacion";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            ResultSet rs;
            rs = pre.executeQuery();
            while(rs.next()){
                Pisohabitacion p = new Pisohabitacion();
                p.setIdPisoHabitacion(rs.getInt(1));
                p.setCodigoPisoHabitacion(rs.getString(2));
                p.setNombreNivel(rs.getString(3));
                p.setCantidadHabitacion(rs.getInt(4));
                
                lista.add(p);
            }
        } catch (SQLException e) {
            System.out.println("Error al mostrar "+e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }
    
    public int modificarPisohabitacion(Pisohabitacion p){
        int res = 0;
        try {
            this.conectar();
            String sql = "UPDATE Pisohabitacion SET Codigopisohabitacion = ?, Nombrenivel = ?, Cantidadhabitacion = ? WHERE idPisohabitacion = ?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, p.getCodigoPisoHabitacion());
            pre.setString(2, p.getNombreNivel());
            pre.setInt(3, p.getCantidadHabitacion());
            pre.setInt(4, p.getIdPisoHabitacion());
            
            res = pre.executeUpdate();            
        } catch (SQLException e) {
            System.out.println("Error al modificar "+e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }    
    
    public int eliminarPisohabitacion(Pisohabitacion p){
        int res = 0;
        try {
            this.conectar();
            String sql = "DELETE FROM Pisohabitacion WHERE idPisohabitacion=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, p.getIdPisoHabitacion());
            
            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al eliminar "+e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }
}
