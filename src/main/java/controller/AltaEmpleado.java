package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AltaEmpleado")
public class AltaEmpleado extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AltaEmpleado() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/altaEmpleado.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        registrarEmpleado(request, response);
    }

    public void registrarEmpleado(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombreCompleto = request.getParameter("nombreCompleto");
        String nombreUsuario = request.getParameter("nombreUsuario");
        String contrasena = request.getParameter("contrasena");
        String sexo = request.getParameter("sexo");
        String correo = request.getParameter("correo");
        String telefono = request.getParameter("telefono");
        String fechaNacimiento = request.getParameter("fechaNacimiento");
        int es_admin = Integer.parseInt(request.getParameter("es_admin"));

        boolean respuesta = model.BaseDeDatos.registrarEmpleado(nombreCompleto, nombreUsuario, contrasena, sexo,
                correo, telefono, java.time.LocalDate.parse(fechaNacimiento), es_admin);
        
        if (respuesta) {
        	request.setAttribute("success", "Empleado registrado correctamente.");
            request.getRequestDispatcher("/altaEmpleado.jsp").forward(request, response);
        } else {
        	request.setAttribute("error", "Error al registrar empleado. Intenta de nuevo.");
            request.getRequestDispatcher("/altaEmpleado.jsp").forward(request, response);
        }
    }
}
