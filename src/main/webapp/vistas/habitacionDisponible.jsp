<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Pisohabitacion" %>
<%@page import="Modelo.Categoriahabitacion" %>
<%@page import="Modelo.Habitacion" %>
<%@page import="DAO.HabitacionDAO" %>
<%@page import="java.util.ArrayList" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.itextpdf.text.*" %>
<%@ page import="com.itextpdf.text.pdf.*" %>
<%@ page import="org.apache.poi.ss.usermodel.*" %>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFWorkbook" %>
<%@ page import="org.apache.poi.hssf.usermodel.*" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>..Disponibles..</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.4.38/sweetalert2.min.css" />
    </head>
    <body>
        <%! 
            HabitacionDAO habitacionDAO = new HabitacionDAO();
        %>
        <div class="container">

            <hr>
            <div class="row align-items-start">
                <div class="col-9"><h1>Habitación Disponible</h1></div>
                <div class="col-3 align-self-center">
                    <div class="d-grid gap-2">
                        <button type="button" class="btn btn-success btnAdd" data-bs-toggle="modal" data-bs-target="#exampleModal">Registrar</button>
                        <button type="button" class="btn btn-primary btnGenerarPDF" onclick="generarDisponiblePDF()">Generar PDF</button>
                        <button type="button" class="btn btn-primary btnGenerarExcel" onclick="generarDisponibleExcel()">Generar EXCEL</button>
                    </div>                    
                </div>
            </div>


            <hr>
            <div class="table-responsive">
                <table class="table table-striped" id="mydataTable">
                    <thead>
                    <th>Id</th>
                    <th>Código Habitación</th>
                    <th>Piso</th>
                    <th>Precio</th>
                    <th>Estado</th>
                    <th>Acciones</th>
                    </thead>
                    <tbody>
                        <%
                        ArrayList<Habitacion> listaHabitacion = habitacionDAO.mostrarHabitaciones("Disponible",true);
                        
                        for (Habitacion elem : listaHabitacion) {     
                            
                        %>
                        <tr data-descripcion="<%= elem.getDescripcionHabitacion() %>" data-estado="<%= elem.getEstadoHabitacion()%>">
                            <td class="IdHabitacion"><%= elem.getIdHabitacion() %></td>
                            <td class="codigohabitacion"><%= elem.getCat_hab().getCodigoHabitacion() %></td>
                            <td class="piso"><%= elem.getPis_hab().getNombreNivel() %></td>
                            <td class="precio"><%= elem.getCat_hab().getPrecioHabitacion() %></td>
                            <td class="estado"><%= elem.getEstadoHabitacion() %></td>
                            <td>
                                <button type="button" class="btn btn-dark btnEditar" data-bs-toggle="modal" data-bs-target="#exampleModal">Actualizar</button>
                                <button type="button" class="btn btn-danger btnEliminar" data-bs-toggle="modal" data-bs-target="#exampleModal">Eliminar</button>
                            </td>
                        </tr>
                        <%
                        }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- Button trigger modal -->
        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Datos Habitación</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="${pageContext.servletContext.contextPath}/HabitacionServlet" method="POST" role="form">
                            <div class="row">
                                <div class="col-6">
                                    <label>Id Habitacion</label>
                                    <input type="text" name="txtidHabitacion" class="form-control" id="txtidHabitacion" value="0" readonly="true">
                                </div>
                                <div class="col-6">
                                    <label>Piso de Habitación</label>
                                    <select name="txtidPisoHabitacion" id="txtidPisoHabitacion" class="form-select">
                                        <option value="0">Seleccionar Piso...</option>
                                        <%
                                            ArrayList<Habitacion> lista = habitacionDAO.mostrarPisohabitacion();
                                            for (Habitacion elem : lista) {
                                        %>
                                        <option value="<%= elem.getPis_hab().getIdPisoHabitacion() %>"><%= elem.getPis_hab().getNombreNivel() %></option>
                                        <%
                                          }
                                        %>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-6">
                                    <label>Código de Habitación</label>
                                    <select name="txtidCategoriaHabitacion" id="txtidCategoriaHabitacion" class="form-select">
                                        <option value="0">Seleccionar Código...</option>
                                        <%
                                            ArrayList<Habitacion> lista2 = habitacionDAO.mostrarCategoriahabitacion();
                                            for (Habitacion elem : lista2) {
                                        %>
                                        <option value="<%= elem.getCat_hab().getIdCategoriaHabitacion() %>-<%= elem.getCat_hab().getCodigoHabitacion() %>" ><%= elem.getCat_hab().getCodigoHabitacion() %></option>
                                        <%
                                          }
                                        %>
                                    </select>
                                </div>
                                <div class="col-6">
                                    <label>Descripción Habitación</label>
                                    <input type="text" name="txtdescripcionHabitacion" class="form-control" id="txtdescripcionHabitacion">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-6">
                                    <label for="estadoHabitacion">Estado de Habitación</label>
                                    <select name="txtEstadoHabitacion" id="txtEstadoHabitacion" class="form-select">
                                        <option value="Disponible">Disponible</option>
                                        <option value="Mantenimiento">Mantenimiento</option>
                                    </select>
                                </div>
                            </div><br>
                            <div class="row">
                                <div class="col-12">
                                    <button type="submit" name="btnGuardar" class="btn btn-success btnGuardarModal">Registrar</button>
                                    <button type="submit" name="btnEditar" class="btn btn-dark btnEditarModal">Actualizar</button>
                                    <button type="submit" name="btnEliminar" class="btn btn-danger btnEliminarModal">Eliminar</button>
                                    <button type="button" class="btn btn-info btnCancelarModal" data-bs-dismiss="modal">Cancelar</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script>
            var contextPath = '${pageContext.servletContext.contextPath}';
        </script>
        <script src="${pageContext.servletContext.contextPath}/js/agregarhabitacion.js"></script>
    </body>
</html>