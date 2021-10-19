

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./styles.css">
    </head>
    <body>
        <h1>
            <c:if test="${requestScope.op == 'nuevo'}" var="res" scope="request" >
                Registro de
            </c:if>
            <c:if test="${requestScope.op == 'modificar'}" var="res" scope="request" >
                Modificar
            </c:if>
            Libros
        </h1>
        <jsp:useBean id="misLibros" scope="request" class="com.emergentes.modelo.Libro" />
        <form action="Controller" method="post" >
            <table >
                <tr>
                    <td><input type="hidden" name="id" value="<jsp:getProperty name="misLibros" property="id" />" />
                    </td>
                </tr>

                <tr>
                    <td>Titulo</td>
                    <td><input type="text" name="titulo" value="<jsp:getProperty name="misLibros" property="titulo" />" />
                    </td>
                </tr>

                <tr>
                    <td>Autor</td>
                    <td><input type="text" name="autor" value="<jsp:getProperty name="misLibros" property="autor" />" />
                    </td>
                </tr>

                <tr>
                    <td>Resumen</td>
                    <td><textarea name="resumen" rows="6" cols="45px" placeholder=
                                   ><jsp:getProperty name="misLibros" property="resumen" /></textarea>
                    </td>
                    
                </tr>

                <tr>
                    <td>Medio</td>
                    <td>
                        <input type="radio" name="medio" value="Fisico" id="Fisico" <c:if test="${misLibros.medio == 'Fisico'}" var="res" scope="request">checked="checked"</c:if> >Fisico

                            <input type="radio" name="medio" value="Magnetico" id="Magnetico" <c:if test="${misLibros.medio == 'Magnetico'}" var="res" scope="request">checked="checked"</c:if> >Magnetico
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <input type="hidden" name="opg" value="${requestScope.op}"/>
                        <input type="hidden" name="op" value="grabar"/>
                    </td>
                    <td><input type="submit" value="Enviar" /></td>
                </tr>
            </table>
        </form>


    </body>
</html>
