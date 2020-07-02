<%-- 
    Document   : index
    Created on : 6/06/2020, 08:06:24 PM
    Author     : Alejandro Rodriguez Velez
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Avisos</title>
    </head>
    <body>
        <h1 align="center">Avisos</h1>
        <table align="center" border="1">
            <tr>
                <th>ID Aviso</th>
                <th>Encabezado</th>
                <th>Subtitulo</th>
                <th>Cuerpo</th>
                <th>Autor</th>
            </tr>
            <%
                Connection con = null;
                Statement stm = null;
                ResultSet rs = null;

                String BASE = "avisos";
                final String USER = "root";
                final String PASSWORD = "";
                final String URL = "jdbc:mysql://localhost/" + BASE + "?serverTimezone=UTC";
                final String sql = "SELECT id_aviso, encabezado, subtitulo, cuerpo, nombre FROM avisos JOIN autores ON avisos.id_autor=autores.id_autor";
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection(URL, USER, PASSWORD);
                    stm = con.createStatement();
                    rs = stm.executeQuery(sql);

                    while (rs.next()) {
            %>
            <tr>
                <th><%= rs.getInt(1)%></th>
                <th><%= rs.getString(2)%></th>
                <th><%= rs.getString(3)%></th>
                <th style="width:auto"><%= rs.getString(4)%></th>
                <th><%= rs.getString(5)%></th>
            </tr>

            <%

                    }
                    stm.close();
                    rs.close();
                    con.close();
                    stm = null;
                    rs = null;
                    con = null;

                } catch (Exception e) {

                }

            %>
        </table>


        <h1 align="center">Catálogo de Autores de Avisos</h1>
        <table align="center" border="1">
            <tr>
                <th>ID Autor</th>
                <th>Nombre</th>
            </tr>
            <%                
                final String sql2 = "SELECT * FROM autores";
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection(URL, USER, PASSWORD);
                    stm = con.createStatement();
                    rs = stm.executeQuery(sql2);

                    while (rs.next()) {
            %>
            <tr>
                <th><%= rs.getInt(1)%></th>
                <th><%= rs.getString(2)%></th>
            </tr>
            <%
                    }
                    stm.close();
                    rs.close();
                    con.close();
                } catch (Exception e) {
                }
            %>
        </table>
    </body>
</html>
