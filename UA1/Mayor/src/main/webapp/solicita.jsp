<%-- 
    Document   : solicita
    Created on : 27/05/2020, 08:46:43 AM
    Author     : alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    int numero = Integer.parseInt(request.getParameter("numero"));
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mayor y menor</title>
    </head>
    <body>
        <h1>Ingrese un total de: <%out.println(numero);%> numeros</h1>
        <form>
            <%
                for (int i = 0; i < numero; i++) {
            %>
            <input type="number" name="<%out.print("vec" + i);%>" required/>
            <%
                }
            %>
            <input type="hidden" value="<%out.print(numero);%>" name="numero"\>
            <input type="submit" value="Envianding dato"\>
        </form>

        <h2>Los numeros son: </h2>
        <%
            int mayor = 0;
            int menor = 0;
            int num = 0;
            int j = 0;

            if (request.getParameter("vec" + j) != null) {
                //asignar el valor del primer numero como el menor
                menor = Integer.parseInt(request.getParameter("vec" + j));
                mayor = Integer.parseInt(request.getParameter("vec" + j));
            }
            for (int i = 0; i < numero; i++) {
                if (request.getParameter("vec" + i) != null) {
                    out.println(request.getParameter("vec" + i));
                    out.println("<br>");
                    num = Integer.parseInt(request.getParameter("vec" + i));

                    if (num > mayor) {
                        mayor = num;
                    }

                    if (num < menor) {
                        menor = num;
                    }
                }

            }
        %>
        <h2>El numero mayor es: <%out.print(mayor);%></h2>
        <h2>El numero menor es: <%out.print(menor);%></h2>

    </body>
</html>
