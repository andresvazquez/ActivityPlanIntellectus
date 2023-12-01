<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Empleado"%>
<%@ page import="model.Asignacion"%>
<%@ page import="java.util.List"%>

<%
// Obtén el objeto Empleado de la sesión
Empleado empleado = (Empleado) session.getAttribute("Empleado");

// Lista de asignaciones
List<Asignacion> asignaciones = (List<Asignacion>) session.getAttribute("asignaciones");

// Verifica si el empleado es administrador
boolean esAdmin = (empleado != null && empleado.getEs_admin() == 1);

//Verifica si el empleado está autenticado, de lo contrario, redirige a index.jsp
if (empleado == null) {
 response.sendRedirect("index.jsp");
}
%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Intellectus Activity Plan - Dashboard</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	overflow: hidden;
}

body::before {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: url('images/background.jpg') center/cover no-repeat;
	opacity: .9;
	z-index: -1;
}

.sidebar {
	height: 100%;
	width: 250px;
	position: fixed;
	background-color: #205;
	padding-top: 20px;
	text-align: center;
	color: white;
	overflow-y: auto;
}

.sidebar a {
	padding: 8px;
	text-decoration: none;
	font-size: 18px;
	color: white;
	display: block;
}

.sidebar a:hover {
	background-color: #209;
}

.content {
	margin-left: 250px;
	padding: 20px;
	color: white;
}

.card {
	background-color: #333;
	padding: 20px;
	margin: 20px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.card h3 {
	color: #fff;
}

select {
	width: 100%;
	padding: 8px;
	margin-top: 8px;
	margin-bottom: 16px;
	box-sizing: border-box;
}

.card ul {
	list-style-type: none;
	padding: 0;
	margin: 0;
	overflow-y: auto;
	max-height: 100px;
}
</style>
</head>

<body>
	<div class="sidebar">
		<h1>Intellectus</h1>
		<h2>Activity Plan</h2>
		<%
		if (esAdmin) {
		%>
		<a href="altaEmpleado.jsp">Dar de alta un nuevo empleado</a> <a
			href="asignarAsignacion.jsp">Realizar una asignación</a> <a
			href="altaAsignacion.jsp">Dar de alta una nueva asignación</a> <a
			href="altaRequerimiento.jsp">Dar de alta un nuevo requerimiento</a> <a
			href="altaCasodeUso.jsp">Dar de alta un nuevo caso de uso</a>
		<%
		}
		%>
		<a href="visualizarAsignaciones.jsp">Visualizar mis asignaciones </a>
	</div>

	<div class="content">
		<h2>
			Bienvenido,
			<%=empleado.getNombreCompleto()%></h2>
		<div class="card">
			<h3>Contacto:</h3>
			<p>
				Correo electrónico:
				<%=empleado.getCorreo()%></p>
			<p>
				Telefono:
				<%=empleado.getTelefono()%></p>
		</div>
		<div class="card">
			<h3>Asignaciones:</h3>
			<ul>
				<%
				for (Asignacion asign : asignaciones) {
				%>
				<li>-<%=asign.getNombreAsignacion() %></li>
				<%
				}
				%>
			</ul>

			<select name="asignaciones" id="asignacionesDropdown">
				<% for (Asignacion asign : asignaciones) { %>
				<option value="<%= asign.getId_asignacion() %>"><%= asign.getNombreAsignacion() %></option>
				<% } %>
			</select>
		</div>
	</div>
</body>

</html>
