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
<!-- iCheck -->
<link
	href="<%=request.getContextPath()%>/resources/gentelella-master/vendors/iCheck/skins/flat/green.css"
	rel="stylesheet">
<!-- Datatables -->
<link
	href="<%=request.getContextPath()%>/resources/gentelella-master/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/gentelella-master/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/gentelella-master/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/gentelella-master/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/gentelella-master/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css"
	rel="stylesheet">

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

			<!-- page content -->

			<div class="right_col" role="main">
				<div class="">
					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>프로젝트 목록</h2>
									<ul class="nav navbar-right panel_toolbox">
										<li><a class="collapse-link"><i
												class="fa fa-chevron-up"></i></a></li>
										
									</ul>
									<div class="clearfix"></div>
								</div>
								<div class="x_content data_table_wrapper">
									<table id="datatable-responsive"
										class="table table-striped table-bordered dt-responsive nowrap"
										cellspacing="0" width="100%">
										<thead>
											<tr>
												<th>프로젝트 이름</th>
												<th>프로젝트 진행상태</th>
												<th>업무 시작일</th>
												<th>업무 종료일</th>
												<th>발주기관</th>
												<th>사업금액</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${proceed_list}" var="vo">
												<tr bgcolor="white">
													<td><a href="./updateProjectForm/${vo.project_Key}"
														style="font-weight: bold;">${vo.project_Name}</a></td>
													<td>진행중</td>
													<td>${vo.project_Date_Start}</td>
													<td>${vo.project_Date_End}</td>
													<td>${vo.project_Company}</td>
													<td>${vo.project_Money}</td>
												</tr>
											</c:forEach>
										</tbody>
										<tfoot>
											<tr>
												<th>프로젝트 이름</th>
												<th>프로젝트 진행상태</th>
												<th>업무 시작일</th>
												<th>업무 종료일</th>
												<th>프로젝트 고객회사</th>
												<th>금액</th>
											</tr>
										</tfoot>
									</table>


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
	<!-- iCheck -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/iCheck/icheck.min.js"></script>
	<!-- Datatables -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/jszip/dist/jszip.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/pdfmake/build/pdfmake.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/pdfmake/build/vfs_fonts.js"></script>

	<!-- Custom Theme Scripts -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/build/js/custom.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/common.js"></script>
</body>
</html>