<%-- 
    Document   : eliminarUsuario
    Created on : 19/06/2020, 10:29:20 PM
    Author     : aleja
--%>
<%@page import="java.sql.*"%>
<%@page import="Dao.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    UsuarioDB usuario = new UsuarioDB();
    boolean eliminado = usuario.eliminarUsuario(new Usuario(id));
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Usuario</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    </head>
    <body>
        <%
        if(eliminado){
        %> <h1 align="center">El usuario ha sido eliminado satisfactoriamente</h1><br> <%
        }else{
        %> <h1 align="center">Ha sucedido un error al eliminar al usuario: </h1><br><%
        }
        %>
        <div class="container">
            <table class="table table-dark" align="center">
                <tr>
                    <td colspan="2"><a class="btn btn-success btn-block" href="index.jsp">Ir al Inicio</td>
                </tr>
            </table>
        </div> 
    </body>
</html>
