<%@ page import="java.sql.*" %>
<%@ page import="com.itextpdf.text.*" %>
<%@ page import="com.itextpdf.text.pdf.*" %>
<%@ page import="java.io.*" %>

<%
response.setContentType("application/pdf");
response.setHeader("Content-Disposition", "attachment; filename=categorias_habitacion.pdf");

// Conexi�n a la base de datos
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

    // Consulta SQL para obtener datos de la tabla Categoriahabitacion
    String sql = "SELECT * FROM Categoriahabitacion";
    stmt = conn.prepareStatement(sql);
    rs = stmt.executeQuery();

    // Crear el documento PDF
    Document document = new Document();
    ByteArrayOutputStream baos = new ByteArrayOutputStream();
    PdfWriter.getInstance(document, baos);
    document.open();

    // A�adir imagen de la empresa (opcional, reemplazar la ruta de la imagen)
    String imagePath = application.getRealPath("/") + "image/logo.png";
    Image image = Image.getInstance(imagePath);
    image.setAlignment(Element.ALIGN_LEFT);
    image.scaleAbsolute(120, 60); // Ajustar el tama�o de la imagen
    document.add(image);

    // A�adir t�tulo del documento
    Paragraph title = new Paragraph("Reporte de Categor�as de Habitaci�n", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18, BaseColor.BLACK));
    title.setAlignment(Element.ALIGN_CENTER);
    document.add(title);

    // Espacio antes de la tabla
    document.add(new Paragraph(" "));

    // Crear tabla para mostrar los datos de las categor�as de habitaci�n
    PdfPTable table = new PdfPTable(4);
    table.setWidthPercentage(100); // Ancho de la tabla al 100% del ancho disponible

    // Encabezados de la tabla
    PdfPCell cell;
    cell = new PdfPCell(new Phrase("ID", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.WHITE)));
    cell.setBackgroundColor(BaseColor.BLUE);
    table.addCell(cell);

    cell = new PdfPCell(new Phrase("C�digo de Habitaci�n", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.WHITE)));
    cell.setBackgroundColor(BaseColor.BLUE);
    table.addCell(cell);

    cell = new PdfPCell(new Phrase("Tipo de Habitaci�n", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.WHITE)));
    cell.setBackgroundColor(BaseColor.BLUE);
    table.addCell(cell);

    cell = new PdfPCell(new Phrase("Precio de Habitaci�n", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.WHITE)));
    cell.setBackgroundColor(BaseColor.BLUE);
    table.addCell(cell);

    // Llenar la tabla con los datos de la base de datos
    while (rs.next()) {
        table.addCell(rs.getString("idCategoriahabitacion"));
        table.addCell(rs.getString("Codigohabitacion"));
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
