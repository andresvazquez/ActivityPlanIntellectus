<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Empleado"%>
<%@ page import="model.BaseDeDatos"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="model.Requerimiento"%>
<%@ page import="model.CasoDeUso"%>


<%
// Obtén el objeto Empleado de la sesión
Empleado empleadoSesion = (Empleado) session.getAttribute("Empleado");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alta de Asignación</title>
<style>
.btn-form {
	background-color: #007BFF;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

h2 {
	color: #fff;
	font-size: 24px;
	margin-bottom: 20px;
	text-align: center;
}

body {
	background-color: #001f3f;
	font-family: Arial, sans-serif;
}

form:not(.logout-form) {
	background-color: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
	max-width: 400px;
	margin: 0 auto;
}

input[type="text"], input[type="date"], textarea, select {
	width: 90%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: #f9f9f9;
}

input[type="submit"] {
	background-color: #007BFF;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.botones-container {
	text-align: center;
}

#cerrarSesion {
	position: absolute;
	top: 10px;
	right: 10px;
	background-color: #ccc;
	color: #000;
	padding: 5px 10px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}
</style>
</head>
<body>
	<form action="CerrarSesion" method="get" class="logout-form">
		<input type="submit" value="Cerrar Sesión" id="cerrarSesion">
	</form>
	<h2>Alta de Asignación</h2>

	<form action="AltaAsignacionController" method="post">
		<label for="empleados">Seleccionar Empleado:</label> <select
			name="nombreUsuario" id="empleados">
			<%
			List<Empleado> empleados = BaseDeDatos.obtenerTodosLosEmpleados();
			%>
			<%
			for (Empleado empleado : empleados) {
			%>
			<option value="<%=empleado.getNombreUsuario()%>"
				<%=(empleado.getNombreUsuario().equals(empleadoSesion.getNombreUsuario())) ? "selected" : ""%>>
				<%=empleado.getNombreCompleto()%></option>
			<%
			}
			%>
		</select> <br> <label for="fch_inicio">Fecha de Inicio:</label> <input
			type="date" name="fch_inicio"
			value="<%=java.time.LocalDate.now().minusDays(1)%>" required>
		<br> <label for="fch_fin">Fecha de Fin:</label> <input
			type="date" name="fch_fin" value="<%=java.time.LocalDate.now()%>"
			min="<%=java.time.LocalDate.now().minusDays(1)%>" required> <br>
		<label for="nombre_asignacion">Nombre de Asignación:</label> <input
			type="text" name="nombre_asignacion" required> <br> <label
			for="detalle">Detalle:</label>
		<textarea name="detalle" rows="4" cols="50" required></textarea>
		<br> <label for="id_req">ID Requerimiento:</label> <select
			name="id_req">
			<%
			List<Requerimiento> requerimientos = BaseDeDatos.obtenerTodosLosRequerimientos();
			%>
			<%
			for (Requerimiento req : requerimientos) {
			%>
			<option value="<%=req.getId_req()%>"><%=req.getFolio()%></option>
			<%
			}
			%>
		</select> <br> <label for="id_caso">ID Caso de Uso:</label> <select
			name="id_caso">
			<%
			List<CasoDeUso> casosDeUso = BaseDeDatos.obtenerTodosLosCasosDeUso();
			%>
			<%
			for (CasoDeUso caso : casosDeUso) {
			%>
			<option value="<%=caso.getId_caso()%>"><%=caso.getId_caso()%></option>
			<%
			}
			%>
		</select> <br> <input type="submit" value="Crear Asignación"> <a
			href="dashboard.jsp">
			<button type="button" class="btn-form">Cancelar</button>
		</a>

		<%
		if (request.getAttribute("error") != null) {
		%>
		<p style="color: red; text-align: center;"><%=request.getAttribute("error")%></p>
		<%
		} else if (request.getAttribute("success") != null) {
		%>
		<p style="color: green; text-align: center;"><%=request.getAttribute("success")%></p>
		<%
		}
		%>
	</form>

</body>
</html>
