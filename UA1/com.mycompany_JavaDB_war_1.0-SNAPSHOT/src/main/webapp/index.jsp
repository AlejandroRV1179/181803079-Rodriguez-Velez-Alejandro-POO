<%-- 
    Document   : index
    Created on : 29/05/2020, 09:04:41 AM
    Author     : alex
--%>

<%@page import="java.sql.*"%>
<%@page import="config.*"%>
<%@page import="Dao.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    List<Usuario> usuario = new UsuarioDB().listarUsuarios(); 
        
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title>Java Bootstrap</title>
    </head>
    <body>
        <div class="container">
            <table class="table table-dark">
                <tr>
                    <td colspan="2">Usuarios</td>
                    <td><a class="btn btn-success btn-block" href="formularioUsuario.jsp">Agregar Usuario</a></td>
                </tr>
                <tr>
                    <td>#</td>
                    <td>Usuario</td>
                    <td>Contraseña</td>
                    <td>Edad</td>
                </tr>
                <% for(Usuario usr: usuario){ %>
                <tr>
                    <td><%= usr.getId_usuario()%></td>
                    <td><%= usr.getUsuario()%></th>
                    <td><%= usr.getPassword()%></td>
                    <td><%= usr.getEdad()%></td>
                    <td><a class="btn btn-warning btn-block" href="formularioUsuario.jsp?id=<%=usr.getId_usuario()%>&nombre=<%=usr.getUsuario()%>&edad=<%=usr.getEdad()%>">Editar usuario</a></td>
                    <td><a class="btn btn-info btn-block" href="formularioPassword.jsp?userID=<%=usr.getId_usuario()%>">Cambiar contraseña</a></td>
                    <td><a class="btn btn-danger btn-block" href="confirmarEliminarUsuario.jsp?id=<%=usr.getId_usuario()%>&nombre=<%=usr.getUsuario()%>">Eliminar usuario</a></td>
                </tr>
                <% } %>
            </table>
        </div>
    </body>
</html>
