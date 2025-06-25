<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.util.List" %>
<%
List<String> errores = (List<String>) request.getAttribute("errores");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Formularios de Usuarios</title>
</head>
<body>
<h1>Formulario de usuarios</h1>

<%
if(errores != null && errores.size()>0){

%>
<ul>
<%
for(String error : errores){
%>
<li><%=error%></li>
<%
}
%>
</ul>

<%
}
%>
<form action="registro" method="post">

    <div>
        <label for="username">Usuario</label>
        <div><input type="text" name="username" id="username"></div>
    </div>
    <div>
        <label for="password">Contraseña</label>
        <div><input type="password" name="password" id="password"></div>
    </div>
    <div>
        <label for="email">Mail</label>
        <div><input type="text" name="email" id="email" value="@gmail.com"></div>
    </div>
    <div>
        <label for="pais">País</label>
        <div>
            <select name="pais" id="pais">
                <option value="">-- Seleccionar</option>
                <option value="es">Español</option>
                <option value="mx">Mexico</option>
                <option value="ar">Argentina</option>
                <option value="cl">Chile</option>
                <option value="gt">Guatemala</option>
            </select>
        </div>
    </div>
    <div>
        <label for="lenguajes">Lenguaje de Programación</label>
        <div>
            <select name="lenguajes" id="lenguajes" multiple>
                <option value="JAVA">Java</option>
                <option value="CPlus">C#</option>
                <option value="JavaScript">JavaScript</option>
            </select>
        </div>
    </div>
    <div>
        <label>Rol</label>
        <div>
            <input type="checkbox" name="roles" value="ROL_admin">
            <label>Administrador</label>
        </div>
        <div>
            <input type="checkbox" name="roles" value="ROL_user">
            <label>Usuario</label>
        </div>
        <div>
            <input type="checkbox" name="roles" value="ROL_moderador">
            <label>Moderador</label>
        </div>
    </div>
    <div>
        <label>Idiomas</label>
        <div>
            <input type="radio" name="idioma" value="es">
            <label>Español</label>
        </div>
        <div>
            <input type="radio" name="idioma" value="en">
            <label>Ingles</label>
        </div>
        <div>
            <input type="radio" name="idioma" value="fr">
            <label>Frances</label>
        </div>
    </div>
    <div>
        <label for="habilitar">Habilitar</label>
        <div>
            <input type="checkbox" name="habilitar" id="habilitar" checked>
        </div>
    </div>
    <div>
        <div>
            <button type="submit" value="enviar">Enviar</button>
        </div>
    </div>
    <input type="hidden" name="secreto" value="12345">
</form>

</body>
</html>