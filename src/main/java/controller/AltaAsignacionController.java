package controller;

import model.BaseDeDatos;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AltaAsignacionController")
public class AltaAsignacionController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombreUsuario = request.getParameter("nombreUsuario");
        LocalDate fch_inicio = LocalDate.parse(request.getParameter("fch_inicio"));
        LocalDate fch_fin = LocalDate.parse(request.getParameter("fch_fin"));
        String nombre_asignacion = request.getParameter("nombre_asignacion");
        String detalle = request.getParameter("detalle");
        int id_req = Integer.parseInt(request.getParameter("id_req"));
        int id_caso = Integer.parseInt(request.getParameter("id_caso"));

        boolean respuesta = BaseDeDatos.realizarAsignacion(nombreUsuario, fch_inicio, fch_fin, nombre_asignacion, detalle, id_req, id_caso);
       
        HttpSession session = request.getSession();

        if (respuesta) {
            request.setAttribute("success", "Asignación realizada con éxito.");
            List<model.Asignacion> asignaciones = model.BaseDeDatos.obtenerAsignacionesEmpleado(((model.Empleado)session.getAttribute("Empleado")).getNombreUsuario());
			session.setAttribute("asignaciones", asignaciones);
        } else {
            request.setAttribute("error", "Error al realizar la asignación.");
        }
        
        request.getRequestDispatcher("/altaAsignacion.jsp").forward(request, response);

    }
}
