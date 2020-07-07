<%-- 
    Document   : confirmarEliminarAutor
    Created on : 4/07/2020, 09:34:26 PM
    Author     : Alex
--%>

<%@page import="Dao.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String nombre = request.getParameter("nombre");
    int id = Integer.parseInt(request.getParameter("id"));
    AutorBD autor = new AutorBD();
    boolean tieneAvisos = autor.tieneAvisosAutor(new Autor(id));
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title>Confirmación</title>
    </head>
    <body>
        <% if (tieneAvisos) { %>
            <br><h1 align="center">No se puede eliminar el autor "<%=nombre%>" porque tiene un aviso o más</h1>
            <div class="container">
            <table class="table table-dark" align="center">
                <br>
                <tr>
                    <td colspan="2"><a class="btn btn-info btn-block" href="index.jsp">Regresar</a></td>
                </tr>
                <br>
            </table>
        </div> 
        <% }else{ %>
        <br><h1 align="center"><%= nombre%>, ¿Estás seguro de eliminar este autor?</h1>
        <div class="container">
            <table class="table table-dark" align="center">
                <br>
                <tr>
                    <td colspan="2"><a class="btn btn-danger btn-block" href="eliminarAutor.jsp?id=<%=id%>">Sí, eliminar</td>
                    <td colspan="2"><a class="btn btn-info btn-block" href="index.jsp">No, regresar</a></td>
                </tr>
                <br>
            </table>
        </div> 
        <% } %>
    </body>
</html>
