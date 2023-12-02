<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Intellectus Activity Plan - Login</title>
<style>
body {
	background-color: #f2f2f2;
	font-family: 'Arial', sans-serif;
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100vh;
	margin: 0;
}

body::before {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: url('images/background.jpg') center/cover no-repeat;
	opacity: 1; 
	z-index: -1;
}

.logo-container {
	margin-right:0px;
	z-index: 1;
}

.login-container {
	background-color: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	max-width: 400px;
	width: 100%;
	box-sizing: border-box;
	text-align: center;
	z-index: 1;
}

h2 {
	color: #007BFF;
	font-size: 28px;
	margin-bottom: 20px;
}

label {
	display: block;
	margin-bottom: 8px;
	font-weight: bold;
	color: #333;
}

input[type="text"] {
	width: 100%;
	padding: 12px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
	font-size: 16px;
}

input[type="submit"] {
	background-color: #007BFF;
	color: #fff;
	padding: 14px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 18px;
	display: block;
	width: 100%;
}

.error-message {
	color: red;
	margin-top: 15px;
}
</style>
</head>

<body>
	<div class="logo-container">
		<img src="images/logo.png" alt="Logo de Intellectus"
			style="max-width: 60%; height: auto;">
	</div>
	<div class="login-container">
		<h2>Inicia sesión:</h2>
		<form action="InicioSesion" method="post">
			<label for="usuario">Usuario:</label> <input type="text" id="usuario"
				name="usuario" value="" required> <label for="contrasena">Contraseña:</label>
			<input type="text" id="contrasena" name="contrasena" value=""
				required> <input type="submit" value="Inicia Sesión">
		</form>
		<%
		if (request.getAttribute("error") != null) {
		%>
		<p class="error-message"><%=request.getAttribute("error")%></p>
		<%
		}
		%>
	</div>
</body>

</html>
