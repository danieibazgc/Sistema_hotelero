package Modelo;

import Modelo.Cliente;
import Modelo.Habitacion;

public class Registroalojamiento {
    private int idRegistroAlojamiento;
    private int idHabitacion;
    private int idCliente;
    private String fechaEntrada;
    private String fechaSalida;
    private double pagoAdelantado;
    private double precioTotal;
    
    private Cliente clientes_clase;
    private Habitacion habitaciones_clase;
    private Categoriahabitacion cat_hab;

    // Constructor sin argumentos
    public Registroalojamiento() {
    }

    public Registroalojamiento(int idRegistroAlojamiento, int idHabitacion, int idCliente, String fechaEntrada, String fechaSalida, double pagoAdelantado, double precioTotal) {
        this.idRegistroAlojamiento = idRegistroAlojamiento;
        this.idHabitacion = idHabitacion;
        this.idCliente = idCliente;
        this.fechaEntrada = fechaEntrada;
        this.fechaSalida = fechaSalida;
        this.pagoAdelantado = pagoAdelantado;
        this.precioTotal = precioTotal;
    }

    public Registroalojamiento(int idRegistroAlojamiento, int idHabitacion, int idCliente, String fechaEntrada, String fechaSalida, double pagoAdelantado, double precioTotal, Habitacion habitaciones_clase, Categoriahabitacion cat_hab) {
        this();
        this.idRegistroAlojamiento = idRegistroAlojamiento;
        this.idHabitacion = idHabitacion;
        this.idCliente = idCliente;
        this.fechaEntrada = fechaEntrada;
        this.fechaSalida = fechaSalida;
        this.pagoAdelantado = pagoAdelantado;
        this.precioTotal = precioTotal;
        this.habitaciones_clase = habitaciones_clase;
        this.cat_hab = cat_hab;
    }
    
    


    public Registroalojamiento(Cliente clientes_clase)
    {
        this();
        this.clientes_clase = clientes_clase;
    }

    public Registroalojamiento(Habitacion habitaciones_clase, Categoriahabitacion cat_hab)
    {
        this();
        this.habitaciones_clase = habitaciones_clase;
        this.cat_hab = cat_hab;
    }
    
    
    
    
    
    public Registroalojamiento(Cliente clientes_clase, Habitacion habitaciones_clase)
    {
        this();
        this.clientes_clase=clientes_clase;
        this.habitaciones_clase=habitaciones_clase;
    }

    public Cliente get_cli() {return clientes_clase;}
    public Habitacion get_hab() {return habitaciones_clase;}
    public Categoriahabitacion getCat_hab(){return cat_hab;}
    

    public int getIdRegistroAlojamiento() {return idRegistroAlojamiento;}
    public void setIdRegistroAlojamiento(int idRegistroAlojamiento) {this.idRegistroAlojamiento = idRegistroAlojamiento;}

    public int getIdHabitacion() {return idHabitacion;}
    public void setIdHabitacion(int idHabitacion) {this.idHabitacion = idHabitacion;}

    public int getIdCliente() {return idCliente;}
    public void setIdCliente(int idCliente) {this.idCliente = idCliente;}

    public String getFechaEntrada() {return fechaEntrada;}
    public void setFechaEntrada(String fechaEntrada) {this.fechaEntrada = fechaEntrada;}

    public String getFechaSalida() {return fechaSalida;}
    public void setFechaSalida(String fechaSalida) {this.fechaSalida = fechaSalida;}

    public double getPagoAdelantado() {return pagoAdelantado;}
    public void setPagoAdelantado(double pagoAdelantado) {this.pagoAdelantado = pagoAdelantado;}

    public double getPrecioTotal() {return precioTotal;}
    public void setPrecioTotal(double precioTotal) {this.precioTotal = precioTotal;}
    
}