<%-- 
    Document   : formularioUsuario
    Created on : 12/06/2020, 08:48:40 AM
    Author     : aleja
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String nombre = "";
    int edad = 0;
    int id = 0;
    String titulo = "Agregar a un nuevo usuario";
    String tituloBoton = "Agregar";
    String hidden="";
    String required="required";
    String action="agregarUsuario.jsp";
    if (request.getParameter("id")!=null){
        id = Integer.parseInt(request.getParameter("id"));
        nombre = request.getParameter("nombre");
        titulo = "Editar usuario";
        tituloBoton = "Editar";
        hidden="hidden";
        action="editarUsuario.jsp";
        required="";
        edad = Integer.parseInt(request.getParameter("edad"));
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title>Formulario Usuario</title>
    </head>
    <body>
        <h1><%=titulo%></h1>
        <div class="container">
            <form action=<%=action%> method="POST" class="form">
                <div class="form-row">
                    <div class="col">
                        <input class="form-control" type="text" name="usuario" id="usuario" value="<%=nombre%>" placeholder="Usuario" required />
                    </div>
                    <% if(id == 0){ %>
                    <div class="col">
                        <input class="form-control" type="password" name="password" id="password" placeholder="Contraseña" <%=required%>/>
                    </div>
                    <% } %>
                    <div class="col">
                        <input class="form-control" type="number" name="edad" id="edad" placeholder="Edad" min="1" max="120" value="<%=edad%>" <%=required%>/>
                    </div>
                    <div class="col">
                        <input class="btn btn-block btn-success" type="submit" value=<%= tituloBoton%>  />
                    </div>
                    <% if(id != 0){ %>
                    <div class="col">
                        <input type="hidden" name="id_usuario" value="<%=id%>"  />
                    </div> 
                    <% } %>
                </div>
            </form>
        </div>
    </body>
</html>
