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
					<li class="l"><a href="Productos.jsp" class="hober"><b>Productos</b></a><li>
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
        <form action="ProductosCambios.jsp" method="post">
        <div style="display: table; height:80%;width:100%;padding-top: 8%">
            
             <div style="display: table; height:30%;width:100%">
                 <font class="formulario">Productos</font>
                 &nbsp;&nbsp;&nbsp;
                 <input type="text" class="tex" name="Productos" size="7">
                  <input type="submit" class="buscar" name="Buscar" value=""  style="background-image:url('img/Buscar.png');">
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <br><br><br>
                  <hr color="#761a26" size="1"> 
             </div>
             <div style="display: table; height:70%;width:100%; padding-left: 3%;padding-top: 1%">
                  <%
            String nom=request.getParameter("Productos");
            String prod=request.getParameter("Nombre");
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
            int x=0;
            if(request.getParameter("guardar")!=null){
             try{
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBVangely","root","n0m3l0");
                    s = con.createStatement();
                }catch(SQLException e){
                    out.println(e.toString());
                }
                try{
                        re = s.executeQuery("SELECT * FROM Producto WHERE nomb_prod='"+nom+"';");
                        if (re.next()){
                            try{
                        
                        x=re.getInt("id"); 
                        pre=re.getString("precio");
                        y=re.getInt("id_detalles");
                        pa.executeUpdate();
                        out.println("<script>alert('Direccion guardada exitosamente');</script>");
                        con.close();             
                    }
                    catch(SQLException e){
                        out.println(e.toString());
                    }catch(Exception error){
                        out.println(error.getLocalizedMessage());
                        out.println("<script>alert(error.getLocalizedMessage());</script>");
                        error.printStackTrace();
                    }
                        }else{
                        
                        }
                }catch(SQLException e){
                    out.println(e.toString());
                }
//Fin de productos
                try{
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBVangely","root","n0m3l0");
                    s = con.createStatement();
                }catch(SQLException e){
                    out.println(e.toString());
                }
                try{
                        re = s.executeQuery("SELECT * FROM Detalles WHERE id_detalles='"+y+"';");
                        if (re.next()){
                            u=re.getInt("ingred_esp");
                            sab=re.getString("sabor");
                            fro=re.getString("forma");
                            por=re.getString("tamanio");
                        }else{

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
                        re = s.executeQuery("SELECT * FROM Ingredientes WHERE  id_ingre='"+u+"';");
                        if (re.next()==true){
                            out.println("<script>alert('Producto Encontrado');</script>");
                            ingre=re.getString("ingrediente");
                            es=re.getString("especial");
                            out.println("<form action='ProductosCambios.jsp' method='post'>");
                            out.println("<font class='fo'>Información del producto</font>");
                            out.println("<br>&nbsp;");
                            out.println("<input type='text' class='tex' name='Nombre' value='"+nom+"' size='19'>");
                            out.println("<font class='fo2' style='padding-left: 25%'>Detalles:</font><br>&nbsp;&nbsp;");
                            out.println("<font class='select'>"
                                    + "<select class='estilo' name='Sabor'>");
                            out.println("<option>Sabor</option>");
                            out.println("<option value='Durazno'>Durazno</option>"
                                    + "<option value='Chocolate'>Chocolate</option>"
                                    + "<option value='Vainilla'>Vainilla</option>"
                                    + "<option value='Fresa'>Fresa</option>"
                                    + "<option value='Capuchino'>Capuchino</option>"
                                    + "<option value='Frambuesa'>Frambuesa</option></select>");
                            out.println("</font>");
                            out.println("<font style='padding-left: 24.5%'></font>");
                            out.println("<input type='text' class='tex3' value='"+fro+"' name='Forma'><br>&nbsp;");
                            out.println("<input type='text' class='tex3' value='"+pre+"' name='precio' size='19'> ");
                            out.println("<font style='padding-left: 24.2%'></font>");
                            out.println("<input type='text' class='tex3' name='Ingredientes' value='"+ingre+"'><br>&nbsp;");
                            out.println("<input type='text' class='tex2' name='porcion' value='"+por+"' placeholder='Porcion' size='19'>");
                            out.println("<font style='padding-left: 24.2%' class='fo2'>Ingrediente Especial: </font>&nbsp;&nbsp;&nbsp;");
                            out.println("<font class='fopeque'>Si</font>&nbsp;");
                            if(es.equals("Si")){
                            out.println("<input type='radio' class='tex2' name='Especiales' value='Si' size='4' checked>&nbsp;&nbsp;&nbsp;");
                            }else{
                            out.println("<input type='radio' class='tex2' name='Especiales' value='Si' size='4'>&nbsp;&nbsp;&nbsp;");    
                            }
                            out.println("<font class='fopeque'>No</font>&nbsp;");
                            if(es.equals("No")){
                                out.println("<input type='radio' class='tex2' name='Especiales' value='No' size='4' checked>");
                            }else{
                                out.println("<input type='radio' class='tex2' name='Especiales' value='No' size='4'>");
                            }
                            out.println("<br><font style='padding-left: 25%'></font>");
                            out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                            out.println("<input type='submit' name='enviar' value='Guardar' class='submit'>");
                            
                            
                        }else{
                            out.println("<script>alert('No existe el producto');</script>");
                        }
                }catch(SQLException e){
                    out.println(e.toString());
                }
//Fin de registro Ingrediente
                }
                 if(request.getParameter("enviar")!=null){
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
                        String querystring="UPDATE Ingredientes SET ingrediente=?, especial=?";
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
                        String querystring="UPDATE Detalles SET sabor=?, forma=?, tamanio=?, ingred_esp=?";
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
                            out.println("<script>alert('No ingreso datos nuevos');</script>");
                        }else{
                        try{
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/DBVangely","root","n0m3l0");
                        String querystring="UPDATE Producto SET nomb_prod=?,precio=?,id_detalles=?";
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
             </div>
        </div>
        </form>
       
    </body>
</html>

