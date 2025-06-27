package org.figueroa.servlet.webapp.form;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

@WebServlet("/registro")
public class FormServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        resp.setContentType("text/html");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String pais = req.getParameter("pais");
        String[] lenguajes = req.getParameterValues("lenguajes");
        String[] roles = req.getParameterValues("roles");
        String idioma = req.getParameter("idioma");
        // String habilitar = req.getParameter("habilitar");
        boolean habilitar = req.getParameter("habilitar") != null && req.getParameter("habilitar").equals("on");
        String secreto = req.getParameter("secreto");


        Map<String, String> errores = new HashMap<>();

        if (username == null || username.isBlank()) {
            errores.put("username","El Username es requerido!");
        }
        if (password == null || password.isBlank()) {
            errores.put("password","El password es requerido!");
        }
        if (email == null || !email.contains("@")) {
            errores.put("email","El email es requerido!");
        }
        if (pais == null || pais.equals("") || pais.equals(" ")) {//equals es una forma de usar el isBlank
            errores.put("pais","El país es requerido!");
        }
        if (lenguajes == null || lenguajes.length == 0) {
            errores.put("lenguajes","El lenguje es requerido!");
        }
        if (roles == null || roles.length == 0) {
            errores.put("roles","El rol es requerido!");
        }

        if (idioma == null) { //idioma es solo compararlo a null perque es un radioButton
            System.out.println("El idioma es requerido");
        }
        if (errores.isEmpty()) {
            try (PrintWriter out = resp.getWriter()) {
                out.println("<!Doctype html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<meta charset = \"UTF-O\">");
                out.println("<title>Datos de Usuario</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Datos de Usuario</h1>");
                out.println("<ul>");
                out.println("<li>");
                out.println("<h3>Nombre: " + username + "</h3>");
                out.println("</li>");
                out.println("<li>");
                out.println("<h3>Contraseña: " + password + "</h3>");
                out.println("</li>");
                out.println("<li>");
                out.println("<h3>Email: " + email + "</h3>");
                out.println("</li>");
                out.println("<li>");
                out.println("<h3>País: " + pais + "</h3>");
                out.println("</li>");
                out.println("<li> Lenguajes: ");
                out.println("<ul>");
                Arrays.asList(lenguajes).forEach(lenguaje -> {
                    out.println("<li>" + lenguaje + "</li>");
                });
                out.println("</ul>");
                out.println("</li>");
                out.println("<li>Roles: ");
                out.println("<ul>");
                Arrays.asList(roles).forEach(rol -> {
                    out.println("<li>" + rol + "</li>");
                });
                out.println("</ul>");
                out.println("</li>");
                out.println("<li>");
                out.println("<h3>Idioma: " + idioma + "</h3>");
                out.println("</li>");
                out.println("<li>");
                out.println("<h3>Habilitar: " + habilitar + "</h3>");
                out.println("</li>");
                out.println("<li>");
                out.println("<h3>Secreto: " + secreto + "</h3>");
                out.println("</li>");
                out.println("</ul>");
                out.println("</body>");
                out.println("</html>");
        }
        } else {
              /*  errores.forEach(error ->{
                    out.println("<li>"+error+"</li>");
                });
                out.println("<p><a href=\"/webapp-form/index.jsp\">enviar</a></p>");
                */
            req.setAttribute("errores", errores); // se pasan los atributos a la vista jsp
            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
        }


    }


}
