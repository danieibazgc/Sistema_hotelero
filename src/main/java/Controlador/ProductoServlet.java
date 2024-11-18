
package Controlador;

import DAO.ProductoDAO;
import Modelo.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/ProductoServlet"})
public class ProductoServlet extends HttpServlet {

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
            int idProducto = Integer.parseInt(request.getParameter("txtproductoId"));
            String codigoProducto = request.getParameter("txtCodigoProducto");
            String nombreproducto = request.getParameter("txtNombreProducto");
            String descripcion = request.getParameter("txtDescripcion");
            String tipoproducto = request.getParameter("txtTipoProducto");
            double precio = Double.parseDouble(request.getParameter("txtPrecio"));
            int stock = Integer.parseInt(request.getParameter("txtStock"));
            String estadoproducto = request.getParameter("txtEstado");
            String mensaje = "Error";
            int res;
            
            Producto p = new Producto(idProducto, codigoProducto, nombreproducto, descripcion, tipoproducto, precio, stock, estadoproducto);
            ProductoDAO productoDAO = new ProductoDAO();
            
            if(request.getParameter("btnGuardar") != null){
                res = productoDAO.insertarProductos(p);
                if(res != 0){
                    mensaje = "Registro Agregado";
                    // Redireccionar a clientes.jsp después de registrar exitosamente
                    response.sendRedirect("/hoteldg_sigh/index.jsp");
                    return; // Terminar la ejecución del método después de la redirección
                }
            }else if(request.getParameter("btnEditar") != null){
                res = productoDAO.modificarProductos(p);
                if(res != 0){
                    mensaje = "Registro Modificado";
                    // Redireccionar a clientes.jsp después de registrar exitosamente
                    response.sendRedirect("/hoteldg_sigh/index.jsp");
                    return; // Terminar la ejecución del método después de la redirección
                }
            }else if(request.getParameter("btnEliminar") != null){
                res = productoDAO.eliminarProductos(p);
                if(res != 0){
                    mensaje = "Registro Eliminado";
                    // Redireccionar a clientes.jsp después de registrar exitosamente
                    response.sendRedirect("/hoteldg_sigh/index.jsp");
                    return; // Terminar la ejecución del método después de la redirección
                }
            }
            request.setAttribute("message", mensaje);
            request.getRequestDispatcher("../vistas/productos.jsp").forward(request, response);
            
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
