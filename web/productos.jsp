<!DOCTYPE html>
<html>
   <head>
        <title>Vangely</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="css/CSSProductos.css">
		<link href='https://fonts.googleapis.com/css?family=ABeeZee' rel='stylesheet' type='text/css'>
		<link rel="icon" type="image/icon" href="img/favicon.ico" />
                <link rel="stylesheet" href="css/nnn.css">
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
					<li> &emsp; &emsp; &emsp; <li>
                                        <li><a href="inicio.jsp" class="hoberg"><b>
                                                Inicio</b></a></li>
                    <li><a href="registro.jsp" class="hoberg"><b>Registro</b></a><li>
					<li> &emsp;<li>
					<li><a href="#" class="c"><img src="img/carrito.png" alt="carrito" width="60" height="40"></a><li>
                </ul>
            </nav>
        </header>
       <div style="float:left; width:100%; background-color:#F5F5F5;">
            <br>
            <br>

            <font class="titulo">Nuestros pasteles <img src="img/panquesito.png" class="panquesito" width="35px" height="35px"></font>	
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <table><tr></tr><td>
                    <div class="responsive">
                        <div class="img">
                            <img src="img/muestra1.png" alt="Trolltunga Norway" width="300" height="200" class="imgp">
                            <div class="desc">muestra</div>
                        </div>
                    </div>


                    <div class="responsive">
                        <div class="img">
                            <img src="img/muestra1.png" alt="Forest" width="300" height="200" class="imgp">
                            <div class="desc">muestra</div>
                        </div>
                    </div>

                    <div class="responsive">
                        <div class="img">
                            <img src="img/muestra1.png" alt="Northern Lights" width="300" height="200" class="imgp">
                            <div class="desc">muestra</div>
                        </div>
                    </div>
                </td>

                </tr>
                <tr>
                    <td>

                        <div class="responsive">
                            <div class="img">
                                <img src="img/muestra1.png" alt="Mountains" width="300" height="200" class="imgp">
                                <div class="desc">muestra</div>
                            </div>
                        </div>
                        <div class="responsive">
                            <div class="img">
                                <img src="img/muestra1.png" alt="Mountains" width="300" height="200" class="imgp">
                                <div class="desc">muestra</div>
                            </div>
                        </div>
                        <div class="responsive">
                            <div class="img">
                                <img src="img/muestra1.png" alt="Mountains" width="300" height="200" class="imgp">
                                <div class="desc">muestra</div>
                            </div>
                        </div>
                    </td>

                </tr>
            </table>
            <div class="clearfix"></div>

            <!-- The Modal -->
            <div id="myModal" class="modal">
                <span class="close">×</span>
                <img class="modal-content" id="img01">
                <div id="caption"></div>
            </div>

            <br>
            <br>
        </div>
        <div style="float:left; width:100%; height:250px; background-color:#E64D57;">
            <img src="img/esr.png" height="80px" class="esr">
            <img src="img/vangely.png" width="150px" height="60px" class="va" >
            <br>
            <br>
            <font class="blanco">
            Â© 2016 Vangely S.A.B. de C.V. Todos los Derechos Reservados.
            </font>
            <br>
            <font class="blanco">
            Aviso de Privacidad 
            </font>
            <br>
            <img src="img/red2.png" class="reds2" align="right">
        </div>
        <script>
// Get the modal
            var modal = document.getElementById('myModal');

// Get the <span> element that closes the modal
            var span = document.getElementsByClassName("close")[0];

// When the user clicks on <span> (x), close the modal
            span.onclick = function () {
                modal.style.display = "none";
            }

// Get all images and insert the clicked image inside the modal
// Get the content of the image description and insert it inside the modal image caption
            var images = document.getElementsByTagName('img');
            var modalImg = document.getElementById("img01");
            var captionText = document.getElementById("caption");
            var i;
            for (i = 0; i < images.length; i++) {
                images[i].onclick = function () {
                    modal.style.display = "block";
                    modalImg.src = this.src;
                    modalImg.alt = this.alt;
                    captionText.innerHTML = this.nextElementSibling.innerHTML;
                }
            }
        </script>
    </body>
</html>
