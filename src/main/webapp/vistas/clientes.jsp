<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="Modelo.Cliente" %>
<%@page import="DAO.ClienteDAO" %>
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
        <title>..::Clientes::..</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.4.38/sweetalert2.min.css" />
    </head>
    <body>
        <%! 
            ClienteDAO clienteDAO = new ClienteDAO();
        %>
        <div class="container">
            
            <hr>
            <div class="row align-items-start">
                <div class="col-9"><h1>Clientes</h1></div>
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
                        <th>Nombres</th>
                        <th>Apellido Paterno</th>
                        <th>Apellido Materno</th>
                        <th>N° Documento</th>
                        <th>Acciones</th>
                    </thead>
                    <tbody>
                        <%
                        ArrayList<Cliente> listaCliente = clienteDAO.mostrarClientes();
                        
                        for (Cliente elem : listaCliente) {     
                            
                        %>
                        <tr data-tipodocumento="<%= elem.getTipoDocumento() %>" data-celular="<%= elem.getCelular() %>" data-fechan="<%= elem.getFechaNacimiento() %>">
                            <td class="idcliente"><%= elem.getIdCliente() %></td>
                            <td class="nombres"><%= elem.getNombres() %></td>
                            <td class="apellidop"><%= elem.getApellidoPaterno() %></td>
                            <td class="apellidom"><%= elem.getApellidoMaterno() %></td>
                            <td class="ndocumento"><%= elem.getNumeroDocumento()%></td>
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
                <h5 class="modal-title" id="exampleModalLabel">Datos Cliente</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                  <form action="${pageContext.servletContext.contextPath}/ClienteServlet" method="POST" role="form">
                      <div class="row">
                          <div class="col-6">
                              <label>IdCliente</label>
                              <input type="text" name="txtIdCliente" class="form-control" id="txtIdCliente" value="0" readonly="true">
                        </div>
                          <div class="col-6">
                              <label>Tipo de Documento</label>
                              <select class="form-select" id="floatingSelect" aria-label="Floating label select example"
                    onchange="mostrarInformacion(this.value)">
                    <option value="Usuarios">DNI</option>
                    <option value="Usuarios">CARNET DE EXTRANJERIA</option>
                </select>
                        </div>
                      </div>
                      <div class="row">
                          <div class="col-6">
                              <label>N° Documento</label>
                              <input type="text" name="txtNdocumento" class="form-control" id="txtNdocumento">
                        </div>
                          <div class="col-6">
                              <label>Nombres</label>
                              <input type="text" name="txtNombres" class="form-control" id="txtNombres">
                        </div>
                      </div>
                      <div class="row">
                          <div class="col-6">
                              <label>Apellido Paterno</label>
                              <input type="text" name="txtApellidoP" class="form-control" id="txtApellidoP">
                        </div>
                          <div class="col-6">
                              <label>Apellido Materno</label>
                              <input type="text" name="txtApellidoM" class="form-control" id="txtApellidoM">
                        </div>
                      </div>
                      <div class="row">
                          <div class="col-6">
                              <label>Fecha Nacimiento</label>
                              <input type="date" name="txtFechaN" class="form-control" id="txtFechaN">
                        </div>
                          <div class="col-6">
                              <label>Celular</label>
                              <input type="text" name="txtCelular" class="form-control" id="txtCelular">
                        </div>
                      </div>
                     <br>
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
        <script src="${pageContext.servletContext.contextPath}/js/cliente.js"></script>
    </body>
</html>