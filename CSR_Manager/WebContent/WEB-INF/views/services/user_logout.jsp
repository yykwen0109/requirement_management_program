<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" media="screen"
	href="<%=request.getContextPath()%>/resources/particles.js-master/demo/css/style.css">
<link rel="icon"
	href="<%=request.getContextPath()%>/resources/gentelella-master/production/images/favicon.ico"
	type="image/ico" />

<title>CSR 통합 관리자</title>

<!-- Bootstrap -->
<link href="<%=request.getContextPath()%>/resources/css/logInAndOut.css"
	rel="stylesheet">

</head>

<script>
var message = '${message}';
if(message != null && message != ''){
	alert(message);
}
</script>

<body class="app flex-row align-items-center">

	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-8"  style="z-index: 3">
				<div class="card-group" >
					<div class="card p-4">
						<form class="form-horizontal" action="login" method="post" id="login_form">
							<div class="card-body">
								<h1>Login</h1>
								<p class="text-muted">Sign In to your account</p>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i class="icon-user"></i>
										</span>
									</div>
									<input class="form-control" type="text" placeholder="Username"
										name="user_id" required="required">
								</div>
								<div class="input-group mb-4">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i class="icon-lock"></i>
										</span>
									</div>
									<input class="form-control" type="password"
										placeholder="Password" name="user_pw" required="required">
								</div>
								<br>
								<div class="row">
									<div class="col-6">

										<button class="btn btn-primary px-4"
											style="color: #fff; background-color: #20a8d8; border-color: #20a8d8;"
											type="submit">Login</button>

									</div>
								</div>
							</div>
						</form>

					</div>

				</div>
			</div>
		</div>
	</div>


	<!-- particles.js container -->
	<div id="particles-js" style="position: absolute;"></div>

	<!-- scripts -->
	<script
		src="<%=request.getContextPath()%>/resources/particles.js-master/particles.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/particles.js-master/demo/js/app.js"></script>

	<!-- stats.js -->
	<script src="js/lib/stats.js"></script>
	<script>
		var count_particles, stats, update;
		stats = new Stats;
		stats.setMode(0);
		stats.domElement.style.position = 'absolute';
		stats.domElement.style.left = '0px';
		stats.domElement.style.top = '0px';
		document.body.appendChild(stats.domElement);
		count_particles = document.querySelector('.js-count-particles');
		update = function() {
			stats.begin();
			stats.end();
			if (window.pJSDom[0].pJS.particles
					&& window.pJSDom[0].pJS.particles.array) {
				count_particles.innerText = window.pJSDom[0].pJS.particles.array.length;
			}
			requestAnimationFrame(update);
		};
		requestAnimationFrame(update);
	</script>
	
	

</body>
</html>
