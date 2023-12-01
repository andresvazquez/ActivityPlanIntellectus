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
</style>
</head>

<body>
	<div class="sidebar">
		<h1>
			Intellectus
			</h2>
			<h2>Activity Plan
		</h1>
		<%
		if (esAdmin) {
		%>
		<a href="altaEmpleado.jsp">Dar de alta un nuevo empleado</a> <a
			href="nuevaAsignacion.jsp">Crear nuevas asignaciones</a>
		<%
		}
		%>
		<a href="visualizarAsignaciones.jsp">Visualizar asignaciones
			asignadas</a>
	</div>

	<div class="content">
		<!-- Aquí va el contenido específico de cada página -->
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
			<!-- Agrega más información del empleado según tus necesidades -->
		</div>
		<div class="card">
			<h3>Asignaciones:</h3>
			<ul>
				<%
				for (Asignacion a : asignaciones) {
				%>
				<li>Nombre: <%=a.getNombreAsignacion() %></li>
				<%
				}
				%>
			</ul>
		</div>
	</div>
</body>

</html>
