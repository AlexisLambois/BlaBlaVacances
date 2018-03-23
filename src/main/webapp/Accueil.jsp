<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Accueil</title>
<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
<link href="noUiSlider/nouislider.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col s10 pull-s1">
				<div class="card blue-grey darken-1 z-depth-4">
					<div class="card-content white-text">
						<span class="card-title center">
							<h1>Accueil</h1>
						</span>
					</div>	
				</div>
			</div>
			<div class="col s2 bouton_session">
				<div id="connexionform" class="row">
					<form  action="Connexion.jsp">
						<input class="waves-effect waves-light btn z-depth-4" type="submit" value="Connexion">
					</form>
				</div>
				<div id="inscriptionform" class="row">
					<form  action="Inscription.jsp">
						<input class="waves-effect waves-light btn z-depth-4" type="submit" value="Inscription">
					</form>
				</div>
				<div id="profilform" class="row">
					<input id="profil" class="waves-effect waves-light btn z-depth-4" type="submit" value="Profil">
				</div>
				<div id="decoform" class="row">
					<form>
						<input class="waves-effect waves-light btn z-depth-4" id="deco" type="submit" value="Deconnexion">
					</form>
				</div>
			</div>
		</div>
		<div class="row">
			<div id="liste" class="col s8">
				
			</div>
			<div class="col s4 push-s2">
				<div class="row">
					<!-- Dropdown Trigger -->
					<label for="ville">Ville :</label>
  					<input id="villes" class='dropdown-button' data-activates='ville'>
  					<!-- Dropdown Structure -->
					<datalist id='ville' class='dropdown-content'>
						<option onclick="dropdown(this)" value="Nord"/>Nord</option>
						<option onclick="dropdown(this)" value="Sud"/>Sud</option>
						<option onclick="dropdown(this)" value="Est"/>Est</option>
						<option onclick="dropdown(this)" value="Ouest"/>Ouest</option>
					</datalist>
				</div>
				<div class="row">
					<label for="datedep">Date de départ :</label> <input type="date"
						id="datedep" class="datepicker" name="datedep">
				</div>
				<div class="row">
					<label for="dateret">Date de retour :</label> <input type="date"
						id="dateret" class="datepicker" name="dateret">
				</div>
				<div class="row">
					<label for="prix">Prix :</label><br><br><div id="test-slider"></div>
				</div>
				<div class="row">
					<input id="recherche" class="waves-effect waves-light btn z-depth-4" type="submit" value="Rechercher">
				</div>
				<div id="new_Proj" class="row">
					<input id="newProj" class="waves-effect waves-light btn z-depth-4" type="submit" value="Proposer un nouveau projet">
				</div>
			</div>
		</div>
	</div>
	<script src="noUiSlider/nouislider.js"></script>
	<script src="functions.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/wnumb/1.1.0/wNumb.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
	<script type="text/javascript">
		var now=new Date();
		var jour=now.getDate();
		var mois=now.getMonth()+1;
		var an=now.getFullYear();
		
		var date = an+"-"+mois+"-"+jour;
		var slider = document.getElementById('test-slider');
		
		window.onload = getProjetByDate(date);
	
		noUiSlider.create(slider, {
			   start: [0, 2000],
			   connect: true,
			   step: 1,
			   tooltips: [ true, true ],
			   margin: 10,
			   orientation: 'horizontal', // 'horizontal' or 'vertical'
			   range: {
			     'min': 0,
			     'max': 2000
			   },
			   format: wNumb({
					decimals:0,
				})
			  });
		
		$('.datepicker').pickadate({
		    selectMonths: true, // Creates a dropdown to control month
		    selectYears: 15, // Creates a dropdown of 15 years to control year,
		    monthsFull: ['Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre'],
		    weekdaysShort: ['Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi','Dimanche'],
		    monthsShort: ['Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre'],
		    weekdaysFull: ['Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi','Dimanche'],
		    labelMonthNext: 'Next month',
		    labelMonthPrev: 'Previous month',
		    labelMonthSelect: 'Select a month',
		    labelYearSelect: 'Select a year',
		    firstDay:1,
		    formatSubmit: 'dd/mm/yyyy',
		    min: true,
		    today: 'Today',
		    clear: 'Clear',
		    close: 'Ok',
		    closeOnSelect: false // Close upon selecting a date,
		});
		if(sessionStorage.getItem("current_login")==null){
			$("#new_Proj").hide();
			$("#profilform").hide();
			$("#connexionform").show();
			$("#inscriptionform").show();
			$("#decoform").hide();
		}else{
			$("#new_Proj").show();
			$("#profilform").show();
			$("#connexionform").hide();
			$("#inscriptionform").hide();
			$("#decoform").show();
		}
			
		$("#deco").click(function () {
			sessionStorage.clear();
			document.location.href = "Accueil.jsp";
		});
		
		$("#profil").click(function () {
			document.location.href = "Profil.jsp?user_login="+sessionStorage.getItem("current_login");
		});
		
		$("#newProj").click(function () {
			var url = "NewProj.jsp?";
			if($("#villes").val() !== ""){
				url += "ville="+$("#villes").val();
			}
			if($("#datedep").val() !== ""){
				url += "&datedep="+$("#datedep").val();
			}
			if($("#dateret").val() !== ""){
				url += "&dateret="+$("#dateret").val();
			}
			document.location.href = url;
		});
		
		$("#recherche").click(function () {
			search($("#villes").val(),$("#datedep").val(),$("#dateret").val(),document.getElementsByClassName("noUi-tooltip")[0].textContent,
					document.getElementsByClassName("noUi-tooltip")[1].textContent);
		});
		
		function dropdown(e){
			document.getElementsByClassName("dropdown-button")[0].value=e.value;
		}
		
		function goToProjet(e){
			document.location.href = "Projet.jsp?id="+e;
		}
	</script>
</body>
</html>
