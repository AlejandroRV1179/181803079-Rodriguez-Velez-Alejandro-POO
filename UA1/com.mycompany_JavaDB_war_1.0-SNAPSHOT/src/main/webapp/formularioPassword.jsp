<%-- 
    Document   : formularioPassword
    Created on : 19/06/2020, 05:44:59 PM
    Author     : aleja
--%>
<%@page import="java.sql.*"%>
<%@page import="Dao.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title>Cambiar contraseña</title>
    </head>
    <body>
        <h1 align="center">Cambiar contraseña</h1><br><br>
        <div class="container">
            <form method="POST" class="form">
                <div class="form-row">
                    <div class="col">
                        <input class="form-control" type="password" name="actualPassword" autofocus id="oldPassword" placeholder="Contraseña Actual" required />
                    </div>  <br>
                    <div class="col">
                        <input class="form-control" type="password" name="contraNueva" id="contraNueva" placeholder="Contraseña Nueva" required/>
                    </div>  <br>
                    <div class="col">
                        <input class="form-control" type="password" name="contraNuevaDos" id="contraNuevaDos" placeholder="Repita Contraseña Nueva" required/>
                    </div>  <br> 
                    <div class="col">
                        <input class="btn btn-block btn-success" type="submit" value="Actualizar" />
                    </div>
                </div>
            </form>
        </div>
        
            <%
            int idUsuario = Integer.parseInt(request.getParameter("userID"));
            String actualPassword = request.getParameter("actualPassword");
            String contraNueva = request.getParameter("contraNueva");
            String contraNuevaDos = request.getParameter("contraNuevaDos");
            UsuarioDB usuario = new UsuarioDB();
            
            boolean actualesCoinciden = usuario.compareActualPasswords(new Usuario(actualPassword, idUsuario));
            boolean nuevasIguales = false;
            
            if(contraNueva !=null && contraNuevaDos !=null && usuario.comparaNueva(contraNueva, contraNuevaDos)){
                nuevasIguales = true;
            }
            
            if (contraNueva != null && contraNuevaDos != null && actualPassword != null){
                if(actualesCoinciden && nuevasIguales){
                    boolean actualizado = usuario.actualizarContra(new Usuario(contraNueva, idUsuario));
                    if(actualizado){
                        %> <br> <h2 align="center">La contraseña ha sido modificada satisfactoriamente</h2> <br><%
                    }else{
                        %> <br> <h2 align="center">Ha sucedido un error</h2> <br> <%
                    }
                }else if (!actualesCoinciden){
                %>  <br> <h2 align="center">Su contraseña actual no coincide con la ingresada</h2> <br>  <%
                }else if(!nuevasIguales){
                %>  <br> <h2 align="center">Las nuevas contraseñas no son iguales</h2> <br>  <%
                }
            }
            %>
            <br>
            <div class="container" my-3>
            <table class="table table-dark" align="center">
                <tr>
                    <td colspan="2"><a class="btn btn-success btn-block" href="index.jsp">Ir al Inicio</td>
                    <!--<td colspan="2"><a class="btn btn-success btn-block" href="formularioUsuario.jsp">Ir al Formulario</a></td>
             --></tr>
            </table>
        </div>   
    </body>
</html>
