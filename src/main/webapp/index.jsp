<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="controller.InicioSesion"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Intellectus Activity Plan - Login</title>
<style>
h2 {
	color: #333;
	font-size: 24px;
	margin-bottom: 20px;
	text-align: center;
}

body {
	background-color: #f2f2f2;
	font-family: Arial, sans-serif;
}

form {
	background-color: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
	max-width: 300px;
	margin: 0 auto;
}

input[type="text"] {
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
</style>
</head>
<body>
	<div>
		<h2>Inicia sesión:</h2>
		<form action="InicioSesion" method="post">
			usuario:<br> <input type="text" name="usuario" value=""><br>
			contrasena:<br> <input type="text" name="contrasena" value=""><br>
			<input type="submit" value="Inicia Sesión">
		</form>

	</div>
	<br>

	<%
	if (request.getAttribute("error") != null) {
	%>
	<p style="color: red; text-align: center;"><%=request.getAttribute("error")%></p>
	<%
	}
	%>

</body>
</html>
