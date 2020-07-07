<%-- 
    Document   : confirmarEliminarAviso
    Created on : 4/07/2020, 09:31:22 PM
    Author     : Alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String label = "¿Estás seguro de eliminar este aviso?";
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <br><h1 align="center"><%= label%></h1>
        <div class="container">
            <table class="table table-dark" align="center">
                <br>
                <tr>
                    <td colspan="2"><a class="btn btn-danger btn-block" href="eliminarAviso.jsp?id=<%=id%>">Sí, eliminar</td>
                    <td colspan="2"><a class="btn btn-info btn-block" href="index.jsp">No, regresar</a></td>
                </tr>
                <br>
            </table>
        </div> 
    </body>
</html>
