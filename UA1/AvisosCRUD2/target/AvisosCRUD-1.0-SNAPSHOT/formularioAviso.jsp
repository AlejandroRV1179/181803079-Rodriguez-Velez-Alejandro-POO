<%-- 
    Document   : formularioAviso
    Created on : 4/07/2020, 09:29:57 PM
    Author     : Alex
--%>

<%@page import="Dao.AutorBD"%>
<%@page import="java.util.List"%>
<%@page import="Dao.Autor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String encabezado = "";
    String subtitulo = "";
    String cuerpo = "";
    int id = 0;
    String titulo = "Agregar un nuevo    aviso";
    String tituloBoton = "Agregar";
    String action="agregarAviso.jsp";
    List<Autor> autores = new AutorBD().listarAutores();
    if (request.getParameter("id")!=null){
        id = Integer.parseInt(request.getParameter("id"));
        encabezado = request.getParameter("encabezado");
        subtitulo = request.getParameter("subtitulo");
        cuerpo = request.getParameter("cuerpo");
        titulo = "Editar Aviso";
        tituloBoton = "Editar";
        action="editarAviso.jsp";
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title>Formulario Aviso</title>
    </head>
    <body>
        <h1><%=titulo%></h1>
        <div class="container">
            <form action=<%=action%> method="POST" class="form">
                <div class="form-row">
                    <div class="col">
                        <input class="form-control" type="text" name="encabezado" id="encabezado" value="<%=encabezado%>" placeholder="Encabezado" required />
                    </div>
                    <div class="col">
                        <input class="form-control" type="text" name="subtitulo" id="subtitulo" placeholder="Subtitulo" value="<%=subtitulo%>" required/>
                    </div>
                    <div class="col">
                        <input class="form-control" type="text" name="cuerpo" id="cuerpo" placeholder="Cuerpo" value="<%=cuerpo%>" required/>
                    </div>
                    <% if(id == 0) { %>
                    <div class="col">
                        <select class="form-control" name="id_autor" id="id_autor">
                            <% for (Autor autor : autores){%>
                            <option class="form-control" value="<%= autor.getId_autor()%>">
                                <%= autor.getNombre()%>
                            </option>
                            <% } %>
                        </select>
                    </div>
                    <% } %>
                    <div class="col">
                        <input class="btn btn-block btn-success" type="submit" value=<%= tituloBoton%>  />
                    </div>
                    <% if(id != 0){ %>
                    <div class="col">
                        <input type="hidden" name="id_aviso" value="<%=id%>"  />
                    </div> 
                    <% } %>
                </div>
            </form>
        </div>
    </body>
</html>
