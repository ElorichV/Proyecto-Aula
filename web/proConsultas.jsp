<%-- 
    Document   : Consultas
    Created on : 19/04/2016, 06:52:16 PM
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
		<link href='https://fonts.googleapis.com/css?family=ABeeZee' rel='stylesheet' type='text/css'>
    </head>
    <body>
        <header>
            <nav>
                <ul>
                    <li><a href="#" class="dib"><img src="img/Logo.png" alt="logito" width="80" height="80"></a><li>
					<li> &emsp;&emsp;<li>
					<li class="l"><a href="ProductosA.html" class="hober"><b>Productos</b></a><li>
					<li> &emsp; &emsp;<li>
                    <li class="l"><a href="#" class="hober"><b>Promociones</b></a></li>
					<li> &emsp; &emsp;<li>
                    <li class="l"><a href="proConsultas.jsp" class="hober"><b>Agenda</b></a><li>
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
                 <a href="proConsultas.jsp" class="boton">Proveedores</a>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <a href="Estadistica.html" class="boton">Recursos</a>
                  <br><br><br><br>
                  <hr color="#761a26" size="1"> 
             </div>
             <div style="display: table; height:70%;width:100%; padding-left: 4%">
                 <br><br>
             <a href="proConsultas.html" class="boton">Consulta</a>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <a href="proAlta.jsp" class="boton">Alta</a>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="proCambio.jsp" class="boton">Modificar</a>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <input type="text" class="tex" name="Proveedores" placeholder="Proveedores">
             <input type="submit" class="buscar" name="Buscar" value=""  style="background-image:url('img/Buscar.png');">
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
                            out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font class='fo' style='padding-left:4% '>Empresa: </font>&nbsp;&nbsp;<input type='text' name='empresa' class='result' value='"+Comprobar+"' size='13'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                            out.println("<font class='fo' style='padding-left:14% '>Productos: </font> <br>");
                            out.println("<font class='fo' style='padding-left:6%'>RFC: </font>&nbsp;&nbsp;<input type='text' name='rfc' value='"+rfc+"' class='result' size='13'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                            out.println("<font class='fopeque' style='padding-left:4% '>Producto: </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font class='fopeque' style='padding-left:4% '>Precio: </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font class='fopeque' style='padding-left:2% '>Especial: </font>");
                            out.println("<br><font class='fo' style='padding-left:6%'>Correo electrónico: </font>&nbsp;&nbsp;<input type='text' name='correo' value='"+descripcioncorr+"' class='result' size='13'><br>");
                            out.println("<font class='fo' style='padding-left:6% '>Teléfono: </font>&nbsp;&nbsp;<input type='text' name='Telefono' value='"+descripciontele+"' class='result' size='13'> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                            out.println("<input type='text' name='Producto' value='"+prod+"' class='result' size='11'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='text' name='Precio' value='"+pre+"' class='result' size='4'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='text' name='Especiales' value='"+espec+"' class='result' size='4'><br>");
                            out.println("<font class='fo' style='padding-left:6% '>Dirección: </font><br>");
                            out.println("<font class='fo2' style='padding-left:10%'>Calle: </font>&nbsp;&nbsp;<input type='text' name='calle'value='"+call+"' class='result' size='13'><br>");
                            out.println("<font class='fo2' style='padding-left:10% '>Colonia: </font>&nbsp;&nbsp;<input type='text' name='colonia' value='"+col+"' class='result' size='13'><br>");
                            out.println("<font class='fo2' style='padding-left:10% '>No Exterior: </font>&nbsp;&nbsp;<input type='text' name='exterior' value='"+exte+"' class='result' size='13'><br>");
                            out.println("<font class='fo2' style='padding-left:10% '>No Interior: </font>&nbsp;&nbsp;<input type='text' name='interior' value='"+inter+"' class='result' size='13'><br>");
                            out.println("<font class='fo2' style='padding-left:10% '>C.P: </font>&nbsp;&nbsp;<input type='text' name='CP' value='"+cp+"' class='result' size='13'><br>");
                            out.println("<font class='fo2' style='padding-left:10% '>Delegacion: </font>&nbsp;&nbsp;<input type='text' name='delegacion' value='"+dele+"' class='result' size='13'><br>");
                            out.println("<font class='fo2' style='padding-left:10% '>Estado: </font>&nbsp;&nbsp;<input type='text' name='estado' value='"+est+"' class='result' size='13'>");
                            
                          }else{
                        out.println("<script>alert('No existe el proveedor');</script>");
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