package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ControladorRegistroHoras")
public class ControladorRegistroHoras extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener parámetros del formulario
        int id_asignacion = Integer.parseInt(request.getParameter("id_asignacion"));
        int horas = Integer.parseInt(request.getParameter("horas"));
        System.out.println("Horas a registrar" +horas);
        System.out.println("id a registrar" +id_asignacion);
        // Registrar horas trabajadas
        boolean registroExitoso = model.BaseDeDatos.registrarHorasTrabajadas(id_asignacion, horas);

        // Redirigir a la vista de registroHoras.jsp
        if (registroExitoso) {
            response.sendRedirect("registroHoras.jsp?id=" + id_asignacion);
        } else {
            // Manejar error si es necesario
            response.getWriter().println("Error al registrar horas trabajadas");
        }
    }
}
