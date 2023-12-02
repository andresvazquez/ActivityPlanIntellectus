package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/AltaCasoDeUsoController")
public class AltaCasoDeUsoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String detalle = request.getParameter("detalle");

        boolean exito = model.BaseDeDatos.registrarCasoDeUso(detalle);

        if (exito) {
            request.setAttribute("success", "Caso de Uso registrado exitosamente.");
        } else {
            request.setAttribute("error", "Error al registrar caso de uso.");
        }

        
        request.getRequestDispatcher("/altaCasodeUso.jsp").forward(request, response);
    }

}
