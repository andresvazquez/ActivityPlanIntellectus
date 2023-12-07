package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/AsignarAsignacionController")
public class AsignarAsignacionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String idEmpleadoStr = request.getParameter("idEmpleado");
	        String idAsignacionStr = request.getParameter("idAsignacion");

	        if (idEmpleadoStr != null && idAsignacionStr != null) {
	            int idEmpleado = Integer.parseInt(idEmpleadoStr);
	            int idAsignacion = Integer.parseInt(idAsignacionStr);
	            boolean asignacionExitosa = model.BaseDeDatos.asignarAsignacionAEmpleado(idEmpleado, idAsignacion);
	            
	            //se actualiza la lista de asignaciones
	            HttpSession session = request.getSession();
	            model.Empleado empleado= (model.Empleado)session.getAttribute("Empleado");
	            List<model.Asignacion> asignaciones = model.BaseDeDatos.obtenerAsignacionesEmpleado(empleado.getNombreUsuario());
				session.setAttribute("asignaciones", asignaciones);
	            
	            if (asignacionExitosa) {
	            	request.setAttribute("success", "Asignación realizada correctamente.");
	            } else {
	            	request.setAttribute("error", "Error al asignar. Intenta de nuevo.");
	            }
	            request.getRequestDispatcher("/asignarAsignacion.jsp").forward(request, response);
	        } 
	    }
}
