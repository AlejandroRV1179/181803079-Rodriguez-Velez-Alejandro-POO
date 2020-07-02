<%-- 
    Document   : index
    Created on : 29/05/2020, 09:04:41 AM
    Author     : alex
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Connection conexion = null;
    Statement stmt = null;
    ResultSet rs = null;
    String BASE = "usuarios";
    String URL = "jdbc:mysql://localhost:3306/" + BASE + "?serverTimezone=UTC";
    String sql = "SELECT * from usuarios";
    
    try {

        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection(URL, "root", "");
        stmt = conexion.createStatement();
        rs = stmt.executeQuery(sql);
        
        while(rs.next()){
            out.print(rs.getInt(1));//id_usuario
            out.print(rs.getString(2));//usuario
            out.println(rs.getString(3));//password%> <br> <%
        }
    } catch(SQLException e){
        %> <b> <%out.println("Error SQL: ");%> </b> <%
        //42000 Base de datos   1049
        if(e.getSQLState().equals("42000") && e.getErrorCode()==1049){
            out.print("La base de datos " + BASE + " no existe");%> <br> <%
        }
        //42S02 Tabla       1146
        if(e.getSQLState().equals("42S02")){
            out.print("La tabla no existe");%> <br> <%
        }
        //42000 SQL sintax  1064
        if(e.getSQLState().equals("42000") && e.getErrorCode()==1064){
            out.println("Existe un error de sintaxis SQL");%> <br> <%
        }
        //08001 URL     0
        if(e.getSQLState().equals("08001")){
            out.print("Error en el conector JDBC de la URL"); %> <br> <%
        }
        //28000 Usuario o contraseña     1045 
        if(e.getSQLState().equals("28000")){
            out.println("El usuario o contraseña para acceder a la base de datos es incorrecta"); %> <br> <%
        }
        //S1009 Campo inexistente en rs 0
        //42S22 Campo inexistente en la sentencia sql
        //08S01 Puerto incorrecto 0
        if(e.getSQLState().equals("08S01")){
            out.println("El puerto o la IP de la URL es incorrecta"); %> <br> <%
        }
        
        %> <br> <%
        //out.print(e.getSQLState()); %> <br> <%
        //out.println(e.getErrorCode());  %> <br> <%
        
    }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Java DB</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    </head>
    <body>
    </body>
</html>
