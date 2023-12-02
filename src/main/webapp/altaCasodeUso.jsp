<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.BaseDeDatos"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Alta de Caso de Uso</title>
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

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            max-width: 400px;
            margin: 0 auto;
        }

        input[type="text"], input[type="date"], textarea, select {
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

        .botones-container {
            text-align: center;
        }
    </style>
</head>
<body>

    <h2>Alta de Caso de Uso</h2>

    <form action="AltaCasoDeUsoController" method="post">
        <label for="detalle">Detalle:</label>
        <textarea name="detalle" rows="4" cols="50" required></textarea>
        <br>
        <input type="submit" value="Registrar Caso de Uso">
        <a href="dashboard.jsp">
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
