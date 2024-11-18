<%@ page import="java.sql.*" %>
<%@ page import="com.itextpdf.text.*" %>
<%@ page import="com.itextpdf.text.pdf.*" %>
<%@ page import="java.io.*" %>

<%
response.setContentType("application/pdf");
response.setHeader("Content-Disposition", "attachment; filename=reporte_habitaciones.pdf");

// Conexión a la base de datos
String url = "jdbc:mysql://localhost:3306/sigh_hoteldg";
String username = "root";
String password = "";
Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;

OutputStream outputStream = null;

try {
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(url, username, password);

    // Consulta SQL para obtener datos de la tabla Habitacion, PisoHabitacion y CategoriaHabitacion
    String sql = "SELECT h.idHabitacion, h.Descripcionhabitacion, h.Estadohabitacion, " +
                 "ph.Codigopisohabitacion, ph.Nombrenivel, ph.Cantidadhabitacion, " +
                 "ch.Tipohabitacion, ch.Preciohabitacion " +
                 "FROM Habitacion h " +
                 "INNER JOIN Pisohabitacion ph ON h.idPisohabitacion = ph.idPisohabitacion " +
                 "INNER JOIN Categoriahabitacion ch ON h.idCategoriahabitacion = ch.idCategoriahabitacion";

    stmt = conn.prepareStatement(sql);
    rs = stmt.executeQuery();

    // Crear el documento PDF
    Document document = new Document();
    ByteArrayOutputStream baos = new ByteArrayOutputStream();
    PdfWriter.getInstance(document, baos);
    document.open();

    // Añadir título del documento
    Paragraph title = new Paragraph("Reporte de Habitaciones", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18, BaseColor.BLACK));
    title.setAlignment(Element.ALIGN_CENTER);
    document.add(title);

    // Espacio antes de la tabla
    document.add(new Paragraph(" "));

    // Crear tabla para mostrar los datos de las habitaciones
    PdfPTable table = new PdfPTable(8);
    table.setWidthPercentage(100); // Ancho de la tabla al 100% del ancho disponible

    // Encabezados de la tabla
    PdfPCell cell;
    cell = new PdfPCell(new Phrase("ID", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.WHITE)));
    cell.setBackgroundColor(BaseColor.BLUE);
    table.addCell(cell);

    cell = new PdfPCell(new Phrase("Descripción", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.WHITE)));
    cell.setBackgroundColor(BaseColor.BLUE);
    table.addCell(cell);

    cell = new PdfPCell(new Phrase("Estado", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.WHITE)));
    cell.setBackgroundColor(BaseColor.BLUE);
    table.addCell(cell);

    cell = new PdfPCell(new Phrase("Código Piso", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.WHITE)));
    cell.setBackgroundColor(BaseColor.BLUE);
    table.addCell(cell);

    cell = new PdfPCell(new Phrase("Nombre de Nivel", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.WHITE)));
    cell.setBackgroundColor(BaseColor.BLUE);
    table.addCell(cell);

    cell = new PdfPCell(new Phrase("Cantidad", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.WHITE)));
    cell.setBackgroundColor(BaseColor.BLUE);
    table.addCell(cell);

    cell = new PdfPCell(new Phrase("Tipo de Habitación", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.WHITE)));
    cell.setBackgroundColor(BaseColor.BLUE);
    table.addCell(cell);

    cell = new PdfPCell(new Phrase("Precio", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.WHITE)));
    cell.setBackgroundColor(BaseColor.BLUE);
    table.addCell(cell);

    // Llenar la tabla con los datos de la base de datos
    while (rs.next()) {
        table.addCell(rs.getString("idHabitacion"));
        table.addCell(rs.getString("Descripcionhabitacion"));
        table.addCell(rs.getString("Estadohabitacion"));
        table.addCell(rs.getString("Codigopisohabitacion"));
        table.addCell(rs.getString("Nombrenivel"));
        table.addCell(rs.getString("Cantidadhabitacion"));
        table.addCell(rs.getString("Tipohabitacion"));
        table.addCell(rs.getString("Preciohabitacion"));
    }

    // Agregar la tabla al documento
    document.add(table);

    // Cerrar el documento
    document.close();

    // Escribir el documento PDF en el flujo de salida
    outputStream = response.getOutputStream();
    baos.writeTo(outputStream);
    outputStream.flush();
} catch (Exception e) {
    out.println("Error: " + e.getMessage());
} finally {
    try {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
        if (outputStream != null) outputStream.close();
    } catch (SQLException | IOException e) {
        e.printStackTrace();
    }
}
%>
