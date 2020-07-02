<%-- 
    Document   : agregarUsuario
    Created on : 12/06/2020, 09:16:14 AM
    Author     : aleja
--%>
<%@page import="java.sql.*"%>
<%@page import="Dao.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    UsuarioDB usuario = new UsuarioDB();
    boolean agregado; 
    agregado = usuario.agregarUsuario(new Usuario(request.getParameter("usuario"), request.getParameter("password"), Integer.parseInt(request.getParameter("edad"))));
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title>Agregar Usuario</title>
    </head>
    <body>
        <%
        if(agregado){
        %> <h1>Los datos han sido almacenados satisfactoriamente</h1><br> <%
        }else{
        %> <h1>Ha sucedido un error al almacenar los datos: </h1><br><%
        }
%>
        <div class="container">
            <table class="table table-dark" align="center">
                <tr>
                    <td colspan="2"><a class="btn btn-success btn-block" href="index.jsp">Ir al Inicio</td>
                    <td colspan="2"><a class="btn btn-success btn-block" href="formularioUsuario.jsp">Ir al formulario</a></td>
                </tr>
            </table>
        </div>    
    </body>
</html>
