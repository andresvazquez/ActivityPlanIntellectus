<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Empleado"%>
<%@ page import="model.Asignacion"%>
<%@ page import="model.Retroalimentacion"%>
<%@ page import="model.BaseDeDatos"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Arrays"%>

<%
// Obtén el objeto Empleado de la sesión
Empleado empleado = (Empleado) session.getAttribute("Empleado");

// Verifica si el empleado está autenticado, de lo contrario, redirige a index.jsp
if (empleado == null) {
	response.sendRedirect("index.jsp");
}

// Obtén el id de la asignación desde los parámetros de la URL
int id_asignacion=0;
try{
id_asignacion = Integer.parseInt(request.getParameter("id"));
}catch(Exception e){
	id_asignacion= (int)session.getAttribute("id_asignacion");
}
session.setAttribute("id_asignacion", id_asignacion);

// Obtén la asignación correspondiente al id
Asignacion asignacion = model.BaseDeDatos.obtenerAsignacionPorId(id_asignacion);

// Obtén las retroalimentaciones para esta asignación
List<Retroalimentacion> retroalimentaciones = BaseDeDatos.obtenerRetroalimentacionesPorAsignacion(id_asignacion);

// Obtén los estados posibles para el dropdown
List<String> estadosPosibles = Arrays.asList("backlog", "en progreso", "terminado");

// Obtén las prioridades posibles para el dropdown
List<String> prioridadesPosibles = Arrays.asList("baja", "media", "alta");

// Obtén el estado actual y la prioridad de la asignación
String estadoActual = asignacion.getEstado();
String prioridadActual = asignacion.getPrioridad();
%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Intellectus Activity Plan - Detalle de Asignación</title>
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

.table-container table {
	width: 100%;
	table-layout: fixed;
	border-collapse: collapse;
	margin-top: 10px;
}

.long-field-cell {
	white-space: pre-wrap;
	max-height: 100px;
	overflow-y: auto;
	word-wrap: break-word;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 10px;
}

th, td {
	border: 1px solid white;
	padding: 8px;
	text-align: center;
}

a {
	color: #007BFF;
	text-decoration: underline;
}

.comment-section {
	margin-top: 20px;
}

.comment-list {
	list-style-type: none;
	padding: 0;
	margin: 0;
}

.comment-item {
	margin-bottom: 10px;
}

.comment-form {
	margin-top: 20px;
}

.comment-form textarea {
	width: 100%;
	padding: 8px;
	margin-bottom: 10px;
	border: 1px solid #fff;
	border-radius: 5px;
}

.btn-submit {
	background-color: #007BFF;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.btn-cancel {
	background-color: #ccc;
	color: #000;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

a {
	color: #007BFF; /* Color azul */
	text-decoration: underline; /* Subrayado */
}

</style>
</head>

<body>
	<div class="sidebar">
		<h1>Intellectus</h1>
		<h2>Activity Plan</h2>
		<a href="dashboard.jsp">Regresar al Dashboard</a>
	</div>

	<div class="content">
		<h2>
			Bienvenido,
			<%=empleado.getNombreCompleto()%></h2>
		<div class="card">
			<h3>Detalles de Actividad</h3>
			<div class="table-container">
				<table>
					<tr>
						<th colspan="2" class="long-field-cell"><%=asignacion.getNombreAsignacion()%></th>
					</tr>
					<tr>
						<td>Detalle de la actividad</td>
						<td class="long-field-cell"><%=asignacion.getDetalle()%></td>
					</tr>
					<tr>
						<td><a href="<%= "detalleRequerimiento.jsp?id=" + asignacion.getId_req() %>">Requerimiento</a></td>
						<td class="long-field-cell"><%=BaseDeDatos.obtenerRequerimientoPorID(asignacion.getId_req()).getFolio()%></td>
					</tr>
					<tr>
						<td>Detalle de requerimiento</td>
						<td class="long-field-cell"><%=BaseDeDatos.obtenerRequerimientoPorID(asignacion.getId_req()).getDetalle()%></td>
					</tr>
					<tr>
						<td><a href="<%= "detalleCasoDeUso.jsp?id=" + asignacion.getId_caso() %>">Caso de uso</a></td>
						<td class="long-field-cell"><%=BaseDeDatos.obtenerCasoDeUsoPorID(asignacion.getId_caso()).getDetalle()%></td>
					</tr>
					<tr>
						<td>Fecha Inicio</td>
						<td><%=asignacion.getFch_inicio()%></td>
					</tr>
					<tr>
						<td>Fecha Fin</td>
						<td><%=asignacion.getFch_fin()%></td>
					</tr>
					<tr>
						<td>Horas</td>
						<td><%=asignacion.getHoras()%></td>
					</tr>
					<tr>
						<td>Estado</td>
						<td><%=asignacion.getEstado()%></td>
					</tr>
					<tr>
						<td>Prioridad</td>
						<td><%=asignacion.getPrioridad()%></td>
					</tr>
				</table>
			</div>
		</div>

		<div class="comment-section">
			<h3>Comentarios</h3>
			<ul class="comment-list">
				<%
				for (Retroalimentacion retro : retroalimentaciones) {
				%>
				<li class="comment-item"><strong><%=retro.getAutor()%></strong>:
					<%=retro.getComentario()%> <br> Estado anterior: <%=retro.getEstadoAnterior()%>,
					Estado nuevo: <%=retro.getEstadoNuevo()%></li>
				<%
				}
				%>
			</ul>


			<div class="comment-form">
				<form action="ControladorDeCambioEstado" method="post">
					<h3>Actualiza y/o comenta retroalimentación</h3>
					Estado:<br> <select name="estado" id="estadoDropdown">
						<%
						for (String estado : estadosPosibles) {
						%>
						<option value="<%=estado%>"
							<%=estado.equals(estadoActual) ? "selected" : ""%>><%=estado%></option>
						<%
						}
						%>
					</select> <br>Prioridad:<br> <select name="prioridad"
						id="prioridadDropdown">
						<%
						for (String prioridad : prioridadesPosibles) {
						%>
						<option value="<%=prioridad%>"
							<%=prioridad.equals(prioridadActual) ? "selected" : ""%>><%=prioridad%></option>
						<%
						}
						%>
					</select> <br>Comentario:<br>
					<textarea name="comentario" rows="4"
						placeholder="Escribe tu comentario..." required></textarea>
					<br> <input type="hidden" name="id_asignacion"
						value="<%=id_asignacion%>"> <input type="submit"
						class="btn-submit" value="Realizar Cambios">
					<button type="button" class="btn-cancel"
						onclick="window.location.href='dashboard.jsp'">Cancelar</button>
				</form>
			</div>
		</div>
	</div>
</body>

</html>
