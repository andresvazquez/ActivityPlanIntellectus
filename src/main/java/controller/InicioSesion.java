package controller;

import java.io.IOException;
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
			request.getRequestDispatcher("/.jsp").forward(request, response);
			
		}else {
			request.setAttribute("error", "Credenciales incorrectas. Por favor, inténtalo de nuevo.");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}

	}

}
