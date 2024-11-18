
package Modelo;

import Modelo.Categoriahabitacion;
import Modelo.Pisohabitacion;

public class Habitacion {
    private int idHabitacion;
    private int idPisoHabitacion;
    private int idCategoriaHabitacion;
    private String descripcionHabitacion;
    private String estadoHabitacion;
    
    
    private Pisohabitacion pis_hab;
    private Categoriahabitacion cat_hab;

    // Constructor
    public Habitacion()
    {
        pis_hab = new Pisohabitacion();
        cat_hab = new Categoriahabitacion();
    }

    public Habitacion(int idHabitacion) {
        this.idHabitacion = idHabitacion;
    }

    public Habitacion(Pisohabitacion pis_hab, Categoriahabitacion cat_hab) {
        this.pis_hab = pis_hab;
        this.cat_hab = cat_hab;
    }
    
    
    
    
    

    public Habitacion(int idHabitacion, int idPisoHabitacion, int idCategoriaHabitacion, String descripcionHabitacion, String estadoHabitacion) {
        this.idHabitacion = idHabitacion;
        this.idPisoHabitacion = idPisoHabitacion;
        this.idCategoriaHabitacion = idCategoriaHabitacion;
        this.descripcionHabitacion = descripcionHabitacion;
        this.estadoHabitacion = estadoHabitacion;
    }
    
    
    
    
    private String codigohabitacion;

    public String getCodigohabitacion() {return codigohabitacion;}
    public void setCodigohabitacion(String codigohabitacion) {this.codigohabitacion = codigohabitacion;}
    
    public Habitacion(String codigohabitacion)
    {
        this.codigohabitacion=codigohabitacion;
        pis_hab = new Pisohabitacion();
        cat_hab = new Categoriahabitacion();
    }
    
    
    

    public Pisohabitacion getPis_hab() {return pis_hab;}
    public Categoriahabitacion getCat_hab() {return cat_hab;}
    

    public int getIdHabitacion() {return idHabitacion;}
    public void setIdHabitacion(int idHabitacion) {this.idHabitacion = idHabitacion;}

    public int getIdPisoHabitacion() {return idPisoHabitacion;}
    public void setIdPisoHabitacion(int idPisoHabitacion) {this.idPisoHabitacion = idPisoHabitacion;}

    public int getIdCategoriaHabitacion() {return idCategoriaHabitacion;}
    public void setIdCategoriaHabitacion(int idCategoriaHabitacion) {this.idCategoriaHabitacion = idCategoriaHabitacion;}

    public String getDescripcionHabitacion() {return descripcionHabitacion;}
    public void setDescripcionHabitacion(String descripcionHabitacion) {this.descripcionHabitacion = descripcionHabitacion;}

    public String getEstadoHabitacion() {return estadoHabitacion;}
    public void setEstadoHabitacion(String estadoHabitacion) {this.estadoHabitacion = estadoHabitacion;}

    
}
