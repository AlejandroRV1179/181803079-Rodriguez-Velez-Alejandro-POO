<%-- 
    Document   : formularioAutor
    Created on : 4/07/2020, 09:34:07 PM
    Author     : Alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String nombre = "";
    int id = 0;
    String titulo = "Agregar a un nuevo autor";
    String tituloBoton = "Agregar";
    String action = "agregarAutor.jsp";
    if (request.getParameter("id") != null) {
        id = Integer.parseInt(request.getParameter("id"));
        nombre = request.getParameter("nombre");
        titulo = "Editar Autor";
        tituloBoton = "Editar";
        action = "editarAutor.jsp";
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title></title>
    </head>
    <body>


        <h1><%=titulo%></h1>
        <div class="container">
            <form action=<%=action%> method="POST" class="form">
                <div class="form-row">
                    <div class="col">
                        <input class="form-control" type="text" name="nombre" id="nombre" value="<%=nombre%>" placeholder="Nombre" required />
                    </div>
                    <div class="col">
                        <input class="btn btn-block btn-success" type="submit" value=<%= tituloBoton%>  />
                    </div>
                    <% if (id != 0) {%>
                    <div class="col">
                        <input type="hidden" name="id_autor" value="<%=id%>"  />
                    </div> 
                    <% }%>
                </div>
            </form>
        </div>
    </body>
</html>
