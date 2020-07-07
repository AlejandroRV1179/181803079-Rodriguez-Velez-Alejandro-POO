<%-- 
    Document   : agregarAutor
    Created on : 4/07/2020, 11:30:56 PM
    Author     : Alex
--%>
<%@page import="Dao.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    AutorBD autor = new AutorBD();
    boolean agregado; 
    agregado = autor.agregarAutor(new Autor(request.getParameter("nombre")));
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title>Agregar Autor</title>
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
                    <td colspan="2"><a class="btn btn-success btn-block" href="formularioAutor.jsp">Ir al formulario</a></td>
                </tr>
            </table>
        </div>   
    </body>
</html>
