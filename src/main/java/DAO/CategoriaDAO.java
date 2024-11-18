
package DAO;

import Controlador.ConexionCli;
import Modelo.Categoria;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CategoriaDAO extends ConexionCli {
    public ArrayList<Categoria> mostarCategorias(){
        ArrayList<Categoria> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT * FROM categoria";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            ResultSet rs;
            rs = pre.executeQuery();
            
            while(rs.next()){
                Categoria c = new Categoria();
                c.setIdCategoria(rs.getInt(1));
                c.setCategoria(rs.getString(2));
                lista.add(c);
            }
            
        } catch (Exception e) {
            System.out.println("Error al mostrar "+e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }
}
