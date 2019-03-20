<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link type="text/css" href="css/CSSgg.css" rel="stylesheet">
		<link type="text/css" href="css/CSSbien.css" rel="stylesheet">
        <link href='https://fonts.googleapis.com/css?family=ABeeZee' rel='stylesheet' type='text/css'>
		<link rel="icon" type="image/icon" href="img/favicon.ico" />
        <script src="js/jsm.js"></script>
    </head>
    <body >
        
         <header>
            <nav>
                <ul>
                    <li><a href="#" class="dib"><img src="img/Logo.png" alt="logito" width="80" height="80"></a><li>
					<li> &emsp;&emsp;&emsp;<li>
					<li class="l"><a href="home.jsp" class="hober"><b>Home</b></a><li>
					<li> &emsp; &emsp; &emsp;<li>
                    <li class="l"><a href="productos.jsp" class="hober"><b>Productos</b></a></li>
					<li> &emsp; &emsp; &emsp;<li>
                    <li class="l"><a href="promociones.jsp" class="hober"><b>Promociones</b></a><li>
					<li> &emsp; &emsp; &emsp; &emsp;&emsp;&emsp; <li>
                                                    <li><a href="inicio.jsp" class="hoberg"><b>
                        <%@page import="java.sql.*, java.io.*"%>
        <%  
        try {
            
           //request.getSession().removeAttribute("logueado");
           //session.invalidate();
           HttpSession actual=request.getSession(true);
           String nombre1=(String)actual.getAttribute("logueado");
           
           
           if(nombre1 != null ){
                out.println("admin");
               
                
           }
           else
               out.println("inicio");
        }
        
            catch (Exception e)
            {
                out.print(e.getLocalizedMessage());
                e.printStackTrace();
            }
        %>
                                                                
                                                </b></a></li>
					<li>&nbsp;&nbsp;&nbsp;&nbsp;<li>
					<li><a href="#" class="c"><img src="img/carrito.png" alt="carrito" width="60" height="40"></a><li>
                </ul>
            </nav>
        </header>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
		<div style="display: table;width: 100%;">
		<img src="img/bienvenidos.png" width="100%" >
			<div style="background-image:url(img/puntitos.png); width:93%; height:142px; padding-left:7%;" >
				<br>
				<br>
				<br>
				<input type="submit" name="mOrdenes" value="Mis ordenes" class="b1">
				&emsp; &emsp; &emsp;&emsp; &emsp; &emsp;&emsp; &emsp; &emsp;&emsp; &emsp;&emsp; &emsp;&emsp;&emsp;&emsp; &emsp; 
				<input type="submit" name="ordenar" value="Ordenar" class="b2">
				&emsp; &emsp; &emsp;&emsp; &emsp; &emsp;&emsp; &emsp; &emsp;&emsp; &emsp;&emsp; &emsp;&emsp; &emsp;&emsp; &emsp;
				<input type="submit" name="inf" value="Mi Informacion" class="b3" visible="false">
			</div>
		</div>
		<div style="float:left; width:100%; height:250px; background-color:rgb(111,26,38);">
			<img src="img/esr.png" height="80px" class="esr">
				<img src="img/vangely.png" width="150px" height="60px" class="va" >
				<br>
				<br>
				<font class="blanco">
				© 2016 Vangely S.A.B. de C.V. Todos los Derechos Reservados.
				</font>
				<br>
				<font class="blanco">
				 Aviso de Privacidad 
				</font>
				<br>
				<img src="img/red2.png" class="reds2" align="right">
			</div>
	</body>
</html>