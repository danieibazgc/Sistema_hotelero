package Modelo;

public class Cliente {
    private int idCliente;
    private String tipoDocumento;
    private String numeroDocumento;
    private String nombres;
    private String apellidoPaterno;
    private String apellidoMaterno;
    private String fechaNacimiento;
    private String celular;

    // Constructor sin argumentos
    public Cliente()
    {
        
    }

    public Cliente(int idCliente, String tipoDocumento, String numeroDocumento, String nombres, String apellidoPaterno, String apellidoMaterno, String fechaNacimiento, String celular) {
        this.idCliente = idCliente;
        this.tipoDocumento = tipoDocumento;
        this.numeroDocumento = numeroDocumento;
        this.nombres = nombres;
        this.apellidoPaterno = apellidoPaterno;
        this.apellidoMaterno = apellidoMaterno;
        this.fechaNacimiento = fechaNacimiento;
        this.celular = celular;
    }
    


    public int getIdCliente() {return idCliente;}
    public void setIdCliente(int idCliente) {this.idCliente = idCliente;}

    public String getTipoDocumento() {return tipoDocumento;}
    public void setTipoDocumento(String tipoDocumento) {this.tipoDocumento = tipoDocumento;}

    public String getNumeroDocumento() {return numeroDocumento;}
    public void setNumeroDocumento(String numeroDocumento) {this.numeroDocumento = numeroDocumento;}

    public String getNombres() {return nombres;}
    public void setNombres(String nombres) {this.nombres = nombres;}

    public String getApellidoPaterno() {return apellidoPaterno;}
    public void setApellidoPaterno(String apellidoPaterno) {this.apellidoPaterno = apellidoPaterno;}

    public String getApellidoMaterno() {return apellidoMaterno;}
    public void setApellidoMaterno(String apellidoMaterno) {this.apellidoMaterno = apellidoMaterno;}

    public String getFechaNacimiento() {return fechaNacimiento;}
    public void setFechaNacimiento(String fechaNacimiento) {this.fechaNacimiento = fechaNacimiento;}

    public String getCelular() {return celular;}
    public void setCelular(String celular) {this.celular = celular;}   
}
