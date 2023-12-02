package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


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

	            
	            if (asignacionExitosa) {
	            	request.setAttribute("success", "Asignación realizada correctamente.");
	            } else {
	            	request.setAttribute("error", "Error al asignar. Intenta de nuevo.");
	            }
	            request.getRequestDispatcher("/asignarAsignacion.jsp").forward(request, response);
	        } 
	    }
}
