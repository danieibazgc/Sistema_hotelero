
package Controlador;

import DAO.UsuarioDAO;
import Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UsuarioDAO usuarioDAO;

    public void init() {
        usuarioDAO = new UsuarioDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Email = request.getParameter("Email");
        String password = request.getParameter("password");
        Usuario admin = new Usuario();
        admin.setEmail(Email);
        admin.setPassword(password);

        if (usuarioDAO.validarUsuario(admin)) {
            admin = usuarioDAO.obtenerUsuarioPorEmail(Email);
            HttpSession session = request.getSession();
            session.setAttribute("administrador", admin);
            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("login.jsp?error=true");
        }
    }
}