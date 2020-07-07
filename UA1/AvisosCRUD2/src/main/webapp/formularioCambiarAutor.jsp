<%-- 
    Document   : formularioCambiarAutor
    Created on : 4/07/2020, 09:30:48 PM
    Author     : Alex
--%>

<%@page import="Dao.AutorBD"%>
<%@page import="Dao.Autor"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String nombre = request.getParameter("nombre");
    int id_aviso = Integer.parseInt(request.getParameter("id_aviso"));
    List<Autor> autores = new AutorBD().listarCambiarAutor(new Autor(nombre));
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title>Cambiar Autor del Aviso</title>
    </head>
    <body>
        <div class="container">
            <form action="editarAutorAviso.jsp" method="POST" class="form">
                <div class="form-row">
                    <div class="col">
                        <input class="form-control" type="text" value=<%=nombre%> readonly />
                    </div>
                    <div class="col">
                        <select class="form-control" name="id_autor" id="id_autor">
                            <% for (Autor autor : autores){%>
                            <option class="form-control" value="<%= autor.getId_autor()%>">
                                <%= autor.getNombre()%>
                            </option>
                            <% } %>
                        </select>
                    </div>
                    <div class="col">
                        <input class="btn btn-block btn-success" type="submit" value="Cambiar Autor" />
                    </div>
                        <div class="col">
                        <input type="hidden" name="id_aviso" value="<%=id_aviso%>"  />
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
