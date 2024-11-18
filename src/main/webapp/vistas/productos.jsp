<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.ProductoDAO" %>
<%@page import="java.util.ArrayList" %>
<%@page import="Modelo.Producto" %>
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
        <title>..::Productos::..</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.4.38/sweetalert2.min.css" />
    </head>
    <body>
        <%! 
            ProductoDAO productoDAO = new ProductoDAO();
        %>
        <div class="container">

            <hr>
            <div class="row align-items-start">
                <div class="col-9"><h1>Productos</h1></div>
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
                    <th>Nombre de Producto</th>
                    <th>Precio</th>
                    <th>Stock</th>
                    <th>Acciones</th>
                    </thead>
                    <tbody>
                        <%
                        ArrayList<Producto> listaProducto = productoDAO.mostrarProductos();
                        
                        for (Producto elem : listaProducto) {     
                            
                        %>
                        <tr data-descripcion="<%= elem.getDescripcionProducto() %>" data-tipo="<%= elem.getTipoProducto() %>" data-estado="<%= elem.getEstadoProducto() %>" data-codigoproducto="<%= elem.getCodProducto() %>">
                            <td class="codigo"><%= elem.getIdProducto() %></td>
                            <td class="nombre"><%= elem.getNombreProducto() %></td>
                            <td class="precio"><%= elem.getPrecioProducto() %></td>
                            <td class="stock"><%= elem.getStock() %></td>
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
                        <h5 class="modal-title" id="exampleModalLabel">Datos Producto</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="${pageContext.servletContext.contextPath}/ProductoServlet" method="POST" role="form">
                            <div class="row">
                                <div class="col-6">
                                    <label>Producto Id</label>
                                    <input type="text" name="txtproductoId" class="form-control" id="txtproductoId" value="0" readonly="true">
                                </div>
                                <div class="col-6">
                                    <label>Codigo de Producto</label>
                                    <input type="text" name="txtCodigoProducto" class="form-control" id="txtCodigoProducto">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-6">
                                    <label>Nombre de Producto</label>
                                    <input type="text" name="txtNombreProducto" class="form-control" id="txtNombreProducto">
                                </div>
                                <div class="col-6">
                                    <label>Descripcion de Producto</label>
                                    <input type="text" name="txtDescripcion" class="form-control" id="txtDescripcion">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-6">
                                    <label>Tipo de Producto</label>
                                    <input type="text" name="txtTipoProducto" class="form-control" id="txtTipoProducto">
                                </div>
                                <div class="col-6">
                                    <label>Precio</label>
                                    <input type="text" name="txtPrecio" class="form-control" id="txtPrecio">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-6">
                                    <label>Stock</label>
                                    <input type="text" name="txtStock" class="form-control" id="txtStock">
                                </div>
                                <div class="col-6">
                                    <label>Estado de Producto</label>
                                    <input type="text" name="txtEstado" class="form-control" id="txtEstado">
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
        <script src="${pageContext.servletContext.contextPath}/js/producto.js"></script>       
                            
    </body>
</html>