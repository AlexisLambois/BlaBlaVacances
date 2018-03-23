<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>New projet</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
<link href="noUiSlider/nouislider.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col s12">
				<div class="card blue-grey darken-1 z-depth-4">
					<div class="card-content white-text">
						<span class="card-title center">
							<h1>New Projet</h1>
						</span>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<label for="titre">Titre : </label> <input type="text" id="titre"
				name="titre" maxlength="20" />
		</div>
		<div class="row">
			<div class="input-field col s12">
				<label for="description">Description :</label>
				<textarea class="materialize-textarea" id="description"
					name="description"></textarea>
			</div>
		</div>
		<div class="row">
			<!-- Dropdown Trigger -->
			<label for="ville">Ville :</label> <input class='dropdown-button'
				id='ville_saisie' data-activates='ville'>
			<!-- Dropdown Structure -->
			<datalist id='ville' class='dropdown-content'>
			<option onclick="dropdown(this,0)" value="Nord" />
			Nord
			</option>
			<option onclick="dropdown(this,0)" value="Sud" />
			Sud
			</option>
			<option onclick="dropdown(this,0)" value="Est" />
			Est
			</option>
			<option onclick="dropdown(this,0)" value="Ouest" />
			Ouest
			</option>
			</datalist>
		</div>
		<div class="row">
			<label for="datedep">Date de départ :</label> <input type="date"
				id="datedep" class="datepicker" name="datedep" />
		</div>
		<div class="row">
			<label for="dateret">Date de retour :</label> <input type="date"
				id="dateret" class="datepicker" name="dateret" />
		</div>
		<div class="row">
			<!-- Dropdown Trigger -->
			<label for="typeHeb">Type d'hébergement :</label> <input
				class='dropdown-button' id="typeHeb_saisie" data-activates='typeHeb'>
			<!-- Dropdown Structure -->
			<datalist id="typeHeb" class='dropdown-content'>
			<option onclick="dropdown(this,1)" value="Hotel">Hotel</option>
			<option onclick="dropdown(this,1)" value="Village Vacances">Village Vacances</option>
			<option onclick="dropdown(this,1)" value="Mobil-Home">Mobil-Home</option>
			<option onclick="dropdown(this,1)" value="Tente">Tente</option>
			<option onclick="dropdown(this,1)" value="Gite">Gite</option>
			</datalist>
		</div>
		<div class="row">
			<label for="nbP">Nombre de personnes</label>
			<div id="test-slider"></div>
		</div>
		<div class="row">
			<label for="prix">Prix :</label> <input id="prix" name="prix"
				type="number" value="200" min="10" max="10000" maxlength="5">
		</div>
		<div class="row hobbies">
			<div class="col s12">
				<div class="row">
					<div class="col s4 divDragDrop" id="divVert" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="col s4 divDragDrop" id="divOrange" ondrop="drop(event)"
						ondragover="allowDrop(event)"><label class="divElem btn waves-light" id="dragSport"
						draggable="true" ondragstart="drag(event)">Sport</label><label
						class="divElem btn waves-light" id="dragVisite" draggable="true"
						ondragstart="drag(event)">Visite</label> <label
						class="divElem btn waves-light" id="dragDetente" draggable="true"
						ondragstart="drag(event)">Detente</label> <label
						class="divElem btn waves-light" id="dragInfo" draggable="true"
						ondragstart="drag(event)">Informatique</label></div>
					<div class="col s4 divDragDrop" id="divRouge" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
				</div>
			</div>
		</div>
		<div class="row">
			<button class="btn waves-effect waves-light" id="in" type="submit"
				name="action">
				Submit <i class="material-icons right">send</i>
			</button>
		</div>
		<div class="row">
			<button class="btn waves-effect waves-light" id="retour"
				type="submit" name="action">Retour<i class="material-icons right">keyboard_backspace</i></button>
		</div>
	</div>
	<script src="noUiSlider/nouislider.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
	<script src="functions.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/wnumb/1.1.0/wNumb.js"></script>
	<script type="text/javascript">
		$("#retour").click(function() {
			document.location.href = "Accueil.jsp";
		});
		function allowDrop(ev) {
			ev.preventDefault();
		}

		function drag(ev) {
			ev.dataTransfer.setData("text", ev.target.id);
		}

		function drop(ev) {
			ev.preventDefault();
			var data = ev.dataTransfer.getData("text");
			ev.target.appendChild(document.getElementById(data));
		}
		$(document)
				.ready(
						function() {
							$("#in")
									.click(
											function() {
												var now = new Date();
												var jour = now.getDate();
												var mois = now.getMonth() + 1;
												var an = now.getFullYear();

												var strVert = document
														.getElementById("divVert").innerHTML;
												var strOrange = document
														.getElementById("divOrange").innerHTML;
												var strRouge = document
														.getElementById("divRouge").innerHTML;

												postProjet(
														$('#titre').val(),
														$('#description').val(),
														$('#ville_saisie')
																.val(),
														an + "-" + mois + "-"
																+ jour,
														$('#datedep').val(),
														$('#dateret').val(),
														$('#typeHeb_saisie')
																.val(),
														document
																.getElementsByClassName("noUi-tooltip")[0].textContent,
														$('#prix').val(),
														sessionStorage
																.getItem("current_login"),
														strVert, strOrange,
														strRouge)
											});
						});

		function dropdown(e, num) {
			document.getElementsByClassName("dropdown-button")[num].value = e.value;
		}

		$('.datepicker').pickadate(
				{
					selectMonths : true, // Creates a dropdown to control month
					selectYears : 15, // Creates a dropdown of 15 years to control year,
					monthsFull : [ 'Janvier', 'Février', 'Mars', 'Avril',
							'Mai', 'Juin', 'Juillet', 'Août', 'Septembre',
							'Octobre', 'Novembre', 'Décembre' ],
					weekdaysShort : [ 'Lundi', 'Mardi', 'Mercredi', 'Jeudi',
							'Vendredi', 'Samedi', 'Dimanche' ],
					monthsShort : [ 'Janvier', 'Février', 'Mars', 'Avril',
							'Mai', 'Juin', 'Juillet', 'Août', 'Septembre',
							'Octobre', 'Novembre', 'Décembre' ],
					weekdaysFull : [ 'Lundi', 'Mardi', 'Mercredi', 'Jeudi',
							'Vendredi', 'Samedi', 'Dimanche' ],
					labelMonthNext : 'Next month',
					labelMonthPrev : 'Previous month',
					labelMonthSelect : 'Select a month',
					labelYearSelect : 'Select a year',
					firstDay : 1,
					formatSubmit : 'dd/mm/yyyy',
					min : true,
					today : 'Today',
					clear : 'Clear',
					close : 'Ok',
					closeOnSelect : false
				// Close upon selecting a date,
				});

		var slider = document.getElementById('test-slider');
		noUiSlider.create(slider, {
			start : [ 2 ],
			step : 1,
			tooltips : [ true ],
			orientation : 'horizontal', // 'horizontal' or 'vertical'
			range : {
				'min' : 2,
				'max' : 100
			},
			format : wNumb({
				decimals : 0,
			})
		});
		var text = window.location.search;
		var indices = [];
		for(var i=0; i<text.length;i++) {
		    if (text[i] === "=") indices.push(i);
		}
		var indices2 = [];
		for(var i=0; i<text.length;i++) {
		    if (text[i] === "&") indices2.push(i);
		}
		document.getElementById("ville_saisie").value = text.substring(indices[0]+1,indices2[0]);
		document.getElementById("datedep").value = text.substring(indices[1]+1,indices2[1]).replace(/%20/g, " ");
		document.getElementById("dateret").value = text.substring(indices[2]+1,text.length).replace(/%20/g, " ");
	</script>
</body>
</html>