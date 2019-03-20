<%-- 
    Document   : Alta
    Created on : 16/04/2016, 01:08:41 PM
    Author     : johan
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/CSSgg1.css">
		<link href='https://fonts.googleapis.com/css?family=ABeeZee' rel='stylesheet' type='text/css'>
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import="java.sql.*,java.io.*"%>
        
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
        
        <form name='formal' action="proAlta.jsp" method="post">
        <div style="display: table; height:80%;width:100%;padding-top: 8%">
             <div style="display: table; height:20%;width:100%">
                 <font class="formulario">Agenda de Recursos</font>
                 &nbsp;&nbsp;&nbsp;
                <a href="proConsultas.html" class="boton">Proveedores</a>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <a href="Estadistica.html" class="boton">Recursos</a>
                  <br><br><br><br>
                  <hr color="#761a26" size="1"> 
             </div>
             <div style="display: table; height:20%;width:100%; padding-left: 4%">
                 <br>
                 <br>
                 <br>
              <a href="proConsultas.html" class="boton">Consulta</a>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <a href="proAlta.jsp" class="boton">Alta</a>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <a href="proCambio.jsp" class="boton">Modificar</a>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <br><br><br>
             </div>
            <div style="display: table; height: 500px; width: 1300px; padding-left: 4%;">
                <div style="display: table;width: 96.6%;height: 100%; padding-top: 1%">   
                <div style="float: left;width: 50%;height: 100%; visibility: visible;">
                    <font class="fo">Información de la empresa:</font>
                    <br>
                    &nbsp;
                    <input type="text" name="empresa" class="tex" size="20" placeholder="Empresa">
                    <br>
                    &nbsp;
                    <input type="text" name="Telefono" class="tex3" size="20" placeholder="Teléfono">
                    <br>
                    &nbsp;
                    <input type="text" name="correo" class="tex2" size="20" placeholder="Correo electrónico">
                    <br>
                    &nbsp;
                    <input type="text" name="rfc" class="tex3" size="20" placeholder="RFC">
                    <br>
                    <font class="fo2">Dirección: </font>
                    <br>
                    <br>
                    &nbsp;&nbsp;
                    <input type="text" name="calle" class="tex3" size="17" placeholder="Calle">
                    <br>
                    &nbsp;&nbsp;
                    <input type="text" name="exterior" class="tex3" size="9" placeholder="No.Exterior">
                    <br>
                    &nbsp;&nbsp;
                    <input type="text" name="interior" class="tex3" size="9" placeholder="No. Interior">
                    <br>
                    &nbsp;&nbsp;
                    <input type="text" name="colonia" class="tex3" size="17" placeholder="Colonia">
                    <br>
                    &nbsp;&nbsp;
                    <input type="text" name="CP" class="tex3" size="9" placeholder="C.P">
                    <br>
                    &nbsp;&nbsp;
                    <input type="text" name="delegacion" class="tex3" size="17" placeholder="Delegacion">
                    <br>
                    &nbsp;&nbsp;
                    <input type="text" name="estado" class="tex3" size="17" placeholder="Estado">                                       
                </div>
                <div style="float: left;left: 650px;width: 50%;height: 100%;position: absolute;">
                    <font class="fo">Información de los productos:</font>
                    <br>
                    &nbsp;
                    <input type="text" name="Producto" class="tex" size="20" placeholder="Producto">
                    <br>
                    &nbsp;
                    <input type="text" name="Precio" class="tex2" size="20" placeholder="Precio">
                    <br>
                    <br>
                    <br>
                    &nbsp;
                    <font style="padding-left: 0%" class="fo2">Ingrediente Especial: </font>
                    &nbsp;&nbsp;&nbsp;
                    <font class="fopeque">Si</font>
                    &nbsp;
                    <input type="radio" class="radio" name="Especiales" value="Si" checked="checked" />
                    &nbsp;&nbsp;&nbsp;
                    <font class="fopeque">No</font>
                    &nbsp;
                    <input type="radio" class="radio" name="Especiales" value="No"/>
                </div>
            </div>
            </div>
            <font style="padding-left: 85%"> </font>
            <input type="submit" class="submit" name="enviar" value="Guardar">
        </div>
        </form>
<%
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
            PreparedStatement pa = null;
            Connection con = null;
            Statement s = null;
            ResultSet r = null;
            ResultSet re = null;
            int d1=0;
            int d2=0;
            int d3=0;
            int d4=0;
            int d5=0;
            int d6=0;
            if(request.getParameter("enviar")!=null){
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
                        String querystring="INSERT INTO Tipo VALUES(?,?)";
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
                        re = s.executeQuery("SELECT * FROM Contacto WHERE descripcion_telefono='"+descripciontele+"' and id_tipo='"+d1+"' and descripcion_correo='"+descripcioncorr+"';");
                        if (re.next()){
                            d2=re.getInt("id_contacto");
                        }else{
                        try{
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/DBVangely","root","n0m3l0");
                        String querystring="INSERT INTO Contacto VALUES(?,?,?,?)";
                        pa=con.prepareStatement(querystring);
                        pa.setInt(1, d2); 
                        pa.setInt(2, d1);
                        pa.setString(3, descripciontele);
                        pa.setString(3, descripcioncorr);
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
                        String querystring="INSERT INTO Direccion VALUES(?,?,?,?,?,?,?,?)";
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
                        out.println("<script>alert('Entre');</script>");
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
                        String querystring="INSERT INTO Empresa VALUES(?,?,?,?)";
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
                        String querystring="INSERT INTO Ingredientes VALUES(?,?,?)";
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
                            out.println("<script>alert('Este proveedor ya ha sido registrado');</script>");
                        }else{
                        try{
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/DBVangely","root","n0m3l0");
                        String querystring="INSERT INTO Provedores VALUES(?,?,?,?,?)";
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
    </body>
</html>

