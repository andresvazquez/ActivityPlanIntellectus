package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/ControladorDeCambioEstado")
public class ControladorDeCambioEstado extends HttpServlet {
	private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	HttpSession session = request.getSession();
    	model.Empleado empleado = (model.Empleado)session.getAttribute("Empleado");
        String comentario = request.getParameter("comentario");
        int idAsignacion = Integer.parseInt(request.getParameter("id_asignacion"));
        String nuevoEstado = request.getParameter("estado");
        String nuevaPrioridad = request.getParameter("prioridad");
        System.out.println("Nuevo Estado: " + nuevoEstado);
        System.out.println("Nueva Prioridad: " + nuevaPrioridad);
        
        boolean cambioExitoso = model.BaseDeDatos.realizarCambioEstado(empleado.getNombreCompleto(),idAsignacion, nuevoEstado,nuevaPrioridad, comentario);

        
        if (cambioExitoso) {
            response.sendRedirect("detalleAsignacion.jsp?id=" + idAsignacion);
            List<model.Asignacion> asignaciones = model.BaseDeDatos.obtenerAsignacionesEmpleado(empleado.getNombreUsuario());
			session.setAttribute("asignaciones", asignaciones);
        } else {
            response.sendRedirect("dashboard.jsp");
        }
    }

}
