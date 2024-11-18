
package Modelo;

public class Producto {

    private int idProducto;
    private String codProducto;
    private String nombreProducto;
    private String descripcionProducto;
    private String tipoProducto;
    private double precioProducto;
    private int stock;
    private String estadoProducto;

    public Producto()
    {
        
    }

    public Producto(int idProducto, String codProducto, String nombreProducto, String descripcionProducto, String tipoProducto, double precioProducto, int stock, String estadoProducto) {
        this.idProducto = idProducto;
        this.codProducto = codProducto;
        this.nombreProducto = nombreProducto;
        this.descripcionProducto = descripcionProducto;
        this.tipoProducto = tipoProducto;
        this.precioProducto = precioProducto;
        this.stock = stock;
        this.estadoProducto = estadoProducto;
    }

    public int getIdProducto() {return idProducto;}
    public void setIdProducto(int idProducto) {this.idProducto = idProducto;}

    public String getCodProducto() {return codProducto;}
    public void setCodProducto(String codProducto) {this.codProducto = codProducto;}

    public String getNombreProducto() {return nombreProducto;}
    public void setNombreProducto(String nombreProducto) {this.nombreProducto = nombreProducto;}

    public String getDescripcionProducto() {return descripcionProducto;}
    public void setDescripcionProducto(String descripcionProducto) {this.descripcionProducto = descripcionProducto;}

    public String getTipoProducto() {return tipoProducto;}
    public void setTipoProducto(String tipoProducto) {this.tipoProducto = tipoProducto;}

    public double getPrecioProducto() {return precioProducto;}
    public void setPrecioProducto(double precioProducto) {this.precioProducto = precioProducto;}

    public int getStock() {return stock;}
    public void setStock(int stock) {this.stock = stock;}

    public String getEstadoProducto() {return estadoProducto;}
    public void setEstadoProducto(String estadoProducto) {this.estadoProducto = estadoProducto;}
    
    
}