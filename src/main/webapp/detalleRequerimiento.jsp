<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.BaseDeDatos"%>
<%@ page import="model.Requerimiento"%>

<%
// Obtén el ID del requerimiento desde los parámetros de la URL
int idRequerimiento = Integer.parseInt(request.getParameter("id"));

// Obtén el requerimiento correspondiente al ID
Requerimiento requerimiento = BaseDeDatos.obtenerRequerimientoPorID(idRequerimiento);
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Detalles del Requerimiento</title>
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
            margin: 20px auto;
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
    </style>
</head>

<body>
    <h2>Detalles del Requerimiento</h2>

    <table>
        <tr>
            <td>Folio</td>
            <td><%= requerimiento.getFolio() %></td>
        </tr>
        <tr>
            <td>Detalle</td>
            <td><%= requerimiento.getDetalle() %></td>
        </tr>
    </table>
    <br><br>

    <form action="detalleAsignacion.jsp" method="get">
        <input type="submit" value="Regresar a Detalle de Asignación">
    </form>
</body>

</html>
