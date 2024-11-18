
package DAO;

import Controlador.ConexionCli;
import Modelo.Producto;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductoDAO extends ConexionCli {
    public int insertarProductos(Producto p){
        int res = 0;
        try {
            this.conectar();
            String sql = "INSERT INTO Producto(CodProducto, NombreProducto, DescripcionProducto, TipoProducto, PrecioProducto, Stock, EstadoProducto) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, p.getCodProducto());
            pre.setString(2, p.getNombreProducto());
            pre.setString(3, p.getDescripcionProducto());
            pre.setString(4, p.getTipoProducto());
            pre.setDouble(5, p.getPrecioProducto());
            pre.setInt(6, p.getStock());
            pre.setString(7, p.getEstadoProducto());
            
            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al insertar "+e.getMessage());
        } finally {
            this.desconectar();
        }
        
        return res;
    }
    
    public ArrayList<Producto> mostrarProductos(){
        ArrayList<Producto> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT idProducto, NombreProducto, PrecioProducto, Stock, DescripcionProducto, TipoProducto, EstadoProducto, CodProducto FROM producto";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            ResultSet rs;
            rs = pre.executeQuery();
            while(rs.next()){
                Producto p = new Producto();
                p.setIdProducto(rs.getInt(1));
                p.setNombreProducto(rs.getString(2));
                p.setPrecioProducto(rs.getDouble(3));
                p.setStock(rs.getInt(4));
                p.setDescripcionProducto(rs.getString(5));
                p.setTipoProducto(rs.getString(6));
                p.setEstadoProducto(rs.getString(7));
                p.setCodProducto(rs.getString(8));
                
                lista.add(p);
            }
        } catch (SQLException e) {
            System.out.println("Error al mostrar "+e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }
    
    public int modificarProductos(Producto p){
        int res = 0;
        try {
            this.conectar();
            String sql = "UPDATE Producto SET CodProducto = ?, NombreProducto = ?, DescripcionProducto = ?, TipoProducto = ?, PrecioProducto = ?, Stock = ?, EstadoProducto = ? WHERE idProducto = ?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, p.getCodProducto());
            pre.setString(2, p.getNombreProducto());
            pre.setString(3, p.getDescripcionProducto());
            pre.setString(4, p.getTipoProducto());
            pre.setDouble(5, p.getPrecioProducto());
            pre.setInt(6, p.getStock());
            pre.setString(7, p.getEstadoProducto());
            pre.setInt(8, p.getIdProducto());
            
            res = pre.executeUpdate();            
        } catch (SQLException e) {
            System.out.println("Error al modificar "+e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }    
    
    public int eliminarProductos(Producto p){
        int res = 0;
        try {
            this.conectar();
            String sql = "DELETE FROM producto WHERE idProducto=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, p.getIdProducto());
            
            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al eliminar "+e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }
}
