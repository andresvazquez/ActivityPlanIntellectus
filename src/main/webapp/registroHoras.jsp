<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.BaseDeDatos"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Locale"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
// Obtén el ID de la asignación desde los parámetros de la URL
int id_asignacion = Integer.parseInt(request.getParameter("id"));
System.out.println(id_asignacion);
// Formato de fecha para mostrar en las consultas
SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy", Locale.getDefault());

// Fecha actual
LocalDate fechaActual = LocalDate.now();

// Convertir fechaActual a Date
Date fechaActualDate = java.sql.Date.valueOf(fechaActual);

// Obtén las horas registradas en el día
int horasRegistradasHoy = BaseDeDatos.obtenerHorasRegistradasEnRango(id_asignacion, fechaActual, fechaActual);

// Obtén las horas registradas en la última semana
LocalDate fechaInicioSemana = fechaActual.minusDays(6);

// Convertir fechaInicioSemana y fechaActual a Date
Date fechaInicioSemanaDate = java.sql.Date.valueOf(fechaInicioSemana);

// Obtén las horas registradas en la última semana
int horasRegistradasUltimaSemana = BaseDeDatos.obtenerHorasRegistradasEnRango(id_asignacion, fechaInicioSemana,
		fechaActual);

// Formatear las fechas
String fechaInicioSemanaFormatted = dateFormat.format(fechaInicioSemanaDate);
String fechaActualFormatted = dateFormat.format(fechaActualDate);

// Obtén las horas registradas en el último mes
LocalDate fechaInicioMes = fechaActual.minusMonths(1);
Date fechaInicioMesDate = java.sql.Date.valueOf(fechaInicioMes);
int horasRegistradasUltimoMes = BaseDeDatos.obtenerHorasRegistradasEnRango(id_asignacion, fechaInicioMes, fechaActual);
%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Registro de Horas</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	overflow: auto;
	background-color: #001f3f;
	text-align: center;
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

h2, label {
	color: white;
}

.card {
	width: 20%;
	margin: 20px auto;
	background-color: #333;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	overflow: hidden;
	padding: 20px;
}

.card h3 {
	color: white;
}

.card p {
	color: white;
}

.card form {
	margin-top: 20px;
}

.card input {
	width: 80%;
	padding: 8px;
	margin: 10px;
	box-sizing: border-box;
}

.card button {
	background-color: #007BFF;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.regresar-button {
	background-color: #666; /* Cambia el color de fondo a gris */
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}
</style>
</head>

<body>
	<h2>Registro de Horas</h2>

	<!-- Tarjeta para registrar horas -->
	<div class="card">
		<h3>Registrar Horas</h3>
		<form action="ControladorRegistroHoras" method="post">
			<label for="horas">Horas a registrar (máx. 24):</label> <input
				type="number" id="horas" name="horas" min="0" max="24" required
				maxlength="2" style="width: 100px;"> <br> <input type="hidden"
				name="id_asignacion" value="<%=id_asignacion%>">
			<button type="submit">Registrar</button>
		</form>
	</div>

	<!-- Tarjeta para horas registradas en el día -->
	<div class="card">
		<h3>Horas Registradas Hoy</h3>
		<p><%=dateFormat.format(fechaActualDate)%></p>
		<p>
			<strong><%=horasRegistradasHoy%></strong> horas
		</p>
	</div>

	<!-- Tarjeta para horas registradas en la última semana -->
	<div class="card">
		<h3>Horas Registradas Última Semana</h3>
		<p><%=fechaInicioSemanaFormatted%>
			-
			<%=fechaActualFormatted%></p>
		<p>
			<strong><%=horasRegistradasUltimaSemana%></strong> horas
		</p>
	</div>

	<!-- Tarjeta para horas registradas en el último mes -->
	<div class="card">
		<h3>Horas Registradas Último Mes</h3>
		<p><%=dateFormat.format(fechaInicioMesDate)%>
			-
			<%=fechaActualFormatted%></p>
		<p>
			<strong><%=horasRegistradasUltimoMes%></strong> horas
		</p>
	</div>

	<!-- Botón para regresar a la vista de detalleAsignacion.jsp -->
	<form action="detalleAsignacion.jsp" method="get">
		<input type="submit" value="Regresar a Detalle de Asignación"
			class="regresar-button">
	</form>
</body>

</html>
