<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.UsuarioTablaDAO" %>
<%@page import="java.util.ArrayList" %>
<%@page import="Modelo.Usuario" %>
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
        <title>..::Usuarios::..</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.4.38/sweetalert2.min.css" />
    </head>
    <body>
        <%! 
            UsuarioTablaDAO usuariotablaDAO = new UsuarioTablaDAO();
        %>
        <div class="container">

            <hr>
            <div class="row align-items-start">
                <div class="col-9"><h1>Administradores</h1></div>
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
                    <th>Código</th>
                    <th>UserName</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Acciones</th>
                    </thead>
                    <tbody>
                        <%
                        ArrayList<Usuario> listaUsuario = usuariotablaDAO.mostrarUsuarios();
                        
                        for (Usuario elem : listaUsuario) {     
                            
                        %>
                        <tr>
                            <td class="codigo"><%= elem.getUser_id() %></td>
                            <td class="username"><%= elem.getUsername() %></td>
                            <td class="email"><%= elem.getEmail() %></td>
                            <td class="password"><%= elem.getPassword() %></td>
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
                        <h5 class="modal-title" id="exampleModalLabel">Datos Usuarios</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="${pageContext.servletContext.contextPath}/UsuarioServlet" method="POST" role="form">
                            <div class="row">
                                <div class="col-6">
                                    <label>Codigo</label>
                                    <input type="text" name="txtCodigo" class="form-control" id="txtCodigo" value="0" readonly="true">
                                </div>
                                <div class="col-6">
                                    <label>Username</label>
                                    <input type="text" name="txtusername" class="form-control" id="txtusername">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-6">
                                    <label>Email</label>
                                    <input type="text" name="txtemail" class="form-control" id="txtemail">
                                </div>
                                <div class="col-6">
                                    <label>Password</label>
                                    <input type="text" name="txtpassword" class="form-control" id="txtpassword">
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
        <script src="${pageContext.servletContext.contextPath}/js/usuario.js"></script>
    </body>
</html>