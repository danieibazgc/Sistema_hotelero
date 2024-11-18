
package Modelo;

public class Usuario {
    private int user_id;
    private String username;
    private String Email;
    private String password;

    public Usuario() {
    }
    
    
    public Usuario(int user_id, String username, String email, String password) {
        this.user_id = user_id;
        this.username = username;
        this.Email = email;
        this.password = password;
    }
    
    

    public int getUser_id() {        return user_id;    }
    public void setUser_id(int user_id) {        this.user_id = user_id;    }

    public String getUsername() {        return username;    }
    public void setUsername(String username) {        this.username = username;    }

    public String getEmail() {        return Email;    }
    public void setEmail(String Email) {        this.Email = Email;    }

    public String getPassword() {        return password;    }
    public void setPassword(String password) {        this.password = password;    }
    
    
}
