<%-- 
    Document   : Productos
    Created on : 17/04/2016, 03:38:05 PM
    Author     : johan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSSgg1.css">
		<link href='https://fonts.googleapis.com/css?family=ABeeZee' rel='stylesheet' type='text/css'>
        <title>Productos</title>
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
                    <li class="l"><a href="proConsultas.htlm" class="hober"><b>Agenda</b></a><li>
					<li> &emsp; &emsp; <li>                 
		    <li class="l"><a href="Pedido.html" class="hober"><b>Pedidos</b></a><li>
					<li> &emsp; &emsp; <li>
                    <li class="l"><a href="home.jsp" class="hober"><b>Vista</b></a></li>
                </ul>
            </nav>
        </header>
        
        <div style="display: table; height:80%;width:100%;padding-top: 8%">
        <form action="ProductosCambios.jsp" method="post">    
             <div style="display: table; height:30%;width:100%">
                 <font class="formulario">Productos</font>
                 &nbsp;&nbsp;&nbsp;
                 <input type="text" class="tex" name="Productos" size="7">
                  <input type="submit" class="buscar" name="Buscar" value=""  style="background-image:url('img/Buscar.png');">
                  <br><br><br>
                  <hr color="#761a26" size="1"> 
                  
             </div>
        </form>    
        <form action="ProductosA.jsp" method="post">    
             <div style="display: table; height:70%;width:100%; padding-left: 3%;padding-top: 1%">
                 <font class="fo">Información del producto</font>
                 <br>&nbsp;
                 <input type="text" class="tex" name="Nombre" placeholder="Nombre" size="19">
                 <font class="fo2" style="padding-left: 25%">Detalles:</font>
                 <br>
                 &nbsp;&nbsp;
                 <font class="select">     
                 <select class="estilo" name="Sabor">
                        <option>Sabor</option>
                        <option value="Durazno">Durazno</option>
                        <option value="Chocolate">Chocolate</option>
                        <option value="Vainilla">Vainilla</option>
                        <option value="Fresa">Fresa</option>
                        <option value="Capuchino">Capuchino</option>
                        <option value="Frambuesa">Frambuesa</option>
                    </select>
                </font>
                <font style="padding-left: 24.5%"></font>
                <input type="text" class="tex3" name="Forma" placeholder="Forma"><br>&nbsp;
                <input type="text" class="tex3" name="precio" placeholder="Precio" size="19"> 
                 <font style="padding-left: 24.2%"></font>
                <input type="text" class="tex3" name="Ingredientes" placeholder="Ingredientes"><br>&nbsp;
                <input type="text" class="tex2" name="porcion" placeholder="Porcion" size="19"> 
                <font style="padding-left: 24.2%" class="fo2">Ingrediente Especial: </font>&nbsp;&nbsp;&nbsp;
                <font class="fopeque">Si</font>&nbsp;
                <input type="radio" class="radio" name="Especiales" value="Si" checked="checked" />&nbsp;&nbsp;&nbsp;
                <font class="fopeque">No</font> &nbsp;
                <input type="radio" class="radio" name="Especiales" value="No"/>
                <br><font style="padding-left: 25%"></font>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="submit" name="guardar" value="Guardar" class="submit">
             
             </div>
            </form>
        </div>
        
        <%
            String nom=request.getParameter("Nombre");
            String sab=request.getParameter("Sabor");
            String fro=request.getParameter("Forma");
            String pre=request.getParameter("precio");
            String ingre=request.getParameter("Ingredientes");
            String por=request.getParameter("porcion");
            String es=request.getParameter("Especiales");
            PreparedStatement pa = null;
            Connection con = null;
            Statement s = null;
            ResultSet r = null;
            ResultSet re = null;
            int u=0;
            int y=0;
            if(request.getParameter("guardar")!=null){
                try{
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBVangely","root","n0m3l0");
                    s = con.createStatement();
                }catch(SQLException e){
                    out.println(e.toString());
                }
                try{
                        re = s.executeQuery("SELECT * FROM Ingredientes WHERE ingrediente='"+ingre+"';");
                        if (re.next()){
                            u=re.getInt("id_ingre");
                        }else{
                        try{
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/DBVangely","root","n0m3l0");
                        String querystring="INSERT INTO Ingredientes(ingrediente, especial) VALUES(?,?)";
                        pa=con.prepareStatement(querystring);
                        pa.setString(1, ingre);
                        pa.setString(2, es);
                        pa.executeUpdate();
                        con.close();             
                        out.println("<script>alert('Ingrediente registrado');</script>");
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
//Fin de registro Ingrediente
                try{
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBVangely","root","n0m3l0");
                    s = con.createStatement();
                }catch(SQLException e){
                    out.println(e.toString());
                }
                try{
                    if(u==0){
                    r = s.executeQuery("SELECT * FROM Ingredientes WHERE ingrediente='"+ingre+"';");    
                    while(r.next()){
                     u=r.getInt("id_ingre");
                    }
                    }
                        re = s.executeQuery("SELECT * FROM Detalles WHERE sabor='"+sab+"' and ingred_esp='"+u+"';");
                        if (re.next()==true){
                            y=re.getInt("id_detalles");
                        }else{
                        try{
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/DBVangely","root","n0m3l0");
                        String querystring="INSERT INTO Detalles(sabor, forma, tamanio, ingred_esp) VALUES(?,?,?,?)";
                        pa=con.prepareStatement(querystring);
                        pa.setString(1, sab);
                        pa.setString(2, fro);
                        pa.setString(3, por);
                        pa.setInt(4, u);
                        pa.executeUpdate();
                        out.println("<script>alert('Detalles registrado');</script>");
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
//Fin de Detalles
                try{
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBVangely","root","n0m3l0");
                    s = con.createStatement();
                }catch(SQLException e){
                    out.println(e.toString());
                }
                try{
                    if(y==0){
                    r = s.executeQuery("SELECT * FROM Detalles WHERE sabor='"+sab+"' and ingred_esp='"+u+"';");
                    if(r.next())
                    y=r.getInt("id_detalles");
                    }
                        re = s.executeQuery("SELECT * FROM Producto WHERE nomb_prod='"+nom+"' and precio='"+pre+"';");
                        if (re.next()){
                            out.println("<script>alert('Este producto ya esta registrado');</script>");
                        }else{
                        try{
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/DBVangely","root","n0m3l0");
                        String querystring="INSERT INTO Producto(nomb_prod,precio,id_detalles) VALUES(?,?,?)";
                        pa=con.prepareStatement(querystring); 
                        pa.setString(1, nom);
                        pa.setString(2, pre);
                        pa.setInt(3, y);
                        pa.executeUpdate();
                        out.println("<script>alert('Producto guardada exitosamente');</script>");
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
