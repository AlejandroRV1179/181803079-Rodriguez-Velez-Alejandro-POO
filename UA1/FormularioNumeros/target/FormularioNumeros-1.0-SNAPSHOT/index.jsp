<%-- 
    Document   : Index
    Created on : 21/05/2020, 10:23:44 PM
    Author     : alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contador</title>
    </head>
    <body>
        <h1>Página Web para Contar</h1>
        <p>Por favor, en el siguiente recuadro ingrese un numero entero</p>

        <form method="GET">
            <input type="number" placeholder="Numero entero" name="num" pattern="^[0-999]+"/>
            <br>
            <input type="submit" value="Contar"/>
        </form>
        <h1>Contador: </h1>

        <%
            try {
                if (!request.getParameter("num").isEmpty()) {
                    int numero = Integer.parseInt(request.getParameter("num"));

                    for (int i = 0; i < numero; i++) {
                        out.print(i + "-");
                    }
                }
                
            } catch (NumberFormatException e) {
                e.toString();
                out.print("Se debe llenar el formulario");
                
            }
        %>    
    </body>
</html>
