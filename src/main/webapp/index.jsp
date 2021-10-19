<%@page import="com.emergentes.modelo.Libro"%>
<%@page import="com.emergentes.modelo.GestorLibros"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    if (session.getAttribute("agenda") == null) {
        GestorLibros objeto1 = new GestorLibros();

        objeto1.insertarLibro(new Libro(1, "Almas Grises", "Almas Grises", 
                "El gris es el tono dominante, pero no el gris de la muerte", "Magnetico"));
        objeto1.insertarLibro(new Libro(2, "Diarios", "Virginia Woolf", 
                "La luz de la escritora se vierte sobre los espacios, "
           + "su ingenio y clarividencia iluminan ya un suceso menor en el curso de la noche", "Fisico"));
        objeto1.insertarLibro(new Libro(3, "El Código Da Vinci", "Dan Brown", 
                "El Código Da Vinci ya se convertido en un clásico en todo el mundo.", "Fisico"));
        objeto1.insertarLibro(new Libro(4, "El Hobbit", "J.R.R. Tolkien", 
                "Así como esas crónicas tempranas narraban los mitos inmemoriales "
           + "de la Primera y Segunda Edad, Tolkien pronto advirtió que El Hobbit", "Fisico"));

        session.setAttribute("agenda", objeto1);
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./styles.css">
    </head>
    <body class="body_lista">
        <div id="contenedor">
            <h1>Lista de Libros</h1>
            <a href="Controller?op=nuevo" >Nuevo</a>
            <table border="1">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Titulo</th>
                        <th>Autor</th>
                        <th>Resumen</th>
                        <th>Medio</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <c:forEach var="item" items="${sessionScope.agenda.getLista()}" >
                    <tr>
                        <td>${item.id}</td>
                        <td>${item.titulo}</td>
                        <td>${item.autor}</td>
                        <td>${item.resumen}</td>
                        <td>${item.medio}</td>
                        <td> <a href="Controller?op=modificar&id=${item.id}" >Modificar</a> </td>
                        <td> <a href="Controller?op=eliminar&id=${item.id}" >Eliminar</a> </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
