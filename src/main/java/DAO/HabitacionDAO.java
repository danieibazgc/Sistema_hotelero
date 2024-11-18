package DAO;

import Controlador.ConexionCli;
import Modelo.Habitacion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class HabitacionDAO extends ConexionCli {

    public int insertarHabitacion(Habitacion h) {
        int res = 0;
        try {
            this.conectar();
            String sql = "INSERT INTO Habitacion (idPisohabitacion, idCategoriahabitacion, Descripcionhabitacion, Estadohabitacion) values(?,?,?,?)";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, h.getIdPisoHabitacion());
            pre.setInt(2, h.getIdCategoriaHabitacion());
            pre.setString(3, h.getDescripcionHabitacion());
            pre.setString(4, h.getEstadoHabitacion());

            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al insertar " + e.getMessage());
        } finally {
            this.desconectar();
        }

        return res;
    }

    public ArrayList<Habitacion> mostrarHabitaciones(String estadohabitacion, boolean actides) {
        ArrayList<Habitacion> lista = new ArrayList<>();
        try {
            this.conectar();

            String sql = "";

            if (estadohabitacion.equalsIgnoreCase("Disponible") && actides == true) {
                sql = "SELECT * FROM Habitacion INNER JOIN Pisohabitacion ON Habitacion.idPisohabitacion=Pisohabitacion.idPisohabitacion INNER JOIN Categoriahabitacion ON Habitacion.idCategoriahabitacion=Categoriahabitacion.idCategoriahabitacion WHERE Habitacion.Estadohabitacion='" + estadohabitacion + "';";
            } else if (estadohabitacion.equalsIgnoreCase("Ocupado") && actides == true) {
                sql = "SELECT * FROM Habitacion INNER JOIN Pisohabitacion ON Habitacion.idPisohabitacion=Pisohabitacion.idPisohabitacion INNER JOIN Categoriahabitacion ON Habitacion.idCategoriahabitacion=Categoriahabitacion.idCategoriahabitacion WHERE Habitacion.Estadohabitacion='" + estadohabitacion + "';";
            } else if (estadohabitacion.equalsIgnoreCase("Reservado") && actides == true) {
                sql = "SELECT * FROM Habitacion INNER JOIN Pisohabitacion ON Habitacion.idPisohabitacion=Pisohabitacion.idPisohabitacion INNER JOIN Categoriahabitacion ON Habitacion.idCategoriahabitacion=Categoriahabitacion.idCategoriahabitacion WHERE Habitacion.Estadohabitacion='" + estadohabitacion + "';";
            } else if (estadohabitacion.equalsIgnoreCase("Mantenimiento") && actides == true) {
                sql = "SELECT * FROM Habitacion INNER JOIN Pisohabitacion ON Habitacion.idPisohabitacion=Pisohabitacion.idPisohabitacion INNER JOIN Categoriahabitacion ON Habitacion.idCategoriahabitacion=Categoriahabitacion.idCategoriahabitacion WHERE Habitacion.Estadohabitacion='" + estadohabitacion + "';";
            } else if (estadohabitacion.equalsIgnoreCase("General") && actides == false) {
                sql = "SELECT * FROM Habitacion INNER JOIN Pisohabitacion ON Habitacion.idPisohabitacion=Pisohabitacion.idPisohabitacion INNER JOIN Categoriahabitacion ON Habitacion.idCategoriahabitacion=Categoriahabitacion.idCategoriahabitacion;";
            }

            PreparedStatement pre = this.getCon().prepareStatement(sql);
            ResultSet rs;
            rs = pre.executeQuery();
            while (rs.next()) {

                // OBTENER LOS DATOS DE CADA Pisohabitacion
                int PisohabitacionIdBD = rs.getInt("Pisohabitacion.idPisohabitacion");
                String codpishabBD = rs.getString("Pisohabitacion.Codigopisohabitacion");
                String nompishabBD = rs.getString("Pisohabitacion.Nombrenivel");
                int canhabBD = rs.getInt("Pisohabitacion.Cantidadhabitacion");

                // OBTENER LOS DATOS DE CADA CategoriaHabitacion
                int CategoriahabitacionIdBD = rs.getInt("Categoriahabitacion.idCategoriahabitacion");
                String CodigohabitacionBD = rs.getString("Categoriahabitacion.Codigohabitacion");
                String TipohabitacionBD = rs.getString("Categoriahabitacion.Tipohabitacion");
                Double PreciohabitacionBD = rs.getDouble("Categoriahabitacion.Preciohabitacion");

                // OBTENER LOS DATOS DE CADA Habitacion
                int HabitacionIdBD = rs.getInt("Habitacion.idHabitacion");
                String DescripcionhabitacionBD = rs.getString("Habitacion.Descripcionhabitacion");
                String EstadohabitacionBD = rs.getString("Habitacion.Estadohabitacion");

                Habitacion habitaciones_clase = new Habitacion();

                habitaciones_clase.getPis_hab().setIdPisoHabitacion(PisohabitacionIdBD);
                habitaciones_clase.getPis_hab().setCodigoPisoHabitacion(codpishabBD);
                habitaciones_clase.getPis_hab().setNombreNivel(nompishabBD);
                habitaciones_clase.getPis_hab().setCantidadHabitacion(canhabBD);

                habitaciones_clase.getCat_hab().setIdCategoriaHabitacion(CategoriahabitacionIdBD);
                habitaciones_clase.getCat_hab().setCodigoHabitacion(CodigohabitacionBD);
                habitaciones_clase.getCat_hab().setTipoHabitacion(TipohabitacionBD);
                habitaciones_clase.getCat_hab().setPrecioHabitacion(PreciohabitacionBD);

                habitaciones_clase.setIdHabitacion(HabitacionIdBD);
                habitaciones_clase.setDescripcionHabitacion(DescripcionhabitacionBD);
                habitaciones_clase.setEstadoHabitacion(EstadohabitacionBD);

                lista.add(habitaciones_clase);

            }
        } catch (SQLException e) {
            System.out.println("Error al mostrar " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }

    public ArrayList<Habitacion> mostrarPisohabitacion() {
        ArrayList<Habitacion> lista = new ArrayList<>();
        try {
            this.conectar();

            String sql = "select * from Pisohabitacion;";

            PreparedStatement pre = this.getCon().prepareStatement(sql);
            ResultSet rs;
            rs = pre.executeQuery();
            while (rs.next()) {

                // OBTENER LOS DATOS DE CADA Pisohabitacion
                int PisohabitacionIdBD = rs.getInt("idPisohabitacion");
                String codpishabBD = rs.getString("Codigopisohabitacion");
                String nompishab = rs.getString("Nombrenivel");
                int canhabBD = rs.getInt("Cantidadhabitacion");

                // CREAR UN OBJETO CLASE Pisohabitacion CON LOS DATOS OBTENIDOS
                Habitacion h = new Habitacion();

                // AGREGAR LOS DATOS OBTENIDOS DE LA BASE DE DATOS A LOS SETTERS DEL Pisohabitacion
                h.getPis_hab().setIdPisoHabitacion(PisohabitacionIdBD);
                h.getPis_hab().setCodigoPisoHabitacion(codpishabBD);
                h.getPis_hab().setNombreNivel(nompishab);
                h.getPis_hab().setCantidadHabitacion(canhabBD);

                lista.add(h);

            }
        } catch (SQLException e) {
            System.out.println("Error al mostrar " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }

    public ArrayList<Habitacion> mostrarCategoriahabitacion() {
        ArrayList<Habitacion> lista = new ArrayList<>();
        try {
            this.conectar();

            String sql = "select * from Categoriahabitacion;";

            PreparedStatement pre = this.getCon().prepareStatement(sql);
            ResultSet rs;
            rs = pre.executeQuery();
            while (rs.next()) {

                // OBTENER LOS DATOS DE CADA ADMINISTRADOR
                int CategoriahabitacionIdBD = rs.getInt("idCategoriahabitacion");
                String CodigohabitacionBD = rs.getString("Codigohabitacion");
                String Tipohabitacion = rs.getString("Tipohabitacion");
                Double PreciohabitacionBD = rs.getDouble("Preciohabitacion");

                // CREAR UN OBJETO CLASE Cliente CON LOS DATOS OBTENIDOS
                Habitacion habitacion_clase = new Habitacion();

                // AGREGAR LOS DATOS OBTENIDOS DE LA BASE DE DATOS A LOS SETTERS DE HABITACION
                habitacion_clase.getCat_hab().setIdCategoriaHabitacion(CategoriahabitacionIdBD);
                habitacion_clase.getCat_hab().setCodigoHabitacion(CodigohabitacionBD);
                habitacion_clase.getCat_hab().setTipoHabitacion(Tipohabitacion);
                habitacion_clase.getCat_hab().setPrecioHabitacion(PreciohabitacionBD);

                lista.add(habitacion_clase);

            }
        } catch (SQLException e) {
            System.out.println("Error al mostrar " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }

    public int modificarHabitacion(Habitacion h, String actides) {
        int res = 0;
        try {
            this.conectar();

            if (actides.equalsIgnoreCase("General")) {
                String sql = "UPDATE Habitacion SET idPisohabitacion=?, idCategoriahabitacion=?, Descripcionhabitacion=?, Estadohabitacion=? WHERE idHabitacion=?;";
                PreparedStatement pre = this.getCon().prepareStatement(sql);
                pre.setInt(1, h.getIdPisoHabitacion());
                pre.setInt(2, h.getIdCategoriaHabitacion());
                pre.setString(3, h.getDescripcionHabitacion());
                pre.setString(4, h.getEstadoHabitacion());
                pre.setInt(5, h.getIdHabitacion());

                res = pre.executeUpdate();
            } else if (actides.equalsIgnoreCase("Alojamiento")) {
                String sql = "UPDATE Habitacion SET Estadohabitacion=? WHERE idHabitacion=?;";
                PreparedStatement pre = this.getCon().prepareStatement(sql);
                pre.setString(1, h.getEstadoHabitacion());
                pre.setInt(2, h.getIdHabitacion());

                res = pre.executeUpdate();
            }

        } catch (SQLException e) {
            System.out.println("Error al modificar " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }

    public int eliminarHabitacion(Habitacion h) {
        int res = 0;
        try {
            this.conectar();
            String sql = "DELETE Habitacion FROM Habitacion INNER JOIN Categoriahabitacion ON Habitacion.idCategoriahabitacion = Categoriahabitacion.idCategoriahabitacion WHERE Categoriahabitacion.Codigohabitacion = ?;";
            PreparedStatement pre = this.getCon().prepareStatement(sql);

            pre.setString(1, h.getCodigohabitacion());

            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al eliminar " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }
}
