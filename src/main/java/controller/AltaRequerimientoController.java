package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/AltaRequerimientoController")
public class AltaRequerimientoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String folio = "REQ" + request.getParameter("folio");
        String detalle = request.getParameter("detalle");

        boolean exito = model.BaseDeDatos.registrarRequerimiento(folio, detalle);

        if (exito) {
            request.setAttribute("success", "Requerimiento registrado exitosamente.");
        } else {
            request.setAttribute("error", "Error al registrar requerimiento.");
        }
        
        request.getRequestDispatcher("/altaRequerimiento.jsp").forward(request, response);
    }

}
