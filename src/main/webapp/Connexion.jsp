<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

<body style="background-image: url('images/1080.jpg');">

	<div class="container">
		<div class="row">
			<div class="col s12 m8 offset-m2 offset-s0">
				<div class="card blue-grey darken-1 z-depth-4">
						<div class="card-content white-text">
							<span class="card-title center">
								<h3>Sign in</h3>
							</span>
							<div class="row">
								<div class="col m6 s12 center hide-on-small-only"
									style="padding-top: 35px">
									<i class="material-icons large">account_circle</i>
								</div>
								<div class="col m6 s12">
									<div class="row">
										<div id="log" class="input-field col s12">
											<i class="material-icons prefix">perm_identity</i> 
											<input id="login" type="text" class="validate" name="login">
											<label for="login">Login</label>
										</div>
										<div id="pass" class="input-field col s12">
											<i class="material-icons prefix">vpn_key</i> <input
												id="password" type="password" class="validate"
												name="password"> <label for="password">Password</label>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="card-action">
							<div class="row center">
								<div class="col s6">
									<button id="in" class="btn waves-effect waves-light"
										type="submit">
										Sign in <i class="material-icons right">send</i>
									</button>
								</div>
								<div class="col s6">
									<button id="up"
										class="btn waves-effect waves-light amber darken-2"
										type="button">
										Sign up <i class="material-icons right">person_add</i>
									</button>
								</div>
							</div>
						</div>
				</div>
			</div>
		</div>
	</div>


	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
	<script src="functions.js"></script>
		
	<script type="text/javascript">
			$(document).ready(function() {
				$("#in").click(function () {
                    verifyuser(
                        $('#login').val(),
                        $('#password').val(),null,null)});
			});
		$('#up').click(function() {
			document.location.href = "Inscription.jsp";
		});
	</script>
</body>
</html>
