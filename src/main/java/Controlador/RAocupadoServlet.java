package Controlador;

import DAO.HabitacionDAO;
import DAO.RAocupadoDAO;
import DAO.RAreservadoDAO;
import Modelo.Categoriahabitacion;
import Modelo.Habitacion;
import Modelo.Registroalojamiento;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/RAocupadoServlet"})
public class RAocupadoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            
            int idRAalojamiento = Integer.parseInt(request.getParameter("txtidRAalojamiento"));
            String idCodigohabitacion = request.getParameter("txtidCodigohabitacion");
            int idCliente = Integer.parseInt(request.getParameter("txtidCliente"));
            String fechaEntrada = request.getParameter("txtFechaEntrada");
            String fechaSalida = request.getParameter("txtFechaSalida");
            double pagoAdelantado = Double.parseDouble(request.getParameter("txtPagoAdelanto"));
            double precioTotal = Double.parseDouble(request.getParameter("txtPrecioTotal"));
            
            String estadoHabitacion = request.getParameter("txtEstadoHabitacion");
            
            
            //SEPERAMOS EL idHabitacion y CodigoHabitacion
            String[] separar = idCodigohabitacion.split("-");
            int idHabitacion = Integer.parseInt(separar[0]);
            String codigohabitacion = separar[1];
            

            // PARA LOS MENSAJES DE ERROR
            String mensaje = "Error";
            int res;
            
            Categoriahabitacion ch = new Categoriahabitacion();
            ch.setCodigoHabitacion(codigohabitacion);
            
            Habitacion h = new Habitacion();
            h.setIdHabitacion(idHabitacion);
            h.setEstadoHabitacion(estadoHabitacion);
            
            //LLAMAMOS A LA CLASE Registroalojamiento y RAreservadoDAO
            Registroalojamiento ra = new Registroalojamiento(idRAalojamiento, idHabitacion, idCliente, fechaEntrada, fechaSalida, pagoAdelantado, precioTotal,h,ch);
            ra.get_hab().setEstadoHabitacion(estadoHabitacion);
            RAocupadoDAO raDAO = new RAocupadoDAO();            

            if (request.getParameter("btnGuardar") != null)
            {
                res = raDAO.insertarRegistroalojamiento(ra);
                if (res != 0)
                {
                    mensaje = "Registro Agregado";
                    // Redireccionar a clientes.jsp después de registrar exitosamente
                    response.sendRedirect("/hoteldg_sigh/index.jsp");
                    return; // Terminar la ejecución del método después de la redirección
                }
            } else if (request.getParameter("btnEditar") != null)
            {
                res = raDAO.modificarAlojamientoreservado(ra);
                if (res != 0)
                {
                    mensaje = "Registro Modificado";
                    // Redireccionar a clientes.jsp después de registrar exitosamente
                    response.sendRedirect("/hoteldg_sigh/index.jsp");
                    return; // Terminar la ejecución del método después de la redirección
                }
            } else if (request.getParameter("btnEliminar") != null)
            {
                res = raDAO.eliminarAlojamientoreservado(ra);
                if (res != 0)
                {
                    mensaje = "Registro Eliminado";
                    // Redireccionar a clientes.jsp después de registrar exitosamente
                    response.sendRedirect("/hoteldg_sigh/index.jsp");
                    return; // Terminar la ejecución del método después de la redirección
                }
            }
            request.setAttribute("message", mensaje);
            request.getRequestDispatcher("../vistas/raocupado.jsp").forward(request, response);

        } catch (Exception e) {System.out.println("Error " + e.getLocalizedMessage());}
        
        
        
        
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
