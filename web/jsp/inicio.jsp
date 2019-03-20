<%-- 
    Document   : inicio
    Created on : 16/04/2016, 02:28:47 PM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import="java.sql.*, java.io.*"%>
        <%
            Connection c = null;
            try {
                String contra = request.getParameter("contrasenia");
                String correo = request.getParameter("correo");
                Class.forName("com.mysql.jdbc.Driver");
                c = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBVangely", "root", "n0m3l0");
                Statement s = c.createStatement();
                String sql = "select id_usuario, tipo_us from usuario "
                        + "where id_usuario in "
                        + "(select id_usuario from "
                        + "cuenta where Usser='" + correo + "' "
                        + "and Pasword='" + contra + "')";
                ResultSet rs = s.executeQuery(sql);
                String usuario = "";
                String tipo = "";
                if (rs.next()) {
                    usuario = rs.getString("id_usuario");
                    tipo = rs.getString("tipo_us");
                    HttpSession actual = request.getSession(true);
                    actual.setAttribute("logueado", tipo);
                    try {
                        if ( tipo == "1" ) {
                            response.sendRedirect("../ProductosA.jsp");
                        } else  {
                            response.sendRedirect("../bienvenido.jsp");
                        }
                    } catch (Exception e) {
                        out.print(e.getLocalizedMessage());
                        e.printStackTrace();
                    }
                }
                else
                {
                    out.println("<script>alert('Porfavor revisa tus datos')</script>");
                    response.sendRedirect("../inicio.jsp");
                }
                }
                catch(SQLException error )
            {
                out.print(error.toString());
            }
                catch (Exception e )
            {
                out.print(e.getLocalizedMessage());
                e.printStackTrace();
            }
        %>
    </body>
</html>
