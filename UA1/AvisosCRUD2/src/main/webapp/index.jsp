<%-- 
    Document   : index
    Created on : 6/06/2020, 08:06:24 PM
    Author     : Alejandro Rodriguez Velez
--%>

<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@page import="Dao.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Aviso> avisos = new AvisoBD().listarAvisosIndex();
    List<Autor> autores = new AutorBD().listarAutores();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://bootswatch.com/3/flatly/bootstrap.min.css">
        <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
      -->  <title>Avisos</title>
    </head>
    <body>
        <h1 align="center">Avisos</h1>

        <div class="container">
            <table class="table table-striped table-hover">
                <tr>
                    <td colspan="2">Avisos</td>
                    <td><a class="btn btn-success btn-block" href="formularioAviso.jsp">Agregar Aviso</a></td>
                </tr>
                <tr>
                    <td>#</td>
                    <td>Encabezado</td>
                    <td>Subtitulo</td>
                    <td>Cuerpo</td>
                    <td>Autor</td>
                </tr>
                <% for (Aviso aviso : avisos) {%>
                <tr>
                    <td><%= aviso.getId_aviso()%></td>
                    <td><%= aviso.getEncabezado()%></td>
                    <td><%= aviso.getSubtitulo()%></td>
                    <td><%= aviso.getCuerpo()%></td>
                    <td><%= aviso.getNombreAutor()%></td>
                    <td><a class="btn btn-warning btn-block" href="formularioAviso.jsp?id=<%=aviso.getId_aviso()%>&encabezado=<%=aviso.getEncabezado()%>&subtitulo=<%=aviso.getSubtitulo()%>&cuerpo=<%=aviso.getCuerpo()%>">Editar Aviso</a></td>
                    <td><a class="btn btn-info btn-block" href="formularioCambiarAutor.jsp?id_aviso=<%=aviso.getId_aviso()%>&nombre=<%= aviso.getNombreAutor()%>">Cambiar Autor</a></td>
                    <td><a class="btn btn-danger btn-block" href="confirmarEliminarAviso.jsp?id=<%=aviso.getId_aviso()%>">Eliminar Aviso</a></td> 
                </tr>
                <% } %>
            </table>
        </div>

        <h1 align="center">Catálogo de Autores de Avisos</h1>
        <div class="container">
            <table class="table table-striped table-hover">
                <tr>
                    <td colspan="2">Autores</td>
                    <td><a class="btn btn-success btn-block" href="formularioAutor.jsp">Agregar Autor</a></td>
                </tr>
                <tr>
                    <td>#</td>
                    <td>Nombre</td>
                </tr>
                <% for (Autor autor : autores) {%>
                <tr>
                    <td><%= autor.getId_autor()%></td>
                    <td><%= autor.getNombre()%></td>

                    <td><a class="btn btn-warning btn-block" href="formularioAutor.jsp?id=<%= autor.getId_autor()%>&nombre=<%= autor.getNombre()%>">Editar Autor</a></td>
                    <td><a class="btn btn-danger btn-block" href="confirmarEliminarAutor.jsp?id=<%=autor.getId_autor()%>&nombre=<%= autor.getNombre()%>">Eliminar Autor</a></td> 
                </tr>
                <% } %>
            </table>
        </div>
    </body>
</html>
