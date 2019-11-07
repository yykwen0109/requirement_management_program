<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!--
* CoreUI - Free Bootstrap Admin Template
* @version v2.1.12
* @link https://coreui.io
* Copyright (c) 2018 creativeLabs Łukasz Holeczek
* Licensed under MIT (https://coreui.io/license)
-->

<html lang="en">
<head>
<base href="./">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<meta name="description"
	content="CoreUI - Open Source Bootstrap Admin Template">
<meta name="author" content="Łukasz Holeczek">
<meta name="keyword"
	content="Bootstrap,Admin,Template,Open,Source,jQuery,CSS,HTML,RWD,Dashboard">
<title>SMP</title>
<!-- Icons-->
<!-- <link href="node_modules/@coreui/icons/css/coreui-icons.min.css" rel="stylesheet"> -->
<!-- <link href="node_modules/flag-icon-css/css/flag-icon.min.css" rel="stylesheet"> -->
<!-- <link href="node_modules/font-awesome/css/font-awesome.min.css" rel="stylesheet"> -->
<!-- <link href="node_modules/simple-line-icons/css/simple-line-icons.css" rel="stylesheet"> -->
<!-- Main styles for this application-->
<%-- <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common.css"> --%>
<link href="<%=request.getContextPath()%>/resources/css/style.css"
	rel="stylesheet">
<%-- <link href="<%=request.getContextPath() %>/resources/vendors/pace-progress/css/pace.min.css" rel="stylesheet">--%>
<link
	href="<%=request.getContextPath()%>/resources/fonts/fontawesome-free-5.8.1-web/css/all.css"
	rel="stylesheet">
<!-- Global site tag (gtag.js) - Google Analytics-->
<script async=""
	src="https://www.googletagmanager.com/gtag/js?id=UA-118965717-3"></script>
<script>
	window.dataLayer = window.dataLayer || [];

	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());
	// Shared ID
	gtag('config', 'UA-118965717-3');
	// Bootstrap ID
	gtag('config', 'UA-118965717-5');
</script>
<style>
body {
	font-family: NotoSansR, "맑은 고딕", "Malgun Gothic", NanumGothic, 돋움, Dotum,
		굴림, Gulim, Tahoma, Verdana, AppleGothic, UnDotum, sans-serif;
}
</style>
</head>
<body
	class="app header-fixed sidebar-fixed aside-menu-fixed sidebar-lg-show">
	<header class="app-header navbar">
		<button class="navbar-toggler sidebar-toggler d-lg-none mr-auto"
			type="button" data-toggle="sidebar-show">
			<span class="navbar-toggler-icon"></span>
		</button>
		<a class="navbar-brand" href="#"> <img class="navbar-brand-full"
			src="<%=request.getContextPath()%>/resources/img/logo.png" width="89"
			height="25" alt="CoreUI Logo"> <%-- <img class="navbar-brand-minimized" src="img/brand/sygnet.svg" width="30" height="30" alt="CoreUI Logo"> --%>
		</a>
		<button class="navbar-toggler sidebar-toggler d-md-down-none"
			type="button" data-toggle="sidebar-lg-show">
			<span class="navbar-toggler-icon"></span>
		</button>
		<ul class="nav navbar-nav d-md-down-none">
			<li class="nav-item px-3"><a class='' href='profile'><i
					class="fas fa-user"></i><span> 김진수</span> </a>님 현재 진행중인 유지보수 사항이 <span>0</span>
				개 있습니다</li>
		</ul>
		<ul class="nav navbar-nav ml-auto">
			<li class="nav-item px-3 d-md-down-none"><a class="nav-link"
				href="usermanagement"><i class="fas fa-user-cog"></i> 유저관리</a></li>
			<li class="nav-item px-3 d-md-down-none"><a class="nav-link"
				href="setting"><i class="fas fa-cog"></i> 설정</a></li>
			<li class="nav-item dropdown"><a class="nav-link"
				data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-bell"></i> <span
					class="badge badge-pill badge-danger">5</span>
			</a>
				<div class="dropdown-menu dropdown-menu-right dropdown-menu-lg">
					<div class="dropdown-header text-center">
						<strong>You have 5 notifications</strong>
					</div>
					<a class="dropdown-item" href="#"> <i
						class="icon-user-follow text-success"></i> New user registered
					</a> <a class="dropdown-item" href="#"> <i
						class="icon-user-unfollow text-danger"></i> User deleted
					</a> <a class="dropdown-item" href="#"> <i
						class="icon-chart text-info"></i> Sales report is ready
					</a> <a class="dropdown-item" href="#"> <i
						class="icon-basket-loaded text-primary"></i> New client
					</a> <a class="dropdown-item" href="#"> <i
						class="icon-speedometer text-warning"></i> Server overloaded
					</a>
					<div class="dropdown-header text-center">
						<strong>Server</strong>
					</div>
					<a class="dropdown-item" href="#">
						<div class="text-uppercase mb-1">
							<small> <b>CPU Usage</b>
							</small>
						</div> <span class="progress progress-xs">
							<div class="progress-bar bg-info" role="progressbar"
								style="width: 25%" aria-valuenow="25" aria-valuemin="0"
								aria-valuemax="100"></div>
					</span> <small class="text-muted">348 Processes. 1/4 Cores.</small>
					</a> <a class="dropdown-item" href="#">
						<div class="text-uppercase mb-1">
							<small> <b>Memory Usage</b>
							</small>
						</div> <span class="progress progress-xs">
							<div class="progress-bar bg-warning" role="progressbar"
								style="width: 70%" aria-valuenow="70" aria-valuemin="0"
								aria-valuemax="100"></div>
					</span> <small class="text-muted">11444GB/16384MB</small>
					</a> <a class="dropdown-item" href="#">
						<div class="text-uppercase mb-1">
							<small> <b>SSD 1 Usage</b>
							</small>
						</div> <span class="progress progress-xs">
							<div class="progress-bar bg-danger" role="progressbar"
								style="width: 95%" aria-valuenow="95" aria-valuemin="0"
								aria-valuemax="100"></div>
					</span> <small class="text-muted">243GB/256GB</small>
					</a>
				</div></li>
		</ul>
		<button class="navbar-toggler aside-menu-toggler d-md-down-none"
			type="button" data-toggle="aside-menu-lg-show">
			<span class="navbar-toggler-icon"></span>
		</button>
		<button class="navbar-toggler aside-menu-toggler d-lg-none"
			type="button" data-toggle="aside-menu-show">
			<span class="navbar-toggler-icon"></span>
		</button>
	</header>
	<div class="app-body">
		<div class="sidebar">

			<nav class="sidebar-nav">
				<ul class="nav">
					<li class="nav-item"><a class="nav-link" href="./dashboard">
							<i class="fas fa-tachometer-alt"></i> 대시보드
					</a>
					<li class="nav-item"><a class="nav-link"
						href="requirementation"><i class="fas fa-puzzle-piece"></i>
							유지보수 요구사항 </a></li>

					<li class="nav-title">담당 유지보수 사항</li>
					<li class="nav-item"><a class="nav-link" href="myProceed"><i
							class="fab fa-buffer"></i> 진행중</a></li>
					<li class="nav-item"><a class="nav-link" href="myFinshed"><i
							class="fas fa-bug"></i> 완료</a></li>

					<li class="nav-title">전체 유지보수 사항</li>
					<li class="nav-item"><a class="nav-link" href="allProceed"><i
							class="fab fa-buffer"></i> 진행중</a></li>
					<li class="nav-item"><a class="nav-link" href="allFinshed"><i
							class="fas fa-bug"></i> 완료</a></li>
					<li class="nav-item"><a class="nav-link" href="statistics">
							<i class="fas fa-chart-line"></i> 통계
					</a>
					<li class="nav-title"></li>

					<li class="nav-item"><a class="nav-link"
						href="registerRequire"><i class="fas fa-meteor"></i> 유지보수 사항
							등록 </a></li>
					<li class="nav-title"></li>
					<li class="nav-item nav-dropdown"><a class="nav-link"
						href="newProjects"> <i class="fas fa-briefcase"></i> 프로젝트 신청현황
					</a></li>
					<li class="nav-title"></li>
					<li class="nav-item nav-dropdown"><a class="nav-link"
						href="registerProject"> <i class="far fa-edit"></i> 프로젝트 신청
					</a></li>

					<li class="nav-item mt-auto"><a
						class="nav-link nav-link-success" href="logout"> <i
							class="fas fa-sign-out-alt fa-rotate-180"></i> 로그아웃
					</a></li>
					<li class="nav-title"></li>
				</ul>
			</nav>

		</div>
		<main class="main">

		<ol class="breadcrumb">
			<li class="breadcrumb-item active">진행중</li>
			<li class="breadcrumb-item"><a href="allProjectsEnded">완료</a></li>
			<!-- <li class="breadcrumb-item active">Dashboard</li> -->

			<li class="breadcrumb-menu d-md-down-none">
				<div class="btn-group" role="group" aria-label="Button group">
					<a class="btn" href=""> <i class="icon-graph"></i> <i
						class="far fa-envelope"></i>&nbsp;메모
					</a> <a class="btn" href=""> <i class="icon-settings"></i> <i
						class="far fa-calendar-alt"></i>&nbsp;스케줄
					</a>
				</div>
			</li>
		</ol>
		<div class="container-fluid">
			<div id="ui-view">
				<div>
					<div class="animated fadeIn">

						<div class="row">
							<div class="col-lg-12">
								<div class="card">
									<div class="card-header">
										<i class="fa fa-align-justify"></i> 진행중인 프로젝트
									</div>
									<div class="card-body" style="overflow-x: overlay;">

										내용




										<form id="excelUploadForm" name="excelUploadForm"
											enctype="multipart/form-data" method="post"
											action="${pageContext.request.contextPath}/user/excelUploadAjax">
											<div class="contents">
												<div>첨부파일은 한개만 등록 가능합니다.</div>

												<dl class="vm_name">
													<dt class="down w90">첨부 파일</dt>
													<dd>
														<input id="excelFile" type="file" name="excelFile" />
													</dd>
												</dl>
											</div>

											<div class="bottom">
												<button type="button" id="addExcelImpoartBtn" class="btn"
													onclick="check()">
													<span>추가</span>
												</button>
											</div>
										</form>

										<script type="text/javascript">
											function checkFileType(filePath) {
												var fileFormat = filePath
														.split(".");
												if (fileFormat.indexOf("xlsx") > -1) {
													return true;
												} else {
													return false;
												}

											}

											function check() {
												var file = $("#excelFile")
														.val();
												if (file == "" || file == null) {
													alert("파일을 선택해주세요.");
													return false;
												} else if (!checkFileType(file)) {
													alert("엑셀 파일만 업로드 가능합니다.");
													return false;
												}

												if (confirm("업로드 하시겠습니까?")) {
													var options = {
														success : function(data) {
															alert("모든 데이터가 업로드 되었습니다.");

														},
														type : "POST"
													};
													$("#excelUploadForm")
															.ajaxSubmit(options);

												}
											}

										</script>


									</div>
								</div>
							</div>

						</div>

					</div>
				</div>
			</div>
		</div>
		</main>
		<aside class="aside-menu">
			<!-- <ul class="nav nav-tabs" role="tablist">
				<li class="nav-item"><a class="nav-link active"
					data-toggle="tab" href="#timeline" role="tab"> <i
						class="icon-list"></i>
				</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#messages" role="tab"> <i class="icon-speech"></i>
				</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#settings" role="tab"> <i class="icon-settings"></i>
				</a></li>
			</ul> -->
			<!-- Tab panes-->
			<div class="tab-content">
				<div class="tab-pane active" id="timeline" role="tabpanel">
					<div class="list-group list-group-accent">
						<div
							class="list-group-item list-group-item-accent-secondary bg-light text-center font-weight-bold text-muted">오늘
							할일</div>
						<!-- 		<div
							class="list-group-item list-group-item-accent-warning list-group-item-divider">
							<div class="avatar float-right">
								<img class="img-avatar" src="img/avatars/7.jpg" alt="이미지">
							</div>
							<div>
								Meeting with <strong>Lucas</strong>
							</div>
							<small class="text-muted mr-3"> <i class="icon-calendar"></i> 
								1 - 3pm
							</small> <small class="text-muted"> <i class="icon-location-pin"></i> 
								Palo Alto, CA
							</small>
						</div>
						 -->
						<div class="list-group-item list-group-item-accent-info">
							<!-- 	<div class="avatar float-right">
								<img class="img-avatar" src="img/avatars/4.jpg" alt="이미지">
							</div> -->
							<div>
								Skype with <strong>Megan</strong>
							</div>
							<small class="text-muted mr-3"> <i class="icon-calendar"></i> 
								4 - 5pm
							</small> <small class="text-muted"> <i class="icon-social-skype"></i> 
								On-line
							</small>
						</div>
						<div
							class="list-group-item list-group-item-accent-secondary bg-light text-center font-weight-bold text-muted">이번주
							할일</div>

						<div
							class="list-group-item list-group-item-accent-success list-group-item-divider">
							<div>
								<strong>#10 Startups.Garden</strong> Meetup
							</div>
							<small class="text-muted mr-3"> <i class="icon-calendar"></i> 
								1 - 3pm
							</small> <small class="text-muted"> <i class="icon-location-pin"></i> 
								Palo Alto, CA
							</small>
						</div>
						<div
							class="list-group-item list-group-item-accent-secondary bg-light text-center font-weight-bold text-muted">메모</div>
					</div>
				</div>
			</div>
		</aside>
	</div>
	<%-- 삭제가능 --%>
	<footer class="app-footer">
		<div>
			<!--  <span>2019 Js/Js/Yk</span>-->
		</div>
		<div class="ml-auto">
			<span></span> <span></span>
		</div>
	</footer>
	<!-- CoreUI and necessary plugins-->
	<%-- <script src="node_modules/jquery/dist/jquery.min.js"></script>
    <script src="node_modules/popper.js/dist/umd/popper.min.js"></script>
    <script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="node_modules/pace-progress/pace.min.js"></script>
    <script src="node_modules/perfect-scrollbar/dist/perfect-scrollbar.min.js"></script>
    <script src="node_modules/@coreui/coreui/dist/js/coreui.min.js"></script> --%>
	<!-- Plugins and scripts required by this view-->
	<%-- <script src="node_modules/chart.js/dist/Chart.min.js"></script>
    <script src="node_modules/@coreui/coreui-plugin-chartjs-custom-tooltips/dist/js/custom-tooltips.min.js"></script> --%>
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<%--<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
		integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
		crossorigin="anonymous"></script> --%>
	<script src="https://unpkg.com/@coreui/coreui/dist/js/coreui.min.js"></script>
	<%-- <script src="<%=request.getContextPath() %>/resources/js/jquery.js"></script> --%>
	<%-- <script src="<%=request.getContextPath() %>/resources/js/main.js"></script> --%>
	<%-- <script src="<%=request.getContextPath() %>/resources/js/bootstrap.js"></script> --%>
	<script src="<%=request.getContextPath()%>/resources/js/common.js"></script>

</body>
</html>
