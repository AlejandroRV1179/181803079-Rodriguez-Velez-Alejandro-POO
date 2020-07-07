<%-- 
    Document   : editarAutorAviso
    Created on : 5/07/2020, 06:09:09 PM
    Author     : Alex
--%>

<%@page import="Dao.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    AvisoBD aviso = new AvisoBD();
    boolean editado;
    editado = aviso.editarAvisoAutor(new Aviso(Integer.parseInt(request.getParameter("id_autor")),Integer.parseInt(request.getParameter("id_aviso"))));
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title>Cambiar Autor de Aviso</title>
    </head>
    <body>
        <%
        if(editado){
        %> <h1>Los datos han sido editados satisfactoriamente</h1><br> <%
        }else{
        %> <h1>Ha sucedido un error al editar los datos: </h1><br><%
        }
        %>
        <div class="container">
            <table class="table table-dark" align="center">
                <tr>
                    <td colspan="2"><a class="btn btn-success btn-block" href="index.jsp">Ir al Inicio</td>
                    <!--<td colspan="2"><a class="btn btn-success btn-block" href="formularioUsuario.jsp">Ir al Formulario</a></td>
             --></tr>
            </table>
        </div>  
    </body>
</html>
