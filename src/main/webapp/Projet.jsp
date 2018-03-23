<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Projet</title>
<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
<link href="noUiSlider/nouislider.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
<link rel="stylesheet" type="text/css" href="style.css">
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
		<div id="projet" class="row">
			
		</div>
	</div>
	<script src="functions.js"></script>
	<script type="text/javascript">
		
		var text = window.location.search;
		text = text.substring(text.lastIndexOf('=')+1,text.length);
		
		$('.card-title').append("<h1>Projet n°"+text+"</h1>");
		
		$.ajax({
			type : 'GET',
			url : '/BlaBlaVacances/webapi/projet/'+text,
			dataType : "json",
			async : false,
			success : function(data, textStatus, jqXHR) {
				var rep = "<div class=\"card col s12\">";
				rep += "<div class=\"row\"><div class=\"card-action col s12\"><div class=\"row card-title\"><span class=\"underline\">Nom</span> : "+data.name+"</div>";
				rep += "<div class=\"row\"><span class=\"underline\">Description</span> : "+data.description+"</div>";
				rep += "<div class=\"row\"><span class=\"underline\">Lieu</span> : "+data.lieu+"</div>";
				rep += "<div class=\"row\"><span class=\"underline\">Prévu de</span> "+data.datedep+" <span class=\"underline\">à</span> "+data.dateret+"</div>";
				rep += "<div class=\"row\"><span class=\"underline\">Nombre de participant</span> : "+data.nb_participant+"</div>";
				rep += "<div class=\"row\"><span class=\"underline\">Prix Moyen</span> : "+data.prix+"</div>";
				rep += "<div class=\"row\"><span class=\"underline\">Type d'habitation</span> : "+data.typeH+"</div>";
				rep += "<div class=\"leger row\"><span class=\"underline\">Crée par</span> <a href=\"Profil.jsp?user_login="+data.user_createur+"\">"+data.user_createur+"</a><br><span class=\"underline\">le</span> "+data.date_creation+" </div></div></div>";
				rep += "<div class=\"row\"><div class=\"card-action col s12\"><span class=\"underline\">Participants</span> : <p id=\"particpants\"></p></div></div>";
				rep += "<div class=\"row\"><div class=\"card-action col s12\"><span class=\"underline\">Hobbies</span> : <p id=\"hobbies\"></p></div></div>";
				rep += "</div>";
				$("#projet").append(rep);
			},
			error : function(jqXHR, textStatus, errorThrown) {
				console.log('getProjetByDate error: ' + textStatus);
			}
		});
		
		var tab = ifalreadyinproject(text);
		for(var i=0;i<tab.length;i++){
			$("#particpants").append(" - <a href=\"Profil.jsp?user_login="+tab[i]+"\">" +tab[i]+"</a>");
		}
		
		function getHobbies(projet_no,num){
			return $.ajax({
				type : 'GET',
				url : '/BlaBlaVacances/webapi/projet/hobbies/'+projet_no+'/'+num,
				dataType : "json",
				async : false,
				success: function(data, textStatus, jqXHR) {
					console.log("Success : "+ data);
				},
				error : function(jqXHR, textStatus, errorThrown) { 
					console.log("Wrong");
				}
			}).responseJSON;
		}
		
		tab = getHobbies(text,2);
		$("#hobbies").append(" - J'aime : ");
		for(var i=0;i<tab.length;i++){
			$("#hobbies").append(" " + tab[i]);
		}
		$("#hobbies").append("<br>");
		tab = getHobbies(text,1);
		$("#hobbies").append(" - Neutre : ");
		for(var i=0;i<tab.length;i++){
			$("#hobbies").append(" " + tab[i]);
		}
		$("#hobbies").append("<br>");
		tab = getHobbies(text,0);
		$("#hobbies").append(" - J'aime pas : ");
		for(var i=0;i<tab.length;i++){
			$("#hobbies").append(" " + tab[i]);
		}
		
		$("#retour").click(function () {
			document.location.href = "Accueil.jsp";
		});
	</script>
</body>
</html>