<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Profil</title>
<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
<link href="noUiSlider/nouislider.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="style.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col s10 pull-s1">
				<div class="card blue-grey darken-1 z-depth-4">
					<div class="card-content white-text">
						<span class="card-title center">
							
						</span>
					</div>	
				</div>
			</div>
			<div class="col s2 bouton_session">
				<div id="new_Proj" class="row">
					<form action="NewProj.jsp">
						<input class="waves-effect waves-light btn z-depth-4" type="submit" value="Proposer un nouveau projet">
					</form>
				</div>
				<div id="decoform" class="row">
					<form action="Accueil.jsp">
						<input class="waves-effect waves-light btn z-depth-4" onclick="deco()" type="submit" value="Deconnexion">
					</form>
				</div>
				<div class="row">
					<button class="btn waves-effect waves-light" id="retour" type="submit" name="action">Retour
						<i class="material-icons right">keyboard_backspace</i>
  					</button>
				</div>
			</div>
		</div>
		<div class="row">
			<div id="profil" class="col s6">
			</div>
		</div>
	</div>
	<script src="functions.js"></script>
	<script type="text/javascript">
		var text = window.location.search;
		text = text.substring(text.lastIndexOf('=')+1,text.length);
		getUser(text);
		$('.card-title').append("<h1>Profil : "+text+"</h1>");
		function deco(){
			sessionStorage.clear();
		}
		$("#retour").click(function () {
			document.location.href = "Accueil.jsp";
		});
	</script>
</body>
</html>