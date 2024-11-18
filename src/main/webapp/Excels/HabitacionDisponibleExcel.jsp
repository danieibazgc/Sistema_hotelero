<%@ page import="java.sql.*" %>
<%@ page import="org.apache.poi.hssf.usermodel.*" %>
<%@ page import="java.io.*" %>

<%
response.setContentType("application/vnd.ms-excel");
response.setHeader("Content-Disposition", "attachment; filename=categorias_habitacion.xls");

// Conexión a la base de datos
String url = "jdbc:mysql://localhost:3306/sigh_hoteldg";
String username = "root";
String password = "";
Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;

OutputStream outputStream = null; // Cambio de nombre de la variable

try {
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(url, username, password);

    // Consulta SQL para obtener datos de la tabla Categoriahabitacion
    String sql = "SELECT * FROM Habitacion INNER JOIN Pisohabitacion ON Habitacion.idPisohabitacion=Pisohabitacion.idPisohabitacion INNER JOIN Categoriahabitacion ON Habitacion.idCategoriahabitacion=Categoriahabitacion.idCategoriahabitacion WHERE Estadohabitacion='Disponible';";
    stmt = conn.prepareStatement(sql);
    rs = stmt.executeQuery();

    // Crear el libro de Excel
    HSSFWorkbook workbook = new HSSFWorkbook();
    HSSFSheet sheet = workbook.createSheet("Habitacion Disponible");

    // Crear la fila de encabezado
    HSSFRow headerRow = sheet.createRow(0);
    headerRow.createCell(0).setCellValue("ID");
    headerRow.createCell(1).setCellValue("Descripcion");
    headerRow.createCell(2).setCellValue("Estado de Habitación");
    headerRow.createCell(3).setCellValue("Código Piso Habitación");
    headerRow.createCell(4).setCellValue("Nombre de Nivel");
    headerRow.createCell(5).setCellValue("Cantidad Habitaciones");
    headerRow.createCell(6).setCellValue("Tipo de Habitación");
    headerRow.createCell(7).setCellValue("Precio de Habitación");

    // Llenar el libro con los datos de la base de datos
    int rowNum = 1;
    while (rs.next()) {
        HSSFRow row = sheet.createRow(rowNum++);
        row.createCell(0).setCellValue(rs.getString("idHabitacion"));
        row.createCell(1).setCellValue(rs.getString("Descripcionhabitacion"));
        row.createCell(2).setCellValue(rs.getString("Estadohabitacion"));
        row.createCell(3).setCellValue(rs.getString("Codigopisohabitacion"));
        row.createCell(4).setCellValue(rs.getString("Nombrenivel"));
        row.createCell(5).setCellValue(rs.getString("Cantidadhabitacion"));
        row.createCell(6).setCellValue(rs.getString("Tipohabitacion"));
        row.createCell(7).setCellValue(rs.getString("Preciohabitacion"));
    }

    // Escribir el libro en el flujo de salida
    workbook.write(response.getOutputStream()); // Cambio de nombre de la variable
} catch (Exception e) {
    out.println("Error: " + e.getMessage());
} finally {
    try {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>
