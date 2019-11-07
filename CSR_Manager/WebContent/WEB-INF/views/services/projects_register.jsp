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
										프로젝트 신청 <small></small>
									</h2>
									<ul class="nav navbar-right panel_toolbox">
										<li><a class="collapse-link"><i
												class="fa fa-chevron-up"></i></a></li>
									</ul>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<br />
									<form class="form-horizontal form-label-left"
										action="requirement_post_Add_Project" method="post"  novalidate>
										<!--  -->
										<div class="item form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">프로젝트
												명</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input class="form-control" id="project_name" type="text" maxlength="50"
													name="project_name" placeholder="프로젝트 명" required="required">
											</div>
										</div>
										<div class="item form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">발주
												기관</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input class="form-control" id="project_company" type="text" maxlength="30"
													name="project_company" placeholder="발주 기관" required="required">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">사업
												금액(단위: 만 원)</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input class="form-control" id="project_money" type="number" min="0" max="2000000000"
													name="project_money" placeholder="사업 금액(단위: 만 원)">
											</div>
										</div>
										<div class="form-group ">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">
												시작일자</label>
											<div class='col-md-6 col-sm-6 col-xs-12'>
												<div class='input-group date' id='myDatepicker2'>
													<input type='text' name="project_date_start" id="project_date_start"
														class="form-control readonly"/> <span class="input-group-addon">
														<span class="glyphicon glyphicon-calendar"></span>
													</span>
												</div>
											</div>
										</div>
										<div class="form-group ">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">
												종료일자</label>
											<div class='col-md-6 col-sm-6 col-xs-12'>
												<div class='input-group date' id='myDatepicker2_2'>
													<input type='text' name="project_date_end" id="project_date_end"
														class="form-control readonly"/> <span class="input-group-addon">
														<span class="glyphicon glyphicon-calendar"></span>
													</span>
												</div>
											</div>
										</div>
										<div class="item form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">진행상태</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<select class="form-control" id="project_state"
													name="project_state">
													<option value="진행중">진행중</option>
													<option value="대기">대기</option>
													<option value="완료">완료</option>
												</select>
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
		<!-- validator -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/validator/validator.js"></script>
		
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
		src="<%=request.getContextPath()%>/resources/gentelella-master/build/js/custom.js"></script>
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
			format : 'YYYY-MM-DD',
			minDate : new Date(),
			ignoreReadonly: true
		});
		
		$("#myDatepicker2").on("dp.change", function(e) {
			    $('#myDatepicker2_2').data("DateTimePicker").minDate(e.date);
		});
		
		$('#myDatepicker2_2').datetimepicker({
			format : 'YYYY-MM-DD',
			minDate : new Date(),
			ignoreReadonly: true
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
	
	<script>
	function check(t, target, message){
		if(t.test(target)) {
	           return true;
	    }
		
       alert(message);
       return false;
	}
	
	// To make field readonly
	$(".readonly").keydown(function(e){
	        e.preventDefault();
	    });
	
	
	function checkForm() {
	    var project_name = $("#project_name").val();
	    // 프로젝트명
	    var project_company = $("#project_company").val();
	    // 발주기관	    
	    var project_money = $("#project_money").val();
	    // 사업금액    
	    var project_date_start = $("#project_date_start").val();
	    // 시작일자
	    var project_date_end = $("#project_date_end").val();
	    // 종료일자
	    var project_state = $("#project_state").val();
	    // 진행상태
	    
	    // Check Regular Expressions
	    var date_check = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/; 

	    if(project_name == '' || project_name == null){
	    	alert("프로젝트명을 확인해주세요.");
	    	return false;
	    }
	    
	    if(project_name.length >= 50){
	    	alert("프로젝트명이 너무 깁니다.");
	    	return false;
	    }
	    
	    if(project_company == '' || project_company == null){
	    	alert("발주기관을 확인해주세요.");
	    	return false;
	    }
	    if(project_company.length >= 30){
	    	alert("발주기관이 너무 깁니다.");
	    	return false;
	    }
	    
	    if(project_money == '' || project_money == null){
	    	$("#project_money").val(0);
	    }
	    
	    if(project_money < 0) {
	    	alert("사업금액이 0보다 작습니다.");
	    	return false
	    }
	    if(project_money > 2000000000) {
	    	alert("사업금액이 너무 큽니다.");
	    	return false;
	    }
	    
	    if(project_state == '' || project_state == null){
	    	alert("진행상태를 확인해주세요.");
	    	return false;
	    }
	    if(project_state != '진행중' && project_state != '대기' && project_state != '완료'){
	    	alert("부적절한 진행상태입니다.");
	    	return false;
	    }
	    
	    if(!check(date_check, project_date_start, "시작일자를 다시 확인해주세요.")){
	    	return false;
	    }
	    if(!check(date_check, project_date_end, "종료일자를 다시 확인해주세요.")){
	    	return false;
	    }
	    
	    
	    return true;
	}
	</script>
</body>
</html>
