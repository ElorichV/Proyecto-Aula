<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link type="text/css" href="css/CSSgg.css" rel="stylesheet">
		<link type="text/css" href="css/cssm.css" rel="stylesheet">
        <link href='https://fonts.googleapis.com/css?family=ABeeZee' rel='stylesheet' type='text/css'>
		<link rel="icon" type="image/icon" href="img/favicon.ico" />
        <script src="js/jsm.js"></script>
    </head>
    <body>
        
         <header>
            <nav>
                <ul>
                    <li><a href="bienvenido.jsp" class="dib"><img src="img/Logo.png" alt="logito" width="80" height="80"></a><li>
					<li> &emsp;&emsp;&emsp;<li>
					<li class="l"><a href="home.jsp" class="hober"><b>Home</b></a><li>
					<li> &emsp; &emsp; &emsp;<li>
                    <li class="l"><a href="productos.jsp" class="hober"><b>Productos</b></a></li>
					<li> &emsp; &emsp; &emsp;<li>
                    <li class="l"><a href="promociones.jsp" class="hober"><b>Promociones</b></a><li>
					<li> &emsp; &emsp; &emsp; &emsp;&emsp;&emsp; <li>
                    <li><a href="registro.html" class="hoberg"><b>Registro</b></a><li>
					<li> &emsp;<li>
					<li><a href="#" class="c"><img src="img/carrito.png" alt="carrito" width="60" height="40"></a><li>
                </ul>
            </nav>
        </header>
       <br>
	   <br>
		<div style="display: table;width: 100%;height: 70%; position: absolute; ">
            <div style="float: left; width: 50%; height: 100%; background-color: rgb(246,239,229)">
			<br>
				<br>
				<br>
			
			
				&emsp; &emsp; 
                <img src="img/Pansito.jpg" alt="registro" width="565" height="573">
            </div>
            <div style="float: left; width: 50%; height: 100%;">
                <br>
				<br>
				<br><br>
				<br>
				
                <font class="titulo" style="padding-left:30px;">Inicio</font>

                <form class="formulario" name="regForm" method="post" action="jsp/inicio.jsp">
                    
                    <input type="email" name="correo" placeholder="Correo electr&oacute;nico" required   pattern=".+(@).+(.org|.com|.com.mx|.mx)"/>
                    <br>
                    <br>
                    <br>
                    <input type="password" name="contrasenia"  placeholder="Contrase&ntilde;a"  required/>
                    <br>
                    <br>
					<br>
					
                    <br>&emsp; &emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input class="submit hoberg" type=submit name=ok value="Iniciar sesi&oacute;n">
                </form>
                <%@page import="java.sql.*, java.io.*, javax.servlet.*, javax.servlet.http.*"

                %>
            </div>
			<div style="float:left; width:100%; height:250px; background-color:rgb(111,26,38);">
			<img src="img/esr.png" height="80" class="esr">
				<img src="img/vangely.png" width="150" height="60" class="va" >
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
        </div>
		
    </body>
</html>
