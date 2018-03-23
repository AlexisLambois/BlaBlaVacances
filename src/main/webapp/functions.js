function verifMotsDePasse(champ1,champ2){
	return (champ1 === champ2 && champ1 !== "" && champ2 !== "" && champ1 !== null && champ2 !== null);
}

function afficheUser(data) {
	console.log(data);
	$("#reponse").html(userStringify(data));
}

function postUser(login,name,firstname,email,password,password2,dateofbirth,phonenumber) {
	if(verifMotsDePasse(password, password2))
		postUserGeneric(login,name,firstname,email,password,dateofbirth,phonenumber,'/BlaBlaVacances/webapi/user/');
	else
		alert("Veuillez remplir correctement tous les champs (Inscription)");
}

function verifyuser(login,password) {
	console.log("verifyuser");
	$.ajax({
		type : 'GET',
		url : '/BlaBlaVacances/webapi/user/'+login,
		dataType : "json",
		success : function(data, textStatus, jqXHR) {
			if( data.password === password ){
				sessionStorage.setItem("current_login", login);
				sessionStorage.setItem("current_name", data.name);
				sessionStorage.setItem("current_firstname", data.firstname);
				sessionStorage.setItem("current_dateofbirth", data.dateofbirth);
				document.location.href = 'Accueil.jsp';
			}else{
				alert("Mauvais Identifiant");
			}
		},
		error : function(jqXHR, textStatus, errorThrown) {
			console.log('postUser error: ' + textStatus);
			alert("Veuillez remplir correctement tous les champs (Connexion)");
		}
	});
}

function postUserGeneric(login,name,firstname,email,password,dateofbirth,phonenumber,url) {
	console.log("postUserGeneric " + url);
	$.ajax({
		type : 'POST',
		contentType : 'application/json',
		url : url,
		dataType : "json",
		data : JSON.stringify({
			"login" : login,
			"name" : name,
			"firstname" : firstname,
			"email" : email,
			"password" : password,
			"dateofbirth" : dateofbirth,
			"phonenumber" : phonenumber
		}),
		success : function(data, textStatus, jqXHR) {
			console.log('Success !');
			document.location.href = 'Connexion.jsp';
		},
		error : function(jqXHR, textStatus, errorThrown) {
			console.log('postUser error: ' + textStatus);
			alert("Veuillez remplir correctement tous les champs (Inscription)");
		}
	});
}
function postProjet(name,description,lieu,date_creation,datedep,dateret,typeH,nb_participant,prix,login,divVert,divOrange,divRouge) {
	$.ajax({
		type : 'POST',
		contentType : 'application/json',
		url : '/BlaBlaVacances/webapi/projet?divVert='+divVert+'&divOrange='+divOrange+'&divRouge='+divRouge,
		dataType : "json",
		data : JSON.stringify({
			"name" : name,
			"description" : description,
			"lieu" : lieu,
			"date_creation" : date_creation,
			"datedep" : datedep,
			"dateret" : dateret,
			"typeH" : typeH,
			"nb_participant" : nb_participant,
			"prix" : prix,
			"user_createur" : login
		}),
		success : function(data, textStatus, jqXHR) {
			console.log('Success !');
			document.location.href = 'Accueil.jsp';
		},
		error : function(jqXHR, textStatus, errorThrown) {
			console.log('postProjet error: ' + textStatus);
			alert("Veuillez remplir correctement tous les champs (Proposition)");
		}
	});
}

function insertParticipation(projet_no){
	console.log(projet_no + " " + sessionStorage.getItem("current_login"));
	$.ajax({
		type : 'POST',
		contentType : 'application/json',
		url : '/BlaBlaVacances/webapi/projet/particp?user_login='+sessionStorage.getItem("current_login")+'&no_projet='+projet_no,
		dataType : "json",
		success : function(data, textStatus, jqXHR) {
			console.log("Succes");
			location.reload();
		},
		error : function(jqXHR, textStatus, errorThrown) { console.log("Error"); }
	});
}

function getProjetByDate(date_creation) {
	console.log("getProjetByDate");
	$.ajax({
		type : 'GET',
		url : '/BlaBlaVacances/webapi/projet/date/'+date_creation,
		dataType : "json",
		success : function(data, textStatus, jqXHR) {
			liste.innerHTML = "";
			for(var i=0;i<data.length;i++){
				var text = "<div onclick=\"goToProjet("+data[i].projet_no+")\" class=\"row projet\"><label>"+data[i].name + " : " + data[i].lieu+"</label><br><label>Du "+data[i].datedep+" au "+data[i].dateret+"</label>";	
				if( sessionStorage.getItem("current_login")!=null && String(sessionStorage.getItem("current_login")) !== data[i].user_createur && !ifalreadyinproject(data[i].projet_no).includes(sessionStorage.getItem("current_login")) ){
					text += "<input type=\"button\" value=\"Rejoindre\" onclick=insertParticipation(\""+data[i].projet_no+"\")>";
				}
				text += "<hr></div>";
				$("#liste").append(text);
				var tab = $("#liste > div > input");
			}
		},
		error : function(jqXHR, textStatus, errorThrown) {
			console.log('getProjetByDate error: ' + textStatus);
			alert("Erreur");
		}
	});
}

function ifalreadyinproject(projet_no){
	return $.ajax({
		type : 'GET',
		url : '/BlaBlaVacances/webapi/projet/particip/'+projet_no,
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

function getUser(id_user) {
	$.ajax({
		type : 'GET',
		url : '/BlaBlaVacances/webapi/user/'+id_user,
		dataType : "json",
		async : false,
		success : function(data, textStatus, jqXHR) {
			var text = "<div class=\"card-panel teal lighten-2 row\"><div class=\"col s9 push-s1\">";
			text += "<div class=\"row\"><span class=\"flow-text white-text text-darken-2\"><p><span class=\"underline\">Prénom</span> : "+data.name+"</p></span></div>";
			text += "<div class=\"row\"><span class=\"flow-text white-text text-darken-2\"><p><span class=\"underline\">Nom</span> : "+data.firstname+"</p></span></div></div>";
			text += "<div class=\"col s2\"><i class=\"material-icons large\">account_circle</i></div></div>";
			text += "<div class=\"card-panel teal lighten-2 row\"><div class=\"col s9 push-s1\"><div class=\"row\"><span class=\"white-text text-darken-2 flow-text\"><p><span class=\"underline\">Email</span> : "+data.email+"</p></span></div>";
			text += "<div class=\"row\"><span class=\"flow-text white-text text-darken-2\"><p><span class=\"underline\">Date de Naissance</span> : "+data.dateofbirth+"</p></span></div>";
			text += "<div class=\"row\"><span class=\"flow-text white-text text-darken-2\"><p><span class=\"underline\">Numéro de téléphone</span> : "+data.phonenumber+"</p></span></div>";
			text += "<div class=\"row\"><span class=\"flow-text white-text text-darken-2\"><p><span class=\"underline\">Projet En Cours</span> : <div id=\"projet_cours\"></div></p></span></div></div></div>";
			
			$("#profil").append(text);
			
			var tab = getProjetByUser(id_user);
			
			for(var i=0;i<tab.length;i++){
				$("#projet_cours").append(" - <a class=\"red-text\"href=\"Projet.jsp?id="+tab[i].projet_no+"\">" +tab[i].name+"</a>");
			}
		
		},
		error : function(jqXHR, textStatus, errorThrown) { console.log("error"); }
	});
}

function getProjetByUser(id_user){
	return $.ajax({
		type : 'GET',
		url : '/BlaBlaVacances/webapi/projet/byUser/'+id_user,
		dataType : "json",
		async : false,
		success : function(data, textStatus, jqXHR) {	
		},
		error : function(jqXHR, textStatus, errorThrown) { console.log("error"); }
	}).responseJSON;
}

function search(ville,datedep,dateret,prixMin,prixMax,activites) {
	console.log("search");
	$.ajax({
		type : 'GET',
		url : '/BlaBlaVacances/webapi/projet/affinage/'+ville+"&"+datedep+"&"+dateret+"&"+prixMin+"&"+prixMax,
		dataType : "json",
		async : false,
		success : function(data, textStatus, jqXHR) {
			liste.innerHTML = "";
			for(var i=0;i<data.length;i++){
				var text = "<div class=\"row projet\"><div onclick=\"goToProjet("+data[i].projet_no+")\"><label>"+data[i].name + " : " + data[i].lieu+"</label><br><label>Du "+data[i].datedep+" au "+data[i].dateret+"</label>";	
				if( sessionStorage.getItem("current_login")!=null && String(sessionStorage.getItem("current_login")) !== data[i].user_createur && !ifalreadyinproject(data[i].projet_no).includes(sessionStorage.getItem("current_login")) ){
					text += "</div><input type=\"button\" value=\"Rejoindre\" onclick=insertParticipation(\""+data[i].projet_no+"\")>";
				}
				text += "<hr></div>";
				$("#liste").append(text);
				var tab = $("#liste > div > input");
			}
		},
		error : function(jqXHR, textStatus, errorThrown) {
			console.log('search error: ' + textStatus);
			alert("Veuillez remplir correctement tous les champs (Recherche)");
		}
	});
}

