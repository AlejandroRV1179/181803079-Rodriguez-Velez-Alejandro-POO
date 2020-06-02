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
    String sql = "Select * from usuarios";
    
    try {

        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection(URL, "root", "");
        stmt = conexion.createStatement();
        rs = stmt.executeQuery(sql);
        
        while(rs.next()){
            out.print(rs.getInt(1));//id_usuario
            out.print(rs.getString(2));//usuario
            out.println(rs.getString(3));//password
        }
    } catch (Exception e) {
        out.println("Error" + e);
    }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Java DB</title>
    </head>
    <body>
    </body>
</html>
