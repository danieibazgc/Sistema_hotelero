package DAO;

import Controlador.ConexionCli;
import Modelo.Categoriahabitacion;
import Modelo.Cliente;
import Modelo.Habitacion;
import Modelo.Pisohabitacion;
import Modelo.Registroalojamiento;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RAocupadoDAO extends ConexionCli {

    public int insertarRegistroalojamiento(Registroalojamiento ra) {
        int res = 0;
        try {
            this.conectar();
            // Insertar en RegistroAlojamiento
            String sql = "INSERT INTO RegistroAlojamiento (idHabitacion, idCliente, FechaEntrada, FechaSalida, PagoAdelantado, PrecioTotal) values(?,?,?,?,?,?);";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, ra.getIdHabitacion());
            pre.setInt(2, ra.getIdCliente());
            pre.setString(3, ra.getFechaEntrada());
            pre.setString(4, ra.getFechaSalida());
            pre.setDouble(5, ra.getPagoAdelantado());
            pre.setDouble(6, ra.getPrecioTotal());
            res = pre.executeUpdate();

            // Actualizar el estado de la habitación
            String sqlEstado = "UPDATE Habitacion SET Estadohabitacion=? WHERE idHabitacion=?";
            PreparedStatement preEstado = this.getCon().prepareStatement(sqlEstado);
            preEstado.setString(1, ra.get_hab().getEstadoHabitacion());
            preEstado.setInt(2, ra.getIdHabitacion());
            res = preEstado.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error al insertar " + e.getMessage());
        } finally {
            this.desconectar();
        }

        return res;
    }

    public ArrayList<Registroalojamiento> mostrarAlojamientoreservado() {
        ArrayList<Registroalojamiento> lista = new ArrayList<>();
        try {
            this.conectar();

            String sql = "SELECT * FROM RegistroAlojamiento INNER JOIN Cliente ON RegistroAlojamiento.idCliente=Cliente.idCliente INNER JOIN Habitacion ON Habitacion.idHabitacion=RegistroAlojamiento.idHabitacion INNER JOIN Pisohabitacion ON Habitacion.idPisohabitacion=Pisohabitacion.idPisohabitacion INNER JOIN Categoriahabitacion ON Habitacion.idCategoriahabitacion=Categoriahabitacion.idCategoriahabitacion WHERE EstadoHabitacion='Ocupado';";

            PreparedStatement pre = this.getCon().prepareStatement(sql);
            ResultSet rs;
            rs = pre.executeQuery();
            while (rs.next()) {

                // OBTENER LOS DATOS DE CADA Cliente
                int clienteIdBD = rs.getInt("idCliente");
                String tipodocumentoBD = rs.getString("tipodocumento");
                String NdocumentoBD = rs.getString("Ndocumento");
                String nombresBD = rs.getString("Nombres");
                String apellidoPaternoBD = rs.getString("ApellidoPaterno");
                String apellidoMaternoBD = rs.getString("ApellidoMaterno");
                String fechaNacimientoBD = rs.getString("FechaNacimiento"); // Asegúrate de importar java.sql.Date
                String celularBD = rs.getString("Celular");

                // CREAR UN OBJETO CLASE Cliente CON LOS DATOS OBTENIDOS
                Cliente cli = new Cliente();

                // AGREGAR LOS DATOS OBTENIDOS DE LA BASE DE DATOS A LOS SETTERS DEL CLIENTE
                cli.setIdCliente(clienteIdBD);
                cli.setTipoDocumento(tipodocumentoBD);
                cli.setNumeroDocumento(NdocumentoBD);
                cli.setNombres(nombresBD);
                cli.setApellidoPaterno(apellidoPaternoBD);
                cli.setApellidoMaterno(apellidoMaternoBD);
                cli.setFechaNacimiento(fechaNacimientoBD);
                cli.setCelular(celularBD);
                // FIN TABLA CLIENTES

                // TABLA HABITACION CON SUS LLAVES FORANEAS (PISO HABITACION Y CATEGORIA HABITACION)
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

                Pisohabitacion p = new Pisohabitacion();

                p.setIdPisoHabitacion(PisohabitacionIdBD);
                p.setCodigoPisoHabitacion(codpishabBD);
                p.setNombreNivel(nompishabBD);
                p.setCantidadHabitacion(canhabBD);

                Categoriahabitacion cat = new Categoriahabitacion();

                cat.setIdCategoriaHabitacion(CategoriahabitacionIdBD);
                cat.setCodigoHabitacion(CodigohabitacionBD);
                cat.setTipoHabitacion(TipohabitacionBD);
                cat.setPrecioHabitacion(PreciohabitacionBD);

                Habitacion hab = new Habitacion(p, cat);

                hab.setIdHabitacion(HabitacionIdBD);
                hab.setDescripcionHabitacion(DescripcionhabitacionBD);
                hab.setEstadoHabitacion(EstadohabitacionBD);

                // FIN TABLA HABITACION CON SUS LLAVES FORANEAS (PISO HABITACION Y CATEGORIA HABITACION)
                // TABLA REGISTRO ALOJAMIENTO
                int RegistroAlojamientoIdBD = rs.getInt("RegistroAlojamiento.idRegistroAlojamiento");
                String FechaEntradaBD = rs.getString("RegistroAlojamiento.FechaEntrada");
                String FechaSalidaBD = rs.getString("RegistroAlojamiento.FechaSalida");
                Double PagoAdelantadoBD = rs.getDouble("RegistroAlojamiento.PagoAdelantado");
                Double PrecioTotalBD = rs.getDouble("RegistroAlojamiento.PrecioTotal");

                Registroalojamiento regAloj = new Registroalojamiento(cli, hab);

                regAloj.setIdRegistroAlojamiento(RegistroAlojamientoIdBD);
                regAloj.setFechaEntrada(FechaEntradaBD);
                regAloj.setFechaSalida(FechaSalidaBD);
                regAloj.setPagoAdelantado(PagoAdelantadoBD);
                regAloj.setPrecioTotal(PrecioTotalBD);

                lista.add(regAloj);
                // FIN TABLA REGISTRO ALOJAMIENTO CON SUS LLAVES FORANEAS (CLIENTE Y HABITACION)

            }
        } catch (SQLException e) {
            System.out.println("Error al mostrar " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }

    public ArrayList<Registroalojamiento> mostrarClientes() {
        ArrayList<Registroalojamiento> lista = new ArrayList<>();
        try {
            this.conectar();

            String sql = "select * from cliente;";

            PreparedStatement pre = this.getCon().prepareStatement(sql);
            ResultSet rs;
            rs = pre.executeQuery();
            while (rs.next()) {

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

                c.setIdCliente(clienteIdBD);
                c.setTipoDocumento(tipodocumentoBD);
                c.setNumeroDocumento(NdocumentoBD);
                c.setNombres(nombresBD);
                c.setApellidoPaterno(apellidoPaternoBD);
                c.setApellidoMaterno(apellidoMaternoBD);
                c.setFechaNacimiento(fechaNacimientoBD);
                c.setCelular(celularBD);

                Registroalojamiento Ra = new Registroalojamiento(c);
                // AGREGAR LOS DATOS OBTENIDOS DE LA BASE DE DATOS A LOS SETTERS DEL CLIENTE

                lista.add(Ra);

            }
        } catch (SQLException e) {
            System.out.println("Error al mostrar " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }

    public ArrayList<Registroalojamiento> mostrarCodigoHabitacion() {
        ArrayList<Registroalojamiento> lista = new ArrayList<>();
        try {
            this.conectar();

            String sql = "SELECT habitacion.idHabitacion, categoriahabitacion.Codigohabitacion, categoriahabitacion.Preciohabitacion FROM habitacion inner join categoriahabitacion on habitacion.idCategoriahabitacion=categoriahabitacion.idCategoriahabitacion;";

            PreparedStatement pre = this.getCon().prepareStatement(sql);
            ResultSet rs;
            rs = pre.executeQuery();
            while (rs.next()) {

                String CodigohabitacionBD = rs.getString("categoriahabitacion.Codigohabitacion");
                Double PreciohabitacionBD = Double.valueOf(rs.getString("categoriahabitacion.Preciohabitacion"));
                int HabitacionIdBD = rs.getInt("habitacion.idHabitacion");

                Habitacion habitacion = new Habitacion();
                Categoriahabitacion categoria = new Categoriahabitacion();

                habitacion.setIdHabitacion(HabitacionIdBD);
                categoria.setCodigoHabitacion(CodigohabitacionBD);
                categoria.setPrecioHabitacion(PreciohabitacionBD);

                // AGREGAR LOS DATOS OBTENIDOS DE LA BASE DE DATOS A LOS SETTERS DEL CLIENTE
                Registroalojamiento c = new Registroalojamiento(habitacion, categoria);

                lista.add(c);

            }
        } catch (SQLException e) {
            System.out.println("Error al mostrar " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }

    public int modificarAlojamientoreservado(Registroalojamiento r) {
        int res = 0;
        try {
            this.conectar();

            String sql = "UPDATE RegistroAlojamiento SET idHabitacion=?, idCliente=?, FechaEntrada=?, FechaSalida=?, PagoAdelantado=?, PrecioTotal=? WHERE idRegistroAlojamiento=?;";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, r.getIdHabitacion());
            pre.setInt(2, r.getIdCliente());
            pre.setString(3, r.getFechaEntrada());
            pre.setString(4, r.getFechaSalida());
            pre.setDouble(5, r.getPagoAdelantado());
            pre.setDouble(6, r.getPrecioTotal());
            pre.setInt(7, r.getIdRegistroAlojamiento());

            res = pre.executeUpdate();

            // Actualizar el estado de la habitación
            String sqlEstado = "UPDATE Habitacion SET Estadohabitacion=? WHERE idHabitacion=?";
            PreparedStatement preEstado = this.getCon().prepareStatement(sqlEstado);
            preEstado.setString(1, r.get_hab().getEstadoHabitacion());
            preEstado.setInt(2, r.getIdHabitacion());
            res = preEstado.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error al modificar " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }

    public int eliminarAlojamientoreservado(Registroalojamiento r) {
        int res = 0;
        try {
            this.conectar();
            String sql = "DELETE RegistroAlojamiento FROM RegistroAlojamiento INNER JOIN Cliente ON RegistroAlojamiento.idCliente=Cliente.idCliente INNER JOIN Habitacion ON Habitacion.idHabitacion=RegistroAlojamiento.idHabitacion INNER JOIN Pisohabitacion ON Habitacion.idPisohabitacion=Pisohabitacion.idPisohabitacion INNER JOIN Categoriahabitacion ON Habitacion.idCategoriahabitacion=Categoriahabitacion.idCategoriahabitacion WHERE Codigohabitacion=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);

            pre.setString(1, r.getCat_hab().getCodigoHabitacion());

            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al eliminar " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }

    public int modificarEstadoHabitacion(Registroalojamiento r) {
        int res = 0;
        try {
            this.conectar();

            String sql = "UPDATE Habitacion SET Estadohabitacion=? WHERE idHabitacion=?;";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, r.get_hab().getEstadoHabitacion());
            pre.setInt(1, r.get_hab().getIdHabitacion());

            res = pre.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error al modificar " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }

}
