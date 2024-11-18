<%@ page import="java.sql.*" %>
<%@ page import="com.itextpdf.text.*" %>
<%@ page import="com.itextpdf.text.pdf.*" %>
<%@ page import="java.io.*" %>

<%
response.setContentType("application/pdf");
response.setHeader("Content-Disposition", "attachment; filename=factura_electronica.pdf");

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

    // Consulta SQL para obtener datos de la tabla Producto
    String sql = "SELECT * FROM Producto";
    stmt = conn.prepareStatement(sql);
    rs = stmt.executeQuery();

    // Crear el documento PDF
    Document document = new Document();
    ByteArrayOutputStream baos = new ByteArrayOutputStream();
    PdfWriter.getInstance(document, baos);
    document.open();

    // Añadir imagen de la empresa en la parte superior izquierda
    String imagePath = application.getRealPath("/") + "image/logo.png"; // Asegúrate de que esta ruta sea correcta
    Image logo = Image.getInstance(imagePath);
    logo.scaleToFit(150, 150);
    logo.setAlignment(Element.ALIGN_LEFT);
    document.add(logo);

    // Añadir título centrado y detalles de la empresa a la izquierda
    Font titleFont = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD);
    Font bodyFont = new Font(Font.FontFamily.HELVETICA, 12);
    Paragraph title = new Paragraph("Factura Electrónica", titleFont);
    title.setAlignment(Element.ALIGN_CENTER);
    document.add(title);

    Paragraph companyDetails = new Paragraph("HOTEL DG\nOyon, Peru\nTeléfono: +51 987 654 321\nRUC: 12345678901\n\n", bodyFont);
    companyDetails.setAlignment(Element.ALIGN_LEFT);
    document.add(companyDetails);

    // Detalles de la venta (puedes reemplazar esto con datos reales)
    Paragraph saleDetails = new Paragraph("Detalles de la Venta:\n\n", bodyFont);
    saleDetails.setAlignment(Element.ALIGN_LEFT);
    document.add(saleDetails);

    // Añadir tabla de detalles de la factura
    PdfPTable table = new PdfPTable(8);
    table.setWidthPercentage(100);
    table.setSpacingBefore(10f);
    table.setSpacingAfter(10f);

    // Añadir cabeceras de la tabla con color azul clarito
    PdfPCell cell;
    BaseColor lightBlue = new BaseColor(173, 216, 230);

    cell = new PdfPCell(new Phrase("ID", bodyFont));
    cell.setBackgroundColor(lightBlue);
    table.addCell(cell);

    cell = new PdfPCell(new Phrase("Código de Producto", bodyFont));
    cell.setBackgroundColor(lightBlue);
    table.addCell(cell);

    cell = new PdfPCell(new Phrase("Nombre de Producto", bodyFont));
    cell.setBackgroundColor(lightBlue);
    table.addCell(cell);

    cell = new PdfPCell(new Phrase("Descripción", bodyFont));
    cell.setBackgroundColor(lightBlue);
    table.addCell(cell);

    cell = new PdfPCell(new Phrase("Tipo De Producto", bodyFont));
    cell.setBackgroundColor(lightBlue);
    table.addCell(cell);

    cell = new PdfPCell(new Phrase("Precio de Producto", bodyFont));
    cell.setBackgroundColor(lightBlue);
    table.addCell(cell);

    cell = new PdfPCell(new Phrase("Stock", bodyFont));
    cell.setBackgroundColor(lightBlue);
    table.addCell(cell);

    cell = new PdfPCell(new Phrase("Estado de Producto", bodyFont));
    cell.setBackgroundColor(lightBlue);
    table.addCell(cell);

    // Llenar la tabla con los datos de la base de datos
    while (rs.next()) {
        table.addCell(rs.getString("idProducto"));
        table.addCell(rs.getString("CodProducto"));
        table.addCell(rs.getString("NombreProducto"));
        table.addCell(rs.getString("DescripcionProducto"));
        table.addCell(rs.getString("TipoProducto"));
        table.addCell(rs.getString("PrecioProducto"));
        table.addCell(rs.getString("Stock"));
        table.addCell(rs.getString("EstadoProducto"));
    }

    // Agregar la tabla al documento
    document.add(table);

    // Añadir total de la factura (puedes calcularlo dinámicamente)
    Paragraph total = new Paragraph("Total: S/. 0.00", bodyFont);
    total.setAlignment(Element.ALIGN_RIGHT);
    document.add(total);

    // Cerrar el documento
    document.close();

    // Enviar el PDF generado como respuesta al cliente
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
    } catch (SQLException e) {
        e.printStackTrace();
    } catch (IOException e) {
        e.printStackTrace();
    }
}
%>
