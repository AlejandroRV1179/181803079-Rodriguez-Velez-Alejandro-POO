<%-- 
    Document   : eliminarAviso
    Created on : 5/07/2020, 12:54:27 AM
    Author     : Alex
--%>
<%@page import="Dao.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    AvisoBD aviso = new AvisoBD();
    boolean eliminado = aviso.eliminarAviso(new Aviso(id));
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title>Eliminar Aviso</title>
    </head>
    <body>
        <%
        if(eliminado){
        %> <h1 align="center">El aviso ha sido eliminado satisfactoriamente</h1><br> <%
        }else{
        %> <h1 align="center">Ha sucedido un error al eliminar el aviso </h1><br><%
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
