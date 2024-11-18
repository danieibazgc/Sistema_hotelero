package Modelo;

public class Categoriahabitacion {
    private int idCategoriaHabitacion;
    private String codigoHabitacion;
    private String tipoHabitacion;
    private double precioHabitacion;

    public Categoriahabitacion() {
    }

    public Categoriahabitacion(int idCategoriaHabitacion, String codigoHabitacion, String tipoHabitacion, double precioHabitacion) {
        this.idCategoriaHabitacion = idCategoriaHabitacion;
        this.codigoHabitacion = codigoHabitacion;
        this.tipoHabitacion = tipoHabitacion;
        this.precioHabitacion = precioHabitacion;
    }

       
    

    public int getIdCategoriaHabitacion() {        return idCategoriaHabitacion;    }
    public void setIdCategoriaHabitacion(int idCategoriaHabitacion) {        this.idCategoriaHabitacion = idCategoriaHabitacion;}

    public String getCodigoHabitacion() {        return codigoHabitacion;    }
    public void setCodigoHabitacion(String codigoHabitacion) {        this.codigoHabitacion = codigoHabitacion;    }

    public String getTipoHabitacion() {        return tipoHabitacion;    }
    public void setTipoHabitacion(String tipoHabitacion) {        this.tipoHabitacion = tipoHabitacion;    }

    public double getPrecioHabitacion() {        return precioHabitacion;    }
    public void setPrecioHabitacion(double precioHabitacion) {        this.precioHabitacion = precioHabitacion;    }
    
}
