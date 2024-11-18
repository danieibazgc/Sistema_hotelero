package DAO;

import Controlador.ConexionCli;
import Modelo.Cliente;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ClienteDAO extends ConexionCli {
    public int insertarCliente(Cliente c){
        int res = 0;
        try {
            this.conectar();
            String sql = "INSERT INTO Cliente (tipodocumento, Ndocumento, Nombres, ApellidoPaterno, ApellidoMaterno, FechaNacimiento, Celular) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, c.getTipoDocumento());
            pre.setString(2, c.getNumeroDocumento());
            pre.setString(3, c.getNombres());
            pre.setString(4, c.getApellidoPaterno());
            pre.setString(5, c.getApellidoMaterno());
            pre.setString(6, c.getFechaNacimiento());
            pre.setString(7, c.getCelular());
            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al insertar "+e.getMessage());
        } finally {
            this.desconectar();
        }
        
        return res;
    }
    
    public ArrayList<Cliente> mostrarClientes(){
        ArrayList<Cliente> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "select * from Cliente;";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            ResultSet rs;
            rs = pre.executeQuery();
            while(rs.next()){
                
                // OBTENER LOS DATOS DE CADA Cliente
                int clienteIdBD = rs.getInt("idCliente");
                String tipodocumentoBD = rs.getString("tipodocumento");
                String NdocumentoBD = rs.getString("Ndocumento");
                String nombresBD = rs.getString("Nombres");
                String apellidoPaternoBD = rs.getString("ApellidoPaterno");
                String apellidoMaternoBD = rs.getString("ApellidoMaterno");
                String fechaNacimientoBD = rs.getString("FechaNacimiento");
                String celularBD = rs.getString("Celular");
                
                Cliente c = new Cliente();
                // AGREGAR LOS DATOS OBTENIDOS DE LA BASE DE DATOS A LOS SETTERS DEL CLIENTE
                c.setIdCliente(clienteIdBD);
                c.setTipoDocumento(tipodocumentoBD);
                c.setNumeroDocumento(NdocumentoBD);
                c.setNombres(nombresBD);
                c.setApellidoPaterno(apellidoPaternoBD);
                c.setApellidoMaterno(apellidoMaternoBD);
                c.setFechaNacimiento(fechaNacimientoBD);
                c.setCelular(celularBD);
                
                lista.add(c);
            }
        } catch (SQLException e) {
            System.out.println("Error al mostrar "+e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }
    
    public int modificarCliente(Cliente c){
        int res = 0;
        try {
            this.conectar();
            String sql = "UPDATE Cliente SET tipodocumento=?, Ndocumento=?, Nombres=?, ApellidoPaterno=?, ApellidoMaterno=?, FechaNacimiento=?, Celular=? WHERE idCliente=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            
            pre.setString(1, c.getTipoDocumento());
            pre.setString(2, c.getNumeroDocumento());
            pre.setString(3, c.getNombres());
            pre.setString(4, c.getApellidoPaterno());
            pre.setString(5, c.getApellidoMaterno());
            pre.setString(6, c.getFechaNacimiento());
            pre.setString(7, c.getCelular());
            pre.setInt(8, c.getIdCliente());
            
            
            res = pre.executeUpdate();            
        } catch (SQLException e) {
            System.out.println("Error al modificar "+e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }    
    
    public int eliminarCliente(Cliente c){
        int res = 0;
        try {
            this.conectar();
            String sql = "delete from Cliente where Cliente.idCliente=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, c.getIdCliente());
            
            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al eliminar "+e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }
}
