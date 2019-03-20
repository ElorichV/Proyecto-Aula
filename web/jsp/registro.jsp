<%-- 
    Document   : altas
    Created on : 4/04/2016, 10:56:14 PM
    Author     : mario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Registro exitoso</h1>
        <%@page import="java.sql.*, java.io.*"%>
        <%
         
            String nombre = request.getParameter("nombre");
            String correo = request.getParameter("correo");
            String calle = request.getParameter("calle");
            String next = request.getParameter("next");
            String nint = request.getParameter("nint");
            String colonia = request.getParameter("colonia");
            String cp = request.getParameter("codigo postal");
            String estado = request.getParameter("estado");
            String del = request.getParameter("delegacion");
            String telefono = request.getParameter("telefono");
            String usuario = request.getParameter("usser");
            String contra = request.getParameter("contrasenia");
            
            int cue = 0;
            int tele = 0;
            
            ResultSet idcue =null;
            ResultSet tel=null;
            ResultSet corre=null;
            int usua = 0;
            int corres = 0;
            
            Connection con =null;
            Statement s = null;
            ResultSet r= null;
            try{
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBVangely","root","n0m3l0");
                s=con.createStatement();
                
                s.executeUpdate("INSERT INTO Usuario (nombre,tipo_us)Values ('"+nombre+"','2' );");
                r = s.executeQuery("SELECT * FROM Usuario WHERE nombre ='"+nombre+"';");
                if (r.next()){
                    usua=r.getInt("id_usuario");
                }
                s.executeUpdate("INSERT INTO Direccion (calle,n_exterior,n_interior,colonia,cp,delegacion,estado, id_usuario) Values ('"+calle+"','"+next+"','"+nint+"','"+colonia+"','"+cp+"','"+del+"','"+estado+"','"+usua+"');");
               // iddir = s.executeQueryELECT id_direccion FROM Direccion WHERE calle ='"+calle+"' AND n_exterior='"+next+"' AND n_interior='"+nint+"' AND colonia='"+colonia+"' AND cp='"+cp+"' AND delegacion='"+del+"' AND estado='"+estado+"');");
                
                s.executeUpdate("INSERT INTO Contacto (id_tipo,descripcion) Values (1,'"+correo+"');");
                s.executeUpdate("INSERT INTO Contacto (id_tipo,descripcion) Values (2,'"+telefono+"');");
                
                tel = s.executeQuery("SELECT * FROM Contacto WHERE descripcion ='"+telefono+"';");
                if (tel.next()){
                    tele=tel.getInt("id_contacto");
                }
                corre = s.executeQuery("SELECT * FROM Contacto WHERE descripcion ='"+correo+"';");
                if (corre.next()){
                    corres=corre.getInt("id_contacto");
                }
                //if(request.getParameter("ok")!=null){
                s.executeUpdate("INSERT INTO Cuenta (Usser,Pasword,id_usuario) Values ('"+usuario+"','"+contra+"','"+usua+"');");
                
                s.executeUpdate("INSERT INTO RelUsuarioCto (id_usuario,id_contacto) Values ('"+usua+"','"+tele+"');");
                s.executeUpdate("INSERT INTO RelUsuarioCto (id_usuario,id_contacto) Values ('"+usua+"','"+corres+"');");
                
                out.println("<script> alert('Registro dado de alta exitosamente') </script>");
              //  con.close();
                out.println("<META HTTPEQUIV='REFRESH' CONTENT='.0000001;URL=http://localhost:8080/ProyectoAula/'/>");
            //}
            }
            catch(SQLException error){
                out.println(error.toString());
            }
            catch(Exception e){
                out.println(e.getLocalizedMessage());
                e.printStackTrace();
            }
          //  con.close();
        %>
    </body>
</html>
