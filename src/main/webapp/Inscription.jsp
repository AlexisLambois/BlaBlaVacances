<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>	
<body><!-- style="background-image: url('images/1080.jpg');"-->

	<div class="container">
		<div class="row">
			<div class="col s12 m8 offset-m2 offset-s0">
				<div class="card blue-grey darken-1 z-depth-4">
						<div class="card-content white-text">
							<span class="card-title center">
								<h3>Sign up</h3>
							</span>
							<div class="row">
								<div class="col m6 s12 center hide-on-small-only"
									style="padding-top: 35px">
									<i class="material-icons large">person_add</i>
								</div>
								<div class="col m6 s12">
									<div class="row">
										<div class="input-field col s12">
											<i class="material-icons prefix">person_pin</i> <input
												id="name" type="text" class="validate" name="name" maxlength="30" required="required"> <label
												for="name">Name</label>
										</div>
										<div class="input-field col s12">
											<i class="material-icons prefix">person_pin</i> <input
												id="firstname" type="text" class="validate" name="firstname" maxlength="30" required="required"> <label
												for="firstname">First name</label>
										</div>
									</div>
								</div>
								<div class="col s12">
									<div class="input-field col s6">
										<i class="material-icons prefix">perm_identity</i> <input
											id="login" type="text" class="validate" name="login" maxlength="20" required="required"> <label
											for="login">Login</label>
									</div>
									<div class="input-field col s6">
										<i class="material-icons prefix">email</i> <input id="email"
											type="email" class="validate" name="email" required="required"> <label for="email"
											data-error="wrong" data-success="right">Email</label>

									</div>
									<div class="input-field col s6">
										<i class="material-icons prefix">vpn_key</i> <input id="password"
											type="password" class="validate" name="password" required="required"> <label for="password">Password</label>
									</div>
									<div class="input-field col s6">
										<i class="material-icons prefix">vpn_key</i> <input id="password2"
											type="password" class="validate" name="password2" required="required"> <label for="password2">Repeat
											password</label>
									</div>
									<div class="input-field col s6 offset-s3">
										<i class="material-icons prefix">event_available</i> <input
											id=dateofbirth type="text" class="datepicker" name="dateofbirth"> <label
											for="dateofbirth">Date of birth</label>
									</div>
									<div class="input-field col s6 offset-s3">
										<i class="material-icons prefix">call</i> <input
											id=phonenumber type="text" class="validate" name="phonenumber" maxlength="10"> <label
											for="phonenumber">Phone Number</label>
									</div>
								</div>
							</div>
						</div>
						<div class="card-action">
							<div class="row center">
								<div class="col s6">
									<button id="in" class="btn waves-effect waves-light"
										type="submit">
										Sign up <i class="material-icons right">send</i>
									</button>
								</div>
								<div class="col s6">
									<button id="out"
										class="btn waves-effect waves-light red accent-2"
										type="button">
										Return <i class="material-icons right">reply</i>
									</button>
								</div>
							</div>
						</div>
				</div>
			</div>
		</div>
	</div>

	<script	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
	<script src="functions.js"></script>
	
	<script type="text/javascript">
			$(document).ready(function() {
				$("#in").click(function () {
                    postUser(
                        $('#login').val(),
                        $('#name').val(),
                        $('#firstname').val(),
                        $('#email').val(),
                        $('#password').val(),
                        $('#password2').val(),
                        $('#dateofbirth').val(),
                        $('#phonenumber').val())});
			});
		$('.datepicker').pickadate({
			selectMonths : true, // Creates a dropdown to control month
			selectYears : 15, // Creates a dropdown of 15 years to control year,
			today : 'Today',
			clear : 'Clear',
			close : 'Ok',
			closeOnSelect : false
		// Close upon selecting a date,
		});

		$('#out').click(function() {
			document.location.href = "Connexion.jsp";
		});
	</script>
</body>
