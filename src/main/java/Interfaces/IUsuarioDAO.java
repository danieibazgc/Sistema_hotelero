
package Interfaces;

import Modelo.Usuario;

public interface IUsuarioDAO {
    public boolean validarUsuario(Usuario usuario);
    public boolean registrarUsuario(Usuario usuario);
    public Usuario obtenerUsuarioPorEmail(String email);
}
