
package Modelo;

public class Pisohabitacion {
    private int idPisoHabitacion;
    private String codigoPisoHabitacion;
    private String nombreNivel;
    private int cantidadHabitacion;

    // Constructor
    public Pisohabitacion() {
    }

    public Pisohabitacion(int idPisoHabitacion, String codigoPisoHabitacion, String nombreNivel, int cantidadHabitacion) {
        this.idPisoHabitacion = idPisoHabitacion;
        this.codigoPisoHabitacion = codigoPisoHabitacion;
        this.nombreNivel = nombreNivel;
        this.cantidadHabitacion = cantidadHabitacion;
    }

    public String getCodigoPisoHabitacion() {        return codigoPisoHabitacion;    }
    public void setCodigoPisoHabitacion(String codigoPisoHabitacion) {        this.codigoPisoHabitacion = codigoPisoHabitacion;    }

    public int getIdPisoHabitacion() {        return idPisoHabitacion;    }
    public void setIdPisoHabitacion(int idPisoHabitacion) {        this.idPisoHabitacion = idPisoHabitacion;    }

    public String getNombreNivel() {        return nombreNivel;    }
    public void setNombreNivel(String nombreNivel) {        this.nombreNivel = nombreNivel;    }

    public int getCantidadHabitacion() {        return cantidadHabitacion;    }
    public void setCantidadHabitacion(int cantidadHabitacion) {        this.cantidadHabitacion = cantidadHabitacion;    }
    
    

}
