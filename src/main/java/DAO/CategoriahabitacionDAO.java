
package DAO;

import Controlador.ConexionCli;
import Modelo.Categoriahabitacion;
import Modelo.Cliente;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CategoriahabitacionDAO extends ConexionCli {
    public int insertarCategoriahabitacion(Categoriahabitacion c){
        int res = 0;
        try {
            this.conectar();
            String sql = "INSERT INTO Categoriahabitacion(Codigohabitacion, Tipohabitacion, Preciohabitacion) VALUES (?, ?, ?)";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, c.getCodigoHabitacion());
            pre.setString(2, c.getTipoHabitacion());
            pre.setDouble(3, c.getPrecioHabitacion());
            
            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al insertar "+e.getMessage());
        } finally {
            this.desconectar();
        }
        
        return res;
    }
    
    public ArrayList<Categoriahabitacion> mostrarCategoriahabitacion(){
        ArrayList<Categoriahabitacion> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT idCategoriahabitacion, Codigohabitacion, Tipohabitacion, Preciohabitacion FROM categoriahabitacion";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            ResultSet rs;
            rs = pre.executeQuery();
            while(rs.next()){
                Categoriahabitacion c = new Categoriahabitacion();
                c.setIdCategoriaHabitacion(rs.getInt(1));
                c.setCodigoHabitacion(rs.getString(2));
                c.setTipoHabitacion(rs.getString(3));
                c.setPrecioHabitacion(rs.getDouble(4));
                
                lista.add(c);
            }
        } catch (SQLException e) {
            System.out.println("Error al mostrar "+e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }
    
    public int modificarCategoriahabitacion(Categoriahabitacion c){
        int res = 0;
        try {
            this.conectar();
            String sql = "UPDATE Categoriahabitacion SET Codigohabitacion=?, Tipohabitacion=?, Preciohabitacion=? WHERE idCategoriahabitacion=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, c.getCodigoHabitacion());
            pre.setString(2, c.getTipoHabitacion());
            pre.setDouble(3, c.getPrecioHabitacion());
            pre.setInt(4, c.getIdCategoriaHabitacion());
            
            res = pre.executeUpdate();            
        } catch (SQLException e) {
            System.out.println("Error al modificar "+e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }    
    
    public int eliminarCategoriahabitacion(Categoriahabitacion c){
        int res = 0;
        try {
            this.conectar();
            String sql = "DELETE FROM Categoriahabitacion WHERE idCategoriahabitacion=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, c.getIdCategoriaHabitacion());
            
            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al eliminar "+e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }
}
