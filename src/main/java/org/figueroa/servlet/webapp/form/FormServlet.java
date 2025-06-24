package org.figueroa.servlet.webapp.form;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/registro")
public class FormServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)throws IOException, ServletException{
        resp.setContentType("text/html");
        String username=req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
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
            out.println("<h3>Nombre: "+username+"</h3>");
            out.println("</li>");
            out.println("<li>");
            out.println("<h3>Contraseña: "+password+"</h3>");
            out.println("</li>");
            out.println("<li>");
            out.println("<h3>Email: "+email+"</h3>");
            out.println("</li>");
            out.println("</ul>");
            out.println("</body>");
            out.println("</html>");
        }


    }



}
