<%@ page import="java.sql.*" %>
<%@ page import="com.itextpdf.text.*" %>
<%@ page import="com.itextpdf.text.pdf.*" %>
<%@ page import="java.io.*" %>

<%
response.setContentType("application/pdf");
response.setHeader("Content-Disposition", "attachment; filename=clientes.pdf");

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

    // Consulta SQL para obtener datos de la tabla Cliente
    String sql = "SELECT * FROM Cliente";
    stmt = conn.prepareStatement(sql);
    rs = stmt.executeQuery();

    // Crear el documento PDF
    Document document = new Document();
    ByteArrayOutputStream baos = new ByteArrayOutputStream();
    PdfWriter.getInstance(document, baos);
    document.open();

    // Añadir imagen de la empresa (opcional, reemplazar la ruta de la imagen)
    String imagePath = application.getRealPath("/") + "image/logo.png";
    Image image = Image.getInstance(imagePath);
    image.setAlignment(Element.ALIGN_LEFT);
    image.scaleAbsolute(120, 60); // Ajustar el tamaño de la imagen
    document.add(image);

    // Añadir título del documento
    Paragraph title = new Paragraph("Reporte de Clientes", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18, BaseColor.BLACK));
    title.setAlignment(Element.ALIGN_CENTER);
    document.add(title);

    // Espacio antes de la tabla
    document.add(new Paragraph(" "));

    // Crear tabla para mostrar los datos de los clientes
    PdfPTable table = new PdfPTable(8);
    table.setWidthPercentage(100); // Ancho de la tabla al 100% del ancho disponible

    // Encabezados de la tabla
    PdfPCell cell;
    cell = new PdfPCell(new Phrase("ID", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.WHITE)));
    cell.setBackgroundColor(BaseColor.BLUE);
    table.addCell(cell);

    cell = new PdfPCell(new Phrase("Tipo de Documento", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.WHITE)));
    cell.setBackgroundColor(BaseColor.BLUE);
    table.addCell(cell);

    cell = new PdfPCell(new Phrase("N° Documento", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.WHITE)));
    cell.setBackgroundColor(BaseColor.BLUE);
    table.addCell(cell);

    cell = new PdfPCell(new Phrase("Nombres", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.WHITE)));
    cell.setBackgroundColor(BaseColor.BLUE);
    table.addCell(cell);

    cell = new PdfPCell(new Phrase("Apellido Paterno", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.WHITE)));
    cell.setBackgroundColor(BaseColor.BLUE);
    table.addCell(cell);

    cell = new PdfPCell(new Phrase("Apellido Materno", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.WHITE)));
    cell.setBackgroundColor(BaseColor.BLUE);
    table.addCell(cell);

    cell = new PdfPCell(new Phrase("Fecha de Nacimiento", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.WHITE)));
    cell.setBackgroundColor(BaseColor.BLUE);
    table.addCell(cell);

    cell = new PdfPCell(new Phrase("Celular", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.WHITE)));
    cell.setBackgroundColor(BaseColor.BLUE);
    table.addCell(cell);

    // Llenar la tabla con los datos de la base de datos
    while (rs.next()) {
        table.addCell(rs.getString("idCliente"));
        table.addCell(rs.getString("tipodocumento"));
        table.addCell(rs.getString("Ndocumento"));
        table.addCell(rs.getString("Nombres"));
        table.addCell(rs.getString("ApellidoPaterno"));
        table.addCell(rs.getString("ApellidoMaterno"));
        table.addCell(rs.getString("FechaNacimiento"));
        table.addCell(rs.getString("Celular"));
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
