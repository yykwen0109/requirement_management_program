<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="icon"
	href="<%=request.getContextPath()%>/resources/gentelella-master/production/images/favicon.ico"
	type="image/ico" />
<title>CSR 통합 관리자</title>
<!-- Bootstrap -->
<link
	href="<%=request.getContextPath()%>/resources/gentelella-master/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href="<%=request.getContextPath()%>/resources/gentelella-master/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link
	href="<%=request.getContextPath()%>/resources/gentelella-master/vendors/nprogress/nprogress.css"
	rel="stylesheet">

<!-- bootstrap-daterangepicker -->
<link
	href="<%=request.getContextPath()%>/resources/gentelella-master/vendors/bootstrap-daterangepicker/daterangepicker.css"
	rel="stylesheet">
<!-- bootstrap-datetimepicker -->
<link
	href="<%=request.getContextPath()%>/resources/gentelella-master/vendors/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.css"
	rel="stylesheet">

<!-- iCheck -->
<link
	href="<%=request.getContextPath()%>/resources/gentelella-master/vendors/iCheck/skins/flat/green.css"
	rel="stylesheet">
<!-- bootstrap-wysiwyg -->
<link
	href="<%=request.getContextPath()%>/resources/gentelella-master/vendors/google-code-prettify/bin/prettify.min.css"
	rel="stylesheet">
<!-- Select2 -->
<link
	href="<%=request.getContextPath()%>/resources/gentelella-master/vendors/select2/dist/css/select2.min.css"
	rel="stylesheet">
<!-- Switchery -->
<link
	href="<%=request.getContextPath()%>/resources/gentelella-master/vendors/switchery/dist/switchery.min.css"
	rel="stylesheet">
<!-- starrr -->
<link
	href="<%=request.getContextPath()%>/resources/gentelella-master/vendors/starrr/dist/starrr.css"
	rel="stylesheet">
<!-- bootstrap-daterangepicker -->
<link
	href="<%=request.getContextPath()%>/resources/gentelella-master/vendors/bootstrap-daterangepicker/daterangepicker.css"
	rel="stylesheet">
<!-- bootstrap-daterangepicker -->

<!-- Custom Theme Style -->
<link
	href="<%=request.getContextPath()%>/resources/gentelella-master/build/css/custom.min.css"
	rel="stylesheet">
</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<jsp:include page="${request.contextPath}/modul_sidebar"></jsp:include>
			<jsp:include page="${request.contextPath}/modul_top_navi"></jsp:include>
			<!-- page content -->
			<div class="right_col" role="main">
				<div class="">

					<div class="clearfix"></div>


					<div class="row">


						<div class="col-md-6 col-xs-12 container">
							<div class="x_panel">
								<div class="x_title">
									<h2>
										직원 등록 <small></small>
									</h2>
									<ul class="nav navbar-right panel_toolbox">
										<li><a class="collapse-link"><i
												class="fa fa-chevron-up"></i></a></li>
										<!-- <li class="dropdown"><a href="#" class="dropdown-toggle"
											data-toggle="dropdown" role="button" aria-expanded="false"><i
												class="fa fa-wrench"></i></a>
											<ul class="dropdown-menu" role="menu">
												<li><a href="#">Settings 1</a></li>
												<li><a href="#">Settings 2</a></li>
											</ul></li> -->

									</ul>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<br />
									<form class="form-horizontal form-label-left"
									action="addUserPost" method="post">
										<!--  -->
										<div class="form-group">
											<label class="control-label col-md-2 col-sm-3 col-xs-12">직원
												이름</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
												<input class="form-control" id="text-input" type="text"
													name="employee_name" placeholder="직원 이름">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-2 col-sm-3 col-xs-12">직원
												직책</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
												<select class="form-control" id="select1"
													name="employee_job">
													<option value="PRO">PRO</option>
													<option value="FD">FD</option>
													<option value="CM">CM</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-2 col-sm-3 col-xs-12">직원
												ID</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
												<input class="form-control" id="text-input" type="text"
													name="employee_id" placeholder="직원 ID">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-2 col-sm-3 col-xs-12">직원
												PW</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
												<input class="form-control" id="text-input" type="text"
													name="employee_pw" placeholder="직원 PW">
											</div>
										</div>


										<!--  -->

										<br /> <br /> <br />
										<div class="ln_solid"></div>
										<div class="form-group">
											<div class=" col-md-3 col-sm-3 col-xs-9 col-md-offset-10">
												<button class="btn btn-danger" type="reset">초기화</button>
												<button type="submit" class="btn btn-success">등록</button>
											</div>
										</div>

									</form>
								</div>
							</div>
						</div>



					</div>

				</div>
			</div>
			<!-- /page content -->

			<jsp:include page="${request.contextPath}/modul_footer"></jsp:include>
		</div>
	</div>

	<!-- jQuery -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/fastclick/lib/fastclick.js"></script>
	<!-- NProgress -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/nprogress/nprogress.js"></script>
	<!-- bootstrap-progressbar -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<!-- iCheck -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/iCheck/icheck.min.js"></script>
	<!-- bootstrap-daterangepicker -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/moment/min/moment.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
	<!-- bootstrap-wysiwyg -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/google-code-prettify/src/prettify.js"></script>
	<!-- jQuery Tags Input -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>
	<!-- Switchery -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/switchery/dist/switchery.min.js"></script>
	<!-- Select2 -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/select2/dist/js/select2.full.min.js"></script>
	<!-- Parsley -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/parsleyjs/dist/parsley.min.js"></script>
	<!-- Autosize -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/autosize/dist/autosize.min.js"></script>
	<!-- jQuery autocomplete -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
	<!-- starrr -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/starrr/dist/starrr.js"></script>
	<!-- Custom Theme Scripts -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/build/js/custom.min.js"></script>
	<!-- bootstrap-daterangepicker -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/moment/min/moment.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
	<!-- bootstrap-datetimepicker -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/common.js"></script>
	<!-- Initialize datetimepicker -->
	<script>
		$('#myDatepicker').datetimepicker();

		$('#myDatepicker2').datetimepicker({
			format : 'DD.MM.YYYY'
		});

		$('#myDatepicker3').datetimepicker({
			format : 'hh:mm A'
		});

		$('#myDatepicker4').datetimepicker({
			ignoreReadonly : true,
			allowInputToggle : true
		});

		$('#datetimepicker6').datetimepicker();

		$('#datetimepicker7').datetimepicker({
			useCurrent : false
		});

		$("#datetimepicker6").on("dp.change", function(e) {
			$('#datetimepicker7').data("DateTimePicker").minDate(e.date);
		});

		$("#datetimepicker7").on("dp.change", function(e) {
			$('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
		});
	</script>
</body>
</html>
