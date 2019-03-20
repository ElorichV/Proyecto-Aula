<%-- 
    Document   : Cambio
    Created on : 18/04/2016, 07:53:16 PM
    Author     : johan
--%>
<%@page import="java.sql.*,java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Vangely</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/CSSgg1.css">
        <link rel="stylesheet" href="css/CSSgg.css">
		<link href='https://fonts.googleapis.com/css?family=ABeeZee' rel='stylesheet' type='text/css'>
    </head>
    <body>
        <header>
            <nav>
                <ul>
                    <li><a href="#" class="dib"><img src="img/Logo.png" alt="logito" width="80" height="80"></a><li>
					<li> &emsp;&emsp;<li>
					<li class="l"><a href="ProductosA.jsp" class="hober"><b>Productos</b></a><li>
					<li> &emsp; &emsp;<li>
                    <li class="l"><a href="#" class="hober"><b>Promociones</b></a></li>
					<li> &emsp; &emsp;<li>
                    <li class="l"><a href="proConsultas.html" class="hober"><b>Agenda</b></a><li>
					<li> &emsp; &emsp; <li>                 
		    <li class="l"><a href="Pedido.html" class="hober"><b>Pedidos</b></a><li>
					<li> &emsp; &emsp; <li>
                    <li class="l"><a href="home.jsp" class="hober"><b>Vista</b></a></li>
                </ul>
            </nav>
        </header>
        <div style="display: table; height:80%;width:100%;padding-top: 8%">
            
             <div style="display: table; height:30%;width:100%">
                 <font class="formulario">Agenda de Recursos</font>
                 &nbsp;&nbsp;&nbsp;
                 <a href="index.html" class="boton">Proveedores</a>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <a href="Estadistica.html" class="boton">Recursos</a>
                  <br><br><br><br>
                  <hr color="#761a26" size="1"> 
                  
             </div>
            
             <div style="display: table; height:70%;width:100%; padding-left: 4%">
               
             <form action="proCambio.jsp" method="post">    
                 <br>
             <a href="proConsultas.html" class="boton">Consulta</a>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <a href="proAlta.jsp" class="boton">Alta</a>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="proCambio.jsp" class="boton">Modificar</a>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              
             <input type="text" class="tex" name="Proveedores" placeholder="Nombre de empresa">
             <input type="submit" class="buscar" name="Buscar" value=""  style="background-image:url('img/Buscar.png');">
             </form>
             <br><br><br>
<%
    String Comprobar=request.getParameter("Proveedores");
            PreparedStatement pa = null;
            Connection con = null;
            Statement s = null;
            ResultSet r = null;
            ResultSet re = null;
            String empre=request.getParameter("empresa");
            String tele=request.getParameter("Telefono");
            String corr=request.getParameter("correo");
            String rfc=request.getParameter("rfc");
            String call=request.getParameter("calle");
            String col=request.getParameter("colonia");
            String exte=request.getParameter("exterior");
            String inter=request.getParameter("interior");
            String cp=request.getParameter("CP");
            String dele=request.getParameter("delegacion");
            String est=request.getParameter("estado");
            String prod=request.getParameter("Producto");
            String pre=request.getParameter("Precio");
            String espec=request.getParameter("Especiales");
            String tipo=" ";
            String descripciontele=" ";
            String descripcioncorr=" ";
            if(corr!=null){
                tipo="Correo";
                descripciontele=corr;
            }
            if(tele!=null){
                tipo="Telefono";
                descripciontele=tele;
            }
            if(tele!=null && corr!=null){
                tipo="Tel-Correo";
                descripciontele=tele;
                descripciontele=corr;
            }
            String id="";
            String id2="";
            String id3="";
            String id4="";
            String id5="";
            String id6="";
            int d1=0;
            int d2=0;
            int d3=0;
            int d4=0;
            int d5=0;
            int d6=0;
            if(request.getParameter("Buscar")!=null){
                
                try{
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBVangely","root","n0m3l0");
                    s = con.createStatement();
                }catch(SQLException e){
                    out.println(e.toString());
                }
                try{
                    
                        re = s.executeQuery("SELECT * FROM Empresa WHERE nom_empresa='"+Comprobar+"';");
                        if (re.next()){
                        d4=re.getInt("id_empresa"); 
                        rfc=re.getString("rfc");
                        d3=re.getInt("id_direccion");                     
                        
                        con.close();             
                        
                        }else{
                        
                        }
                    }
                    catch(SQLException e){
                        out.println(e.toString());
                    }
//Fin de empresa, obtengo id_direccion e id empresa y rfc
                        try{
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBVangely","root","n0m3l0");
                    s = con.createStatement();
                }catch(SQLException e){
                    out.println(e.toString());
                }
                        re = s.executeQuery("SELECT * FROM Direccion WHERE id_direccion='"+d3+"';");
                        if (re.next()){
                            call=re.getString("calle");
                            inter=re.getString("n_interior");
                            exte=re.getString("n_exterior");
                            col=re.getString("colonia");
                            cp=re.getString("cp");
                            dele=re.getString("delegacion");
                            est=re.getString("estado");
                            con.close(); 
                            
                        }else{
                        
                    }
//Fin de Direccion, obtengo todos sus datos
                        try{
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBVangely","root","n0m3l0");
                    s = con.createStatement();
                }catch(SQLException e){
                    out.println(e.toString());
                }
                try{
                        re = s.executeQuery("SELECT * FROM Provedores WHERE id_empre='"+d4+"';");
                        if (re.next()){
                            d5=re.getInt("ingrediente");
                            pre=re.getString("precio");
                            d2=re.getInt("id_contacto");
                            con.close();
                            
                        }else{
                            
                        }
                }catch(SQLException e){
                    out.println(e.toString());
                }
//fin de proveedores, obtengo los ids        
                try{
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBVangely","root","n0m3l0");
                    s = con.createStatement();
                }catch(SQLException e){
                    out.println(e.toString());
                }
                try{
                        re = s.executeQuery("SELECT * FROM Contacto WHERE id_contacto='"+d2+"';");
                        if (re.next()){
                            descripciontele=re.getString("descripcion_telefono");
                            descripcioncorr=re.getString("descripcion_correo");
                            d2=re.getInt("id_contacto");
                            d1=re.getInt("id_tipo");
                            
                        }else{
                        }
                }catch(SQLException e){
                    out.println(e.toString());
                }
//Fin de Contacto obtengo sus datos
                try{
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBVangely","root","n0m3l0");
                    s = con.createStatement();
                }catch(SQLException e){
                    out.println(e.toString());
                }
                try{
                        re = s.executeQuery("SELECT * FROM Tipo WHERE id_tipo='"+d1+"';");
                        if (re.next()==true){
                           tipo=re.getString("Tipo");
                           
                        }else{
                            
                        }
                }catch(SQLException e){
                    out.println(e.toString());
                }
//Fin de Tipo, obtengo tipo
                try{
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBVangely","root","n0m3l0");
                    s = con.createStatement();
                }catch(SQLException e){
                    out.println(e.toString());
                }
                try{
                        re = s.executeQuery("SELECT * FROM Ingredientes WHERE id_ingre='"+d5+"';");
                        if (re.next()){
                            out.println("<script>alert('Proveedor encontrado');</script>");
                            prod=re.getString("ingrediente");
                            espec=re.getString("especial");
                            out.println("<form action='proCambio.jsp' method='post'>");
                            out.println("<font class='fo'>Información de la empresa:</font>");
                            out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                            out.println("<font class='fo' style='padding-left:23% '>Productos: </font>");
                            out.println("<br>&nbsp;");
                            out.println("<input type='text' name='empresa' class='tex' size='20' value='"+Comprobar+"'>");
                            out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                            out.println("<font class='fopeque' style='padding-left:2% '>Producto: </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font class='fopeque' style='padding-left:2% '>Precio: </font>");
                            out.println("<br>&nbsp;");
                            out.println("<input type='text' name='rfc' class='tex3' size='20' value='"+rfc+"'>");
                            out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                            out.println("<input type='text' name='Producto' value='"+prod+"' class='tex2' size='7' >");
                            out.println(" &nbsp;&nbsp;");
                            out.println("<input type='text' name='Precio' value='"+pre+"' class='tex2' size='4' >");
                            out.println("<br>&nbsp;");
                            out.println("<input type='text' name='Telefono' class='tex3' size='20' value='"+descripciontele+"'>");
                            out.println(" <font style='padding-left: 18.5%' class='fo2'>Ingrediente Especial: </font>");
                            out.println("&nbsp;&nbsp;&nbsp;");
                            out.println("&nbsp;<input type='text' class='tex2' name='Especiales' value='"+espec+"'/>");
                            out.println("<br>&nbsp;");
                            out.println("<input type='text' name='correo' class='tex2' size='20' value='"+descripcioncorr+"'>");
                            out.println("<br><br>");
                            out.println("<font class='fo'>Dirección: </font><br><br>&nbsp;&nbsp;");
                            out.println("<input type='text' name='calle' class='tex3' size='17' value='"+call+"'>");
                            out.println("<br>&nbsp;&nbsp;");
                            out.println(" <input type='text' name='exterior' class='tex3' size='9' value='"+exte+"'>");
                            out.println("<br>&nbsp;&nbsp;");
                            out.println("<input type='text' name='interior' class='tex3' size='9' value='"+inter+"'>");
                            out.println("<br>&nbsp;&nbsp;");
                            out.println(" <input type='text' name='colonia' class='tex3' size='17' value='"+col+"'>");
                            out.println(" <br>&nbsp;&nbsp;");
                            out.println("<input type='text' name='CP' class='tex3' size='9' value='"+cp+"'>");
                            out.println("<br>&nbsp;&nbsp;");
                            out.println("<input type='text' name='delegacion' class='tex3' size='17' value='"+dele+"'>");
                            out.println("<br>&nbsp;&nbsp;");
                            out.println("<input type='text' name='estado' class='tex3' size='17' value='"+est+"'> ");
                            out.println("<font style='padding-left: 1%'></font>");
                            out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                            out.println("<input type='submit' name='guardar' value='Guardar' class='submit'>");
                            out.println("</form>");
                          }else{
                        out.println("<script>alert('No existe el proveedor');</script>");
                        }
                }catch(SQLException e){
                    out.println(e.toString());
                }
//Fin de ingrediente, compruebo los datos y se mandan a relucir             
                
            }
            else if(request.getParameter("guardar")!=null){
               try{
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBVangely","root","n0m3l0");
                    s = con.createStatement();
                }catch(SQLException e){
                    out.println(e.toString());
                }
                try{
                    r = s.executeQuery("SELECT * FROM Tipo;");
                    if(r.next()==true){
                    while(r.next()){
                        
                        d1=d1+1;
                    }
                    }else{
                        
                        d1=1;
                    }
                        re = s.executeQuery("SELECT * FROM Tipo WHERE tipo='"+tipo+"';");
                        if (re.next()==true){                            
                            d1=re.getInt("id_tipo");
                        }else{
                            
                        try{
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/DBVangely","root","n0m3l0");
                        String querystring="UPDATE Tipo SET id_tipo=?, Tipo=? ;";
                        pa=con.prepareStatement(querystring);
                        pa.setInt(1, d1); 
                        pa.setString(2, tipo);
                        pa.executeUpdate();
                        con.close();             
                        out.println("<script>alert('Tipo guardado exitosamente');</script>");
                    }
                    catch(SQLException e){
                        out.println(e.toString());
                    }catch(Exception error){
                        out.println(error.getLocalizedMessage());
                        out.println("<script>alert(error.getLocalizedMessage());</script>");
                        error.printStackTrace();
                    }
                        }
                }catch(SQLException e){
                    out.println(e.toString());
                }
//Fin de registro Tipo 1
                try{
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBVangely","root","n0m3l0");
                    s = con.createStatement();
                }catch(SQLException e){
                    out.println(e.toString());
                }
                try{
                    r = s.executeQuery("SELECT * FROM Contacto");
                    if(r.next()==true){
                    while(r.next()){
                        d2=d2+1;
                    }
                    }else{
                        d2=1;
                    }
                        re = s.executeQuery("SELECT * FROM Contacto WHERE descripcion_telefono='"+descripciontele+"' and id_tipo='"+d1+"' and  descripcion_correo='"+descripcioncorr+"';");
                        if (re.next()){
                            d2=re.getInt("id_contacto");
                        }else{
                        try{
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/DBVangely","root","n0m3l0");
                        String querystring="UPDATE Contacto SET id_contacto=?, id_tipo=?, descripcion_telefono=?, descripcion_correo=?;";
                        pa=con.prepareStatement(querystring);
                        pa.setInt(1, d2); 
                        pa.setInt(2, d1);
                        pa.setString(3, descripciontele);
                        pa.setString(4, descripcioncorr);
                        pa.executeUpdate();
                        con.close();             
                        out.println("<script>alert('Contacto guardado exitosamente');</script>");
                    }
                    catch(SQLException e){
                        out.println(e.toString());
                    }catch(Exception error){
                        out.println(error.getLocalizedMessage());
                        out.println("<script>alert(error.getLocalizedMessage());</script>");
                        error.printStackTrace();
                    }
                        }
                }catch(SQLException e){
                    out.println(e.toString());
                }
//Fin de Contacto 2
                try{
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBVangely","root","n0m3l0");
                    s = con.createStatement();
                }catch(SQLException e){
                    out.println(e.toString());
                }
                try{
                    r = s.executeQuery("SELECT * FROM Direccion");
                    if(r.next()==true){
                    while(r.next()){
                        d3=d3+1;
                    }
                    }else{
                        d3=1;
                    }
                    
                        re = s.executeQuery("SELECT * FROM Direccion WHERE calle='"+call+"' and colonia='"+col+"' and cp='"+cp+"' and n_exterior='"+exte+"';");
                        if (re.next()){
                            d3=re.getInt("id_direccion");
                        }else{
                        try{
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/DBVangely","root","n0m3l0");
                        String querystring="UPDATE Direccion SET id_direccion=?, calle=?, n_exterior=?, n_interior=?, colonia=?, cp=?, delegacion=?, estado=?;";
                        pa=con.prepareStatement(querystring);
                        pa.setInt(1, d3); 
                        pa.setString(2, call);
                        pa.setString(3, exte);
                        pa.setString(4, inter);
                        pa.setString(5, col);
                        pa.setString(6, cp);
                        pa.setString(7, dele);
                        pa.setString(8, est);
                        pa.executeUpdate();
                        con.close();          
                        out.println("<script>alert('Direccion guardado exitosamente');</script>");
                    }
                    catch(SQLException e){
                        out.println(e.toString());
                    }catch(Exception error){
                        out.println(error.getLocalizedMessage());
                        out.println("<script>alert(error.getLocalizedMessage());</script>");
                        error.printStackTrace();
                    }
                        }
                }catch(SQLException e){
                    out.println(e.toString());
                }
//Fin de Direccion  3
                try{
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBVangely","root","n0m3l0");
                    s = con.createStatement();
                }catch(SQLException e){
                    out.println(e.toString());
                }
                try{
                    r = s.executeQuery("SELECT * FROM Empresa");
                    if(r.next()==true){
                    while(r.next()){
                        d4=d4+1;
                    }
                    }else{
                        d4=1;
                    }
                        re = s.executeQuery("SELECT * FROM Empresa WHERE nom_empresa='"+empre+"' and rfc='"+rfc+"';");
                        if (re.next()){
                            d4=re.getInt("id_empresa");
                        }else{
                        try{
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/DBVangely","root","n0m3l0");
                        String querystring="UPDATE Empresa SET id_empresa=?, nom_empresa=?, rfc=?, id_direccion=?;";
                        pa=con.prepareStatement(querystring);
                        pa.setInt(1, d4); 
                        pa.setString(2, empre);
                        pa.setString(3, rfc);
                        pa.setInt(4, d3); 
                        pa.executeUpdate();
                       out.println("<script>alert('Empresa guardado exitosamente');</script>");
                        con.close();             
                    }
                    catch(SQLException e){
                        out.println(e.toString());
                    }catch(Exception error){
                        out.println(error.getLocalizedMessage());
                        out.println("<script>alert(error.getLocalizedMessage());</script>");
                        error.printStackTrace();
                    }
                        }
                }catch(SQLException e){
                    out.println(e.toString());
                }
//Fin de empresa 4
                try{
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBVangely","root","n0m3l0");
                    s = con.createStatement();
                }catch(SQLException e){
                    out.println(e.toString());
                }
                try{
                    r = s.executeQuery("SELECT * FROM Ingredientes");
                    if(r.next()==true){
                    while(r.next()){
                        
                        d5=d5+1;
                    }
                    }else{
                        d5=1;
                    }
                        re = s.executeQuery("SELECT * FROM Ingredientes WHERE ingrediente='"+prod+"' and especial='"+espec+"';");
                        if (re.next()){
                            d5=re.getInt("id_ingre");
                        }else{
                        try{
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/DBVangely","root","n0m3l0");
                        String querystring="UPDATE Ingredientes SET id_ingre=?, ingrediente=?, especial=?;";
                        pa=con.prepareStatement(querystring);
                        pa.setInt(1, d5); 
                        pa.setString(2, prod);
                        pa.setString(3, espec);
                        pa.executeUpdate();
                        out.println("<script>alert('Ingrediente guardado exitosamente');</script>");
                        con.close();             
                    }
                    catch(SQLException e){
                        out.println(e.toString());
                    }catch(Exception error){
                        out.println(error.getLocalizedMessage());
                        out.println("<script>alert(error.getLocalizedMessage());</script>");
                        error.printStackTrace();
                    }
                        }
                }catch(SQLException e){
                    out.println(e.toString());
                }
//Fin de ingrediente 5             
                try{
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBVangely","root","n0m3l0");
                    s = con.createStatement();
                }catch(SQLException e){
                    out.println(e.toString());
                }
                try{
                    r = s.executeQuery("SELECT * FROM Provedores");
                    if(r.next()==true){
                    while(r.next()){
                        
                        d6=d6+1;
                    }
                    }else{
                        d6=1;
                    }
                        re = s.executeQuery("SELECT * FROM Provedores WHERE id_empre='"+d4+"' and id_contacto='"+d2+"' and ingrediente='"+d5+"';");
                        if (re.next()){
                            out.println("<script>alert('Los datos coinciden con los anteriores');</script>");
                        }else{
                        try{
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/DBVangely","root","n0m3l0");
                        String querystring="UPDATE Provedores SET codigo=?, ingrediente=?, precio=?, id_empre=?, id_contacto=?;";
                        pa=con.prepareStatement(querystring);
                        pa.setInt(1, d6); 
                        pa.setInt(2, d5);
                        pa.setString(3, pre);
                        pa.setInt(4, d4);
                        pa.setInt(5, d2);
                        pa.executeUpdate();
                        out.println("<script>alert('Proveedor guardado exitosamente');</script>");
                        con.close();             
                    }
                    catch(SQLException e){
                        out.println(e.toString());
                    }catch(Exception error){
                        out.println(error.getLocalizedMessage());
                        out.println("<script>alert(error.getLocalizedMessage());</script>");
                        error.printStackTrace();
                    }
                        }
                }catch(SQLException e){
                    out.println(e.toString());
                }
            }
%>                                                  
             </div>
        </div>
    </body>
</html>
