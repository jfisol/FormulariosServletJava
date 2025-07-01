<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.util.Map" %>
<%
Map<String,String> errores = (Map<String,String>) request.getAttribute("errores");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Formularios de Usuario</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
</head>
<body>
<div class="container"><h1>Formulario de usuarios</h1></div>

<%
if(errores != null && errores.size()>0){

%>
<ul class="alert alert-danger">
<%
for(String error : errores.values()){
%>
<li><%=error%></li>
<%
}
%>
</ul>

<%
}
%>
<div class="container px-5 mt-3">
<form action="registro" method="post">

    <div class="row mb-3">
        <label for="username" class="col-form-label col-sm-2">Usuario</label>
        <div class="col-sm-4"><input type="text" name="username" id="username" class="form-control" value="${param.username}"></div>
        <%
        if(errores != null && errores.containsKey("username")){
             out.println("<small class ='alert alert-danger col sm-4' style='color : red;'>"+errores.get("username")+"</small>");
        }
        %>
    </div>
    <div class="row mb-3">
        <label for="password" class="col-form-label col-sm-2">Contraseña</label>
        <div class="col-sm-4"><input type="password" name="password" id="password" class="form-control"></div>
    </div>
    <div class="row mb-3">
        <label for="email" class="col-form-label col-sm-2">Mail</label>
        <div class="col-sm-4"><input type="text" name="email" id="email" value="@gmail.com" class="form-control"></div>
    </div>
    <div class="row mb-3">
        <label for="pais" class="col-form-label col-sm-2">País</label>
        <div class="col-sm-4">
            <select name="pais" id="pais" class="form-select">
                <option value="">-- Seleccionar</option>
                <option value="es" ${param.pais.equals("es") ? "selected" : ""}>España</option>
                <option value="mx" ${param.pais.equals("mx") ?  "selected" : ""}>Mexico</option>
                <option value="ar" ${param.pais.equals("ar") ?  "selectes" : ""}>Argentina</option>
                <option value="cl" ${param.pais.equals("cl") ? "selected" : ""}>Chile</option>
                <option value="gt" ${param.pais.equals("gt") ? "selected" : ""}>Guatemala</option>
            </select>
        </div>
       <%
              if(errores != null && errores.containsKey("pais")){
                   out.println("<small class ='alert alert-danger col sm-4' style='color : red;'>"+errores.get("pais")+"</small>");
              }
              %>
    </div>

    <div class="row mb-3">
        <label for="lenguajes" class="col-form-label col-sm-2">Lenguaje de Programación</label>
        <div class="col-sm-4">
            <select name="lenguajes" id="lenguajes" multiple class="form-select">
                <option value="JAVA"  ${parameterValues.lenguajes.stream().anyMatches(v->v.equals("JAVA").get ? "selected"  : "")}>Java</option>
                <option value="CPlus" ${parameterValues.lenguajes.stream().anyMatches(v->v.equals("CPlus").get() ? "selected" : "")}>C#</option>
                <option value="JavaScript" ${parameterValues.lenguajes.stream().anyMatches(v->v.equals("JavaScrit").get() ? "selected" : "")}>JavaScript</option>
            </select>
        </div>
    </div>
    <div class="row mb-3">
        <label class="form-label col-sm-2">Rol</label>
        <div class="form-check col-sm-2">
            <input type="checkbox" name="roles" value="ROL_admin" class="form-check-input" ${parameterValues.ROL_admin.stream().anyMatches(v->v.equals("ROL_admin").get() ? "checked":"")}>
            <label class="form-check-label">Administrador</label>
        </div>
        <div class="form-check col-sm-2">
            <input type="checkbox" name="roles" value="ROL_user" class="form-check-input" ${parameterValues.ROL_user.stream().anyMatches(v->v.equals("ROL_user").get() ? "checked":"")}>
            <label class="form-check-label">Usuario</label>
        </div>
        <div class="form-check col-sm-2">
            <input type="checkbox" name="roles" value="ROL_moderador" class="form-check-input" ${parameterValues.ROL_moderador.stream().anyMatches(v->v.equals("ROL_moderador").geT() ? "checked":"")}>
            <label class="form-check-label">Moderador</label>
        </div>
    </div>
    <div class="row mb-3">
        <label class="form-check-label col-sm-2">Idiomas</label>
        <div class="form-check col-sm-2">
            <input type="radio" name="idioma" value="es" class="form-check-input" ${param.idioma.equals("es") ? "checked" : ""}>
            <label class="form-check-label">Español</label>
        </div>
        <div class="form-check col-sm-2">
            <input type="radio" name="idioma" value="en" class="form-check-input" ${param.idioma.equals("en") ? "checked" : ""}>
            <label class="form-check-label">Ingles</label>
        </div>
        <div class="form-check col-sm-2">
            <input type="radio" name="idioma" value="fr" class="form-check-input" ${param.idioma.equals("fr") ? "checked" : ""}>
            <label class="form-check-label">Frances</label>
        </div>
    </div>
    <div class="row mb-3">
        <div class="form-check col-sm-2">
         <input type="checkbox" name="habilitar" id="habilitar" checked class="form-check-input">
        <label for="habilitar" class="form-check-label col-form-label col-sm-2">Habilitar</label>
        </div>
    </div>
    <div>
        <div class="row mb-3">
            <button type="submit" value="enviar" class="btn btn-primary">Enviar</button>
        </div>
    </div>
    <input type="hidden" name="secreto" value="12345" class="">
</form>
</div>

</body>
</html>