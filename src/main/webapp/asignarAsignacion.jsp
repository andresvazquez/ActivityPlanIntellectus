<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Empleado"%>
<%@ page import="model.Asignacion"%>
<%@ page import="model.BaseDeDatos"%>

<%
// Obtén el objeto Empleado de la sesión
Empleado empleadoSesion = (Empleado) session.getAttribute("Empleado");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Realizar una Asignación</title>
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

input[type="text"], input[type="password"], select, input[type="number"],
	input[type="date"] {
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

.btn-form {
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
	<h2>Cambiar una Asignación de empleado</h2>

	<form action="AsignarAsignacionController" method="post">
		<label for="empleados">Seleccionar Empleado:</label> <select
			name="idEmpleado" id="empleados">
			<% List<Empleado> empleados = BaseDeDatos.obtenerTodosLosEmpleados(); %>
			<% for (Empleado empleado : empleados) { %>
			<option value="<%= empleado.getIdEmpleado() %>"
				<%= (empleado.getIdEmpleado() == empleadoSesion.getIdEmpleado()) ? "selected" : "" %>>
				<%= empleado.getNombreCompleto() %></option>
			<% } %>
		</select> <br> <label for="asignaciones">Seleccionar Asignación:</label> <select
			name="idAsignacion" id="asignaciones">
			<% List<Asignacion> asignaciones = BaseDeDatos.obtenerTodasLasAsignaciones(); %>
			<% for (Asignacion asignacion : asignaciones) { %>
			<option value="<%= asignacion.getId_asignacion() %>"><%= asignacion.getNombreAsignacion() %></option>
			<% } %>
		</select> <br> <input type="submit" value="Asignar"> <a
			href="dashboard.jsp">
			<button type="button" class="btn-form">Cancelar</button>
		</a>

		<% if (request.getAttribute("error") != null) { %>
		<p style="color: red; text-align: center;"><%= request.getAttribute("error") %></p>
		<% } else if (request.getAttribute("success") != null) { %>
		<p style="color: green; text-align: center;"><%= request.getAttribute("success") %></p>
		<% } %>
	</form>

</body>
</html>
