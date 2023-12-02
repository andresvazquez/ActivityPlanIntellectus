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
	overflow: auto;
	background-color: #001f3f;
}

body::before {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
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
	min-height: 100vh;
}

.card {
	background-color: #333;
	padding: 20px;
	margin: 20px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	overflow: hidden;
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

.table-container {
	max-height: 300px;
	overflow-y: auto;
}

table {
	width: 100%;
	table-layout: fixed;
	border-collapse: collapse;
	margin-top: 10px;
}

th, td {
	border: 1px solid white;
	padding: 8px;
	text-align: left;
	overflow-x: auto;
}

a {
	color: #007BFF; /* Color azul */
	text-decoration: underline; /* Subrayado */
}

.card ul {
	list-style-type: none;
	padding: 0;
	margin: 0;
	overflow-y: auto;
	max-height: 100px;
}

.long-field-cell {
	white-space: pre-wrap;
	word-wrap: break-word;
}

.scrollable-cell {
	max-height: 50px !important;
	overflow-y: auto !important;
	overflow-x: auto !important;
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
			<div class="table-container">
				<table>
					<tr>
						<th>Nombre Asignación</th>
						<th>Detalle</th>
						<th>Fecha Inicio</th>
						<th>Fecha Fin</th>
						<th>Horas</th>
						<th>Estado</th>
						<th>Prioridad</th>
					</tr>
					<%
					for (Asignacion asign : asignaciones) {
					%>
					<tr>
						<td class="long-field-cell scrollable-cell"><a
							href="detalleAsignacion.jsp?id=<%=asign.getId_asignacion()%>"><%=asign.getNombreAsignacion()%></a></td>
						<td class="long-field-cell scrollable-cell"><%=asign.getDetalle()%></td>
						<td><%=asign.getFch_inicio()%></td>
						<td><%=asign.getFch_fin()%></td>
						<td><%=asign.getHoras()%></td>
						<td><%=asign.getEstado()%></td>
						<td><%=asign.getPrioridad()%></td>
					</tr>
					<%
					}
					%>
				</table>
			</div>

		</div>
	</div>
</body>

</html>
