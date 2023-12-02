<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="controller.AltaEmpleado"%>
<html>
<head>
<meta charset="UTF-8">
<title>Registro de Empleado</title>
<style>
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

form {
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
</style>
</head>
<body>
	<div>
		<h2>Registro de Empleado</h2>
		<form action="AltaEmpleado" method="post">
			Nombre Completo:<br> <input type="text" name="nombreCompleto"
				required><br> <br> Nombre de Usuario (mínimo 8
			caracteres):<br> <input type="text" name="nombreUsuario"
				pattern=".{8,}" required title="Mínimo 8 caracteres"><br>
			<br> Contraseña (mínimo 6 caracteres):<br> <input
				type="password" name="contrasena" pattern=".{6,}" required
				title="Mínimo 6 caracteres"><br> <br> Sexo:<br>
			<select name="sexo">
				<option value="H">Hombre</option>
				<option value="M">Mujer</option>
			</select><br> <br> Correo Electrónico:<br> <input type="email"
				name="correo" required><br> <br> Teléfono:<br>
			<input type="tel" name="telefono" pattern="\d{10}"
				title="El teléfono debe tener 10 dígitos" maxlength="10" required><br>
			<br> Fecha de Nacimiento:<br> <input type="date"
				name="fechaNacimiento"
				max="<%=java.time.LocalDate.now().minusYears(18)%>"
				min="<%=java.time.LocalDate.now().minusYears(80)%>"
				value="<%=java.time.LocalDate.now().minusYears(18)%>" required><br>
			<br> Administrador:<br> <select name="es_admin">
				<option value="0">No</option>
				<option value="1">Sí</option>

			</select><br> <br>
			<div class="botones-container">
				<input type="submit" value="Registrar Empleado"> <a
					href="dashboard.jsp"><button type="button" class="btn-form">Cancelar</button></a>
			</div>
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
	</div>
	<br>
</body>
</html>
