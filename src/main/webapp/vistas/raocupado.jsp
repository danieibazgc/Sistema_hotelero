<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Registroalojamiento" %>
<%@page import="DAO.RAocupadoDAO" %>
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
        <title>..::Registro Alojamiento Ocupado::..</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.4.38/sweetalert2.min.css" />
    </head>
    <body>
        <%! 
            RAocupadoDAO raDAO = new RAocupadoDAO();
        %>
        <div class="container">

            <hr>
            <div class="row align-items-start">
                <div class="col-9"><h1>Alojamiento Ocupado</h1></div>
                <div class="col-3 align-self-center">
                    <div class="d-grid gap-2">
                        <button type="button" class="btn btn-success btnAdd" data-bs-toggle="modal" data-bs-target="#exampleModal">Registrar</button>
                        <button type="button" class="btn btn-primary btnGenerarPDF" onclick="generarPDF()">Generar PDF</button>
                        <button type="button" class="btn btn-primary btnGenerarExcel" onclick="generarExcel()">Generar EXCEL</button>
                    </div>                    
                </div>
            </div>


            <hr>
            <div class="table-responsive">
                <table class="table table-striped" id="mydataTable">
                    <thead>
                    <th>Id</th>
                    <th>Código Habitación</th>
                    <th>N° Documento</th>
                    <th>Fecha Entrada</th>
                    <th>Fecha Salida</th>
                    <th>Acciones</th>
                    </thead>
                    <tbody>
                        <%
                        ArrayList<Registroalojamiento> listaRa = raDAO.mostrarAlojamientoreservado();
                        
                        for (Registroalojamiento elem : listaRa) {     
                            
                        %>
                        <tr data-pagoadelanto="<%= elem.getPagoAdelantado() %>" data-preciototal="<%= elem.getPrecioTotal()%>" data-estado="<%= elem.get_hab().getEstadoHabitacion()%>" data-preciodehabitacion="<%= elem.get_hab().getCat_hab().getPrecioHabitacion() %>">
                            <td class="IdAlojamiento"><%= elem.getIdRegistroAlojamiento() %></td>
                            <td class="codigohabitacion"><%= elem.get_hab().getCat_hab().getCodigoHabitacion() %></td>
                            <td class="Ndocumento"><%= elem.get_cli().getNumeroDocumento() %></td>
                            <td class="FechaEntrada"><%= elem.getFechaEntrada() %></td>
                            <td class="FechaSalida"><%= elem.getFechaSalida() %></td>
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
                        <form action="${pageContext.servletContext.contextPath}/RAocupadoServlet" method="POST" role="form">
                            <div class="row">
                                <div class="col-6">
                                    <label>Id Alojamiento</label>
                                    <input type="text" name="txtidRAalojamiento" class="form-control" id="txtidRAalojamiento" value="0" readonly="true">
                                </div>
                                <div class="col-6">
                                    <label>Código de Habitación</label>
                                    <select name="txtidCodigohabitacion" id="txtidCodigohabitacion" class="form-select" onchange="updatePrice()">
                                        <option value="0">Seleccionar Código...</option>
                                        <%
                                            ArrayList<Registroalojamiento> lista2 = raDAO.mostrarCodigoHabitacion();
                                            for (Registroalojamiento elem : lista2) {
                                        %>
                                        <option value="<%= elem.get_hab().getIdHabitacion() %>-<%= elem.getCat_hab().getCodigoHabitacion()%>" 
                                                data-preciohabitacion="<%= elem.getCat_hab().getPrecioHabitacion() %>">
                                            <%= elem.getCat_hab().getCodigoHabitacion() %>
                                        </option>

                                        <%
                                          }
                                        %>
                                    </select>
                                </div>                    
                            </div>
                            <div class="row">
                                <div class="col-6">
                                    <label>Precio de Habitación</label>
                                    <input type="text" name="txtPrecioHabitacion" class="form-control" id="txtPrecioHabitacion">
                                </div>
                                <div class="col-6">
                                    <label>N° Documento</label>
                                    <select name="txtidCliente" id="txtidCliente" class="form-select">
                                        <option value="0">Seleccionar N° Doc...</option>
                                        <%
                                            ArrayList<Registroalojamiento> lista = raDAO.mostrarClientes();
                                            for (Registroalojamiento elem : lista) {
                                        %>
                                        <option value="<%= elem.get_cli().getIdCliente() %>"><%= elem.get_cli().getNumeroDocumento() %></option>
                                        <%
                                          }
                                        %>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-6">
                                    <label>Fecha de Entrada</label>
                                    <input type="date" name="txtFechaEntrada" class="form-control" id="txtFechaEntrada">
                                </div>
                                <div class="col-6">
                                    <label>Fecha de Salida</label>
                                    <input type="date" name="txtFechaSalida" class="form-control" id="txtFechaSalida">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-6">
                                    <label>Pago de Adelanto</label>
                                    <input type="text" name="txtPagoAdelanto" class="form-control" id="txtPagoAdelanto" oninput="updateTotal()">
                                </div>
                                <div class="col-6">
                                    <label>Precio Total</label>
                                    <input type="text" name="txtPrecioTotal" class="form-control" id="txtPrecioTotal">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-6">
                                    <label for="estadoHabitacion">Estado de Habitación</label>
                                    <select name="txtEstadoHabitacion" id="txtEstadoHabitacion" class="form-select">
                                        <option value="Reservado">Reservado</option>
                                        <option value="Ocupado">Ocupado</option>
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
        <script src="${pageContext.servletContext.contextPath}/js/raocupado.js"></script>
    </body>
</html>