<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.BaseDeDatos"%>
<%@ page import="model.CasoDeUso"%>

<%
// Obtén el ID del caso de uso desde los parámetros de la URL
int idCasoDeUso = Integer.parseInt(request.getParameter("id"));

// Obtén el caso de uso correspondiente al ID
CasoDeUso casoDeUso = BaseDeDatos.obtenerCasoDeUsoPorID(idCasoDeUso);
%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Detalles del Caso de Uso</title>
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
	background: url('images/background.jpg') center/cover no-repeat;
	opacity: .9;
	z-index: -1;
}

h2 {
	color: white;
}

table {
	width: 50%;
	margin: 20px auto; /* Añadido para centrar la tabla */
	border-collapse: collapse;
	background-color: #333;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	overflow: hidden;
}

td {
	border: 1px solid white;
	padding: 8px;
	text-align: left;
	color: white;
}

input[type="submit"] {
	background-color: #007BFF;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
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
	<form action="CerrarSesion" method="get">
		<input type="submit" value="Cerrar Sesión" id="cerrarSesion">
	</form>
	<h2>Detalles del Caso de Uso</h2>

	<table>
		<tr>
			<td>Detalle</td>
			<td><%= casoDeUso.getDetalle() %></td>
		</tr>
		<!-- Agrega más detalles según tus necesidades -->
	</table>

	<form action="detalleAsignacion.jsp" method="get">
		<input type="submit" value="Regresar a Detalle de Asignación">
	</form>
</body>

</html>
