
package Controlador;

import DAO.CategoriahabitacionDAO;
import Modelo.Cliente;
import DAO.ClienteDAO;
import Modelo.Categoriahabitacion;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/CategoriahabitacionServlet"})
public class CategoriahabitacionServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            //Captura de datos
            int cathab_id = Integer.parseInt(request.getParameter("txtCodigo"));
            String codhab = request.getParameter("txtCodhabitacion");
            String tipohab = request.getParameter("txtTipohabitacion");
            double preciohab = Double.parseDouble(request.getParameter("txtPreciohabitacion"));
            String mensaje = "Error";
            int res;
            
            Categoriahabitacion c = new Categoriahabitacion(cathab_id, codhab, tipohab, preciohab);
            CategoriahabitacionDAO cathabDAO = new CategoriahabitacionDAO();
            
            if(request.getParameter("btnGuardar") != null){
                res = cathabDAO.insertarCategoriahabitacion(c);
                if(res != 0){
                    mensaje = "Registro Agregado";
                    // Redireccionar a clientes.jsp después de registrar exitosamente
                    response.sendRedirect("/hoteldg_sigh/index.jsp");
                    return; // Terminar la ejecución del método después de la redirección
                }
            }else if(request.getParameter("btnEditar") != null){
                res = cathabDAO.modificarCategoriahabitacion(c);
                if(res != 0){
                    mensaje = "Registro Modificado";
                    // Redireccionar a clientes.jsp después de registrar exitosamente
                    response.sendRedirect("/hoteldg_sigh/index.jsp");
                    return; // Terminar la ejecución del método después de la redirección
                }
            }else if(request.getParameter("btnEliminar") != null){
                res = cathabDAO.eliminarCategoriahabitacion(c);
                if(res != 0){
                    mensaje = "Registro Eliminado";
                    // Redireccionar a clientes.jsp después de registrar exitosamente
                    response.sendRedirect("/hoteldg_sigh/index.jsp");
                    return; // Terminar la ejecución del método después de la redirección
                }
            }
            request.setAttribute("message", mensaje);
            request.getRequestDispatcher("../vistas/categoriahabitacion.jsp").forward(request, response);
            
        }catch(Exception e){
            System.out.println("Error "+e.getLocalizedMessage());
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
