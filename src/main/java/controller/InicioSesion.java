package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/InicioSesion")
public class InicioSesion extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public InicioSesion() {
		super();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		autenticaUsuario(request,response);
	}

	protected void autenticaUsuario(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String usuario = request.getParameter("usuario");
		String contrasena = request.getParameter("contrasena");
		boolean respuesta = model.BaseDeDatos.validaCredenciales(usuario, contrasena);

		HttpSession session = request.getSession();

		if(respuesta) {
			model.Empleado Empleado = model.BaseDeDatos.obtenerEmpleadoPorNombre(usuario);
			session.setAttribute("Empleado", Empleado);
			List<model.Empleado> empleados = model.BaseDeDatos.obtenerTodosLosEmpleados();
			session.setAttribute("empleados", empleados);
			List<model.Asignacion> asignaciones = model.BaseDeDatos.obtenerAsignacionesEmpleado(Empleado.getNombreUsuario());
			session.setAttribute("asignaciones", asignaciones);
			request.getRequestDispatcher("/dashboard.jsp").forward(request, response);

		}else {
			request.setAttribute("error", "Credenciales incorrectas. Por favor, inténtalo de nuevo.");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}

	}

	  protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        // ...

	        // Obtener el nombre del empleado seleccionado del parámetro del request
	        String nombreEmpleadoSeleccionado = request.getParameter("nombreEmpleadoSeleccionado");

	        // Obtener la sesión
	        HttpSession session = request.getSession();

	        if (nombreEmpleadoSeleccionado != null) {
	            try {
	                // Obtener el empleado seleccionado por el nombre
	                model.Empleado empleadoSeleccionado = model.BaseDeDatos.obtenerEmpleadoPorNombre(nombreEmpleadoSeleccionado);

	                // Almacenar el empleado seleccionado en la sesión
	                session.setAttribute("empleadoSeleccionado", empleadoSeleccionado);

	                // Obtener las asignaciones del empleado seleccionado
	                List<model.Asignacion> asignaciones = model.BaseDeDatos.obtenerAsignacionesEmpleado(empleadoSeleccionado.getNombreUsuario());

	                // Almacenar las asignaciones en la sesión
	                session.setAttribute("asignaciones", asignaciones);

	            } catch (NullPointerException e) {
	                e.printStackTrace();
	            }
	        }

	        // Redirigir a dashboard.jsp
	        response.sendRedirect(request.getContextPath() + "/dashboard.jsp");
	    }



}
