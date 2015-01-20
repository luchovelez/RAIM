<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Bienvenido al AudioDiccionario</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
	</head>
	<body>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="status" role="complementary">
			<h1>Menu Principal</h1>
			<ul>
                            <li><a href="diccionario/index">Listar Diccionario</a></li>
                            <li><a href="diccionario/create">Crear Diccionario</a></li>
                            <li><a href="vocabulario/index">Listar Vocabulario</a></li>
                            <li><a href="vocabulario/list">Buscar palabra</a></li>
                            <li><a href="vocabulario/create">Crear palabra</a></li>
				
			</ul>
			
		</div>
		<div id="page-body" role="main">
			<h1>Bienvenido al AudioDiccionario</h1>
                        <p align="justify">Bienvenido al AudioDiccionario. <br> Esta aplicacion le permitira crear diversos Diccionarios al
                        usuario de diversas tematicas y diversos niveles educativos que le permitira posteriormente su clasificacion
                        y construccion comnunitaria de otros usuarios o autores, que permitira que la aplicacion de audiodiccionario 
                        diga creciendo permanentemente.La aplicacion proporciona un motor de sintetizacion de voz para las palabras 
                        ingresadas de manera nativa, soportando diversos navegadores web</p>

			<div id="controller-list" role="navigation">
				<h2>Modulos Disponibles:</h2>
				<ul>
                            <li>Listar Diccionario  <a href="diccionario/index"><asset:image src="list.png" alt="listar"  width="50" height="50"/></a></li>
                            <li>Agregar Diccionario <a href="diccionario/create"><asset:image src="add_list.png" width="50" height="50" alt="agregar diccionario"/></a></li>
                            <li>Listar Vocabulario  <a href="vocabulario/index"><asset:image src="chatlist.png" width="50" height="50" alt="listar Vocabulario"/></a></li>
                            <li>Crear palabra       <a href="vocabulario/create"><asset:image src="chatadd.png" width="50" height="50" alt="listar Vocabulario"/></a></li>
                            <li>Buscar palabra       <a href="vocabulario/list"><asset:image src="search.png" width="50" height="50" alt="Buscar Vocabulario"/></a></li>
				</ul>
			</div>
		</div>
	</body>
</html>
