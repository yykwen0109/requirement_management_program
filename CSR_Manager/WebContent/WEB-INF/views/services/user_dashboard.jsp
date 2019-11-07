
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

<!-- bootstrap-progressbar -->
<link
	href="<%=request.getContextPath()%>/resources/gentelella-master/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet">
<!-- JQVMap -->
<link
	href="<%=request.getContextPath()%>/resources/gentelella-master/vendors/jqvmap/dist/jqvmap.min.css"
	rel="stylesheet" />
<!-- bootstrap-daterangepicker -->
<link
	href="<%=request.getContextPath()%>/resources/gentelella-master/vendors/bootstrap-daterangepicker/daterangepicker.css"
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

<!-- bootstrap-datetimepicker -->
<link
	href="<%=request.getContextPath()%>/resources/gentelella-master/vendors/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.css"
	rel="stylesheet">
<style type="text/css">
.collapse-link>i, .table-link>i, .chart-link>i {
	font-size: 1.5em;
}

.table-content {
	display: none;
}
</style>
</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<jsp:include page="${request.contextPath}/modul_sidebar"></jsp:include>
			<jsp:include page="${request.contextPath}/modul_top_navi"></jsp:include>
			<!-- page content -->
			<div class="right_col" role="main">

				<!--마감 7일 이내 CSR  -->
				<div class="row">
					<!--마감 7일 이내 전체 CSR  -->
					<div class="col-md-6 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="x_title">
								<h2>마감 7일 이내 전체 유지보수 사항</h2>
								<ul class="nav navbar-right panel_toolbox">
									<li><a class="collapse-link"><i
											class="fa fa-chevron-up"></i></a></li>
								</ul>
								<div class="clearfix"></div>
							</div>
							<div class="x_content data_table_wrapper">
								<table id="Below_7_Request_List"
									class="table table-striped table-bordered dt-responsive nowrap"
									cellspacing="0" width="100%">
									<thead>
										<tr>
											<th>프로젝트명</th>
											<th>유지보수</th>
											<th>마감일</th>
											<th>작업상태</th>
											<th>진행율</th>
											<th>남은 기한</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${Below_7_Request_List}" var="vo">
											<tr bgcolor="white" class="deadline_request_all">
												<td><c:forEach items="${projectList}" var="e">
														<c:if test="${vo.project_Key == e.project_Key}">
																		${e.project_Name}
																	</c:if>
													</c:forEach></td>
												<td><input type="hidden" name="request_Key"
													value="${vo.request_Key}" /> <a
													href="./updateRequestForm/${vo.request_Key}"
													style="font-weight: bold;">${vo.request_Title}</a></td>
												<td class="deadline">${vo.request_Date_End}</td>
												<td><button type='button' class="state">${vo.request_State}</button></td>
												<td class="deadline_progress">${vo.request_Progress}%</td>
												<td class="time_for_deadline"></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- 마감 7일 이내 전체 CSR 끝  -->

					<!-- 마감 7일 이내 담당 CSR -->
					<div class="col-md-6 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="x_title">
								<h2>마감 7일 이내 담당 유지보수 사항</h2>
								<ul class="nav navbar-right panel_toolbox">
									<li><a class="collapse-link"><i
											class="fa fa-chevron-up"></i></a></li>

								</ul>
								<div class="clearfix"></div>
							</div>
							<div class="x_content data_table_wrapper">
								<table id="Below_7_Request_List_By_Employee"
									class="table table-striped table-bordered dt-responsive nowrap"
									cellspacing="0" width="100%">
									<thead>
										<tr>
											<th>프로젝트명</th>
											<th>유지보수</th>
											<th>마감일</th>
											<th>작업상태</th>
											<th>진행율</th>
											<th>남은 기한</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${Below_7_Request_List_By_Employee}"
											var="vo">
											<tr bgcolor="white" class="deadline_request_all">
												<td><c:forEach items="${projectList}" var="e">
														<c:if test="${vo.project_Key == e.project_Key}">
																		${e.project_Name}
																	</c:if>
													</c:forEach></td>
												<td><input type="hidden" name="request_Key"
													value="${vo.request_Key}" /> <a
													href="./updateRequestForm/${vo.request_Key}"
													style="font-weight: bold;">${vo.request_Title}</a></td>
												<td class="deadline">${vo.request_Date_End}</td>
												<td><button type='button' class="state">${vo.request_State}</button></td>
												<td class="deadline_progress">${vo.request_Progress}%</td>
												<td class="time_for_deadline"></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>


							</div>
						</div>
					</div>
					<!-- 마감 7일 이내 담당 CSR 끝-->
				</div>
				<!-- 마감 7일 이내  끝 -->

				<!-- 최근 30일 이내 신청 건수  -->
				<div class="row">
					<!-- 최근 30일 이내 프로젝트 신청 건수  -->
					<div class="col-md-6 col-sm-12 col-xs-12">
						<div class="dashboard_graph x_panel">

							<div class="row x_title">
								<div class="col-md-6">
									<h3>프로젝트 월간 그래프</h3>
								</div>
								<div class="col-md-6">
									<ul class="nav navbar-right panel_toolbox">
										<li><a class="collapse-link"><i
												class="fa fa-chevron-up"></i></a></li>
										<li><a class="table-link"><i class="fa fa-table"></i>
										</a></li>

										<li><a class="chart-link"><i
												class="fa fa-bar-chart-o"></i></a></li>
									</ul>
								</div>
							</div>
							<div class="x_content ">
								<div class="col-md-12 col-sm-12 col-xs-12 chart-content">
									<div class="demo-container" style="height: 280px">
										<div id="chart_plot_02" class="demo-placeholder"></div>
									</div>

								</div>

								<div class="table-content form-horizontal form-label-left">
									<div class="form-group">
										<label class="control-label col-md-2 col-sm-2 col-xs-5">
											시작일자</label>
										<div class='col-md-3 col-sm-3 col-xs-5'>
											<div class='input-group date' id='date_start_for_project'>
												<input type='text' name="date_start_for_project"
													id="date_start_input_for_project" class="form-control"
													value="" /> <span class="input-group-addon"> <span
													class="glyphicon glyphicon-calendar"></span>
												</span>
											</div>
										</div>
										<label class="control-label col-md-2 col-sm-2 col-xs-5">
											종료일자</label>
										<div class='col-md-3 col-sm-3 col-xs-5'>
											<div class='input-group date' id='date_end_for_project'>
												<input type='text' name="date_end_for_project"
													id="date_end_input_for_project" class="form-control"
													value="" /> <span class="input-group-addon"> <span
													class="glyphicon glyphicon-calendar"></span>
												</span>
											</div>

										</div>


										<input type="button" style="max-width: 50px"
											class="btn btn-info  col-md-2 col-sm-2 col-xs-2" value="검색"
											onclick="changeDate_range_project()">
									</div>
									<!-- start project list -->
									<table
										class="table table-striped table-bordered dt-responsive nowrap"
										cellspacing="0" id="recent_30_project" width="100%">
										<thead>
											<tr>
												<th style="width: 20%">등록날짜</th>
												<th style="width: 20%">프로젝트 개수</th>
											</tr>
										</thead>
										<tbody id="tbody_for_project_by_date_range">
											<!-- 동적 생성 -->
										</tbody>
									</table>
								</div>

							</div>


						</div>




					</div>
					<!-- 최근 30일 이내 프로젝트 신청 건수 끝 -->

					<!-- 최근 30일 이내 CSR 신청 건수  -->
					<div class="col-md-6 col-sm-12 col-xs-12">
						<div class="dashboard_graph x_panel">

							<div class="row x_title">
								<div class="col-md-6">
									<h3>유지보수 월간 그래프</h3>
								</div>
								<div class="col-md-6">
									<ul class="nav navbar-right panel_toolbox">
										<li><a class="collapse-link"><i
												class="fa fa-chevron-up"></i></a></li>
										<li><a class="table-link"><i class="fa fa-table"></i>
										</a></li>

										<li><a class="chart-link"><i
												class="fa fa-bar-chart-o"></i></a></li>
									</ul>
								</div>
							</div>
							<div class="x_content ">
								<div class="col-md-12 col-sm-12 col-xs-12 chart-content">
									<div class="demo-container" style="height: 280px">
										<div id="CSR_per_month" class="demo-placeholder"></div>
									</div>

								</div>

								<div class="table-content form-horizontal form-label-left">
									<div class="form-group">
										<label class="control-label col-md-2 col-sm-2 col-xs-5">
											시작일자</label>
										<div class='col-md-3 col-sm-3 col-xs-5'>
											<div class='input-group date' id='date_start_for_request'>
												<input type='text' name="date_start_for_request"
													id="date_start_input_for_request" class="form-control"
													value="" /> <span class="input-group-addon"> <span
													class="glyphicon glyphicon-calendar"></span>
												</span>
											</div>
										</div>
										<label class="control-label col-md-2 col-sm-2 col-xs-5">
											종료일자</label>
										<div class='col-md-3 col-sm-3 col-xs-5'>
											<div class='input-group date' id='date_end_for_request'>
												<input type='text' name="date_end_for_request"
													id="date_end_input_for_request" class="form-control"
													value="" /> <span class="input-group-addon"> <span
													class="glyphicon glyphicon-calendar"></span>
												</span>
											</div>

										</div>
										<input type="button" style="max-width: 50px"
											class="btn btn-info  col-md-2 col-sm-2 col-xs-2" value="검색"
											onclick="changeDate_range_request()">
									</div>
									<!-- start project list -->
									<table
										class="table table-striped table-bordered dt-responsive nowrap"
										cellspacing="0" id="recent_30_CSR" width="100%">
										<thead>
											<tr>
												<th style="width: 20%">등록날짜</th>
												<th style="width: 20%">유지보수 사항 개수</th>
											</tr>
										</thead>
										<tbody id="tbody_for_request_by_date_range">
											<!-- 동적 생성 -->
										</tbody>
									</table>
								</div>

							</div>
						</div>
					</div>

					<!-- 최근 30일 이내 CSR 신청 건수 끝 -->
				</div>

				<!-- 최근 30일 이내 신청 건수  끝-->

				<!-- 분기별 신청 건수 -->
				<div class="row">
					<!-- 분기별 프로젝트 신청 건수 -->
					<div class="col-md-6 col-sm-12 col-xs-12">
						<div class="dashboard_graph x_panel">

							<div class="row x_title">
								<div class="col-md-6">
									<h3>프로젝트 분기 그래프</h3>
								</div>
								<div class="col-md-6">
									<ul class="nav navbar-right panel_toolbox">
										<li><a class="collapse-link"><i
												class="fa fa-chevron-up"></i></a></li>
										<li><a class="table-link"><i class="fa fa-table"></i>
										</a></li>

										<li><a class="chart-link"><i
												class="fa fa-bar-chart-o"></i></a></li>
									</ul>
								</div>
							</div>
							<div class="x_content">
								<div class="col-md-12 col-sm-12 col-xs-12 chart-content">
									<div id="chart_plot_01" class="demo-placeholder"></div>
								</div>


								<div class="table-content">
									<div class="form-group">
										<div class="col-md-3 col-sm-3 col-xs-12">
											<select class="form-control" id="quarter_project_select_year"
												onchange="quarter_project_select_control()">
												<option value="2019">2019년</option>
											</select>
										</div>

										<div class="col-md-3 col-sm-3 col-xs-12">
											<select class="form-control" id="quarter_project_select"
												onchange="quarter_project_select_control()">
												<option value="1">1분기</option>
												<option value="2">2분기</option>
												<option value="3">3분기</option>
												<option value="4">4분기</option>
											</select>
										</div>
									</div>

									<!-- start project list -->
									<table
										class="table table-striped table-bordered dt-responsive nowrap"
										cellspacing="0" id="quarter_project_table" width="100%">
										<thead>
											<tr>
												<th style="width: 20%">등록날짜</th>
												<th style="width: 20%">프로젝트 개수</th>
											</tr>
										</thead>
										<tbody id="tbody_for_project_by_date_range_quarter">
											<!-- 동적 생성 -->
										</tbody>
									</table>
								</div>



								<div class="clearfix"></div>
							</div>
						</div>

					</div>
					<!-- 분기별 프로젝트 신청 건수 끝-->
					<!-- 분기별 CSR 신청 건수 -->
					<div class="col-md-6 col-sm-12 col-xs-12">
						<div class="dashboard_graph  x_panel">

							<div class="row x_title">
								<div class="col-md-6">
									<h3>CSR 분기 그래프</h3>
								</div>
								<div class="col-md-6">
									<ul class="nav navbar-right panel_toolbox">
										<li><a class="collapse-link"><i
												class="fa fa-chevron-up"></i></a></li>
										<li><a class="table-link"><i class="fa fa-table"></i>
										</a></li>

										<li><a class="chart-link"><i
												class="fa fa-bar-chart-o"></i></a></li>
									</ul>
								</div>
							</div>
							<div class="x_content ">
								<div class="col-md-12 col-sm-12 col-xs-12 chart-content">
									<div id="CSR_per_quarter" class="demo-placeholder"></div>
								</div>


								<div class="table-content">
									<div class="form-group">
										<div class="col-md-3 col-sm-3 col-xs-12">
											<select class="form-control" id="quarter_csr_select_year"
												onchange="quarter_csr_select_control()">
												<option value="2019">2019년</option>
											</select>
										</div>

										<div class="col-md-3 col-sm-3 col-xs-12">
											<select class="form-control" id="quarter_csr_select"
												onchange="quarter_csr_select_control()">
												<option value="1">1분기</option>
												<option value="2">2분기</option>
												<option value="3">3분기</option>
												<option value="4">4분기</option>
											</select>
										</div>
									</div>
									<!-- start project list -->
									<table
										class="table table-striped table-bordered dt-responsive nowrap"
										cellspacing="0" id="quarter_CSR_table" width="100%">
										<thead>
											<tr>
												<th style="width: 20%">등록날짜</th>
												<th style="width: 20%">유지보수 사항 개수</th>
											</tr>
										</thead>
										<tbody id="tbody_for_request_by_date_range_quarter">
											<!-- 동적 생성 -->
										</tbody>
									</table>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
					<!-- 분기별 CSR 신청 건수 -->
				</div>
				<!-- 분기별 신청 건수 끝-->
				<br />
				<div class="row">

				<!-- 프로젝트 별 CSR 신청 건수 -->
				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="x_panel">
						<div class="x_title">
							<h2>프로젝트별 유지보수</h2>

							<div class="col-md-5" style="float:right">
								<ul class="nav navbar-right panel_toolbox">
									<li><a class="collapse-link"><i
											class="fa fa-chevron-up"></i></a></li>
									<li><a class="table-link"><i class="fa fa-table"></i>
									</a></li>

									<li><a class="chart-link"><i class="fa fa-bar-chart-o"></i></a></li>
								</ul>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="x_content ">
							<div class="chart-content">
								<canvas class="CSR_per_project"></canvas>
							</div>
							<div class="table-content">

								<!-- start project list -->
								<table
									class="table table-striped table-bordered dt-responsive nowrap"
									cellspacing="0" id="CSR_per_project_table" width="100%">
									<thead>
										<tr>
											<th style="width: 20%">프로젝트 명</th>
											<th style="width: 20%">개수</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${count_request_by_project}" var="crbp">
											<tr>
												<c:forEach items="${projectList}" var="e">
													<c:if test="${crbp.project_key == e.project_Key}">
														<td class="csr_per_project_name">${e.project_Name}</td>
													</c:if>
												</c:forEach>
												<td class="csr_per_project_count">${crbp.count}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!-- 프로젝트 별 CSR 신청 건수 끝-->
				<!-- 직원 별 CSR 신청 건수 -->
				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="x_panel">
						<div class="x_title">
							<h2>작업자별 유지보수</h2>

							<div class="col-md-5" style="float:right">
								<ul class="nav navbar-right panel_toolbox">
									<li><a class="collapse-link"><i
											class="fa fa-chevron-up"></i></a></li>
									<li><a class="table-link"><i class="fa fa-table"></i>
									</a></li>

									<li><a class="chart-link"><i class="fa fa-bar-chart-o"></i></a></li>
								</ul>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="x_content ">
							<div class="chart-content">


								<canvas class="CSR_per_person"></canvas>

							</div>
							<div class="table-content">
								<!-- start project list -->
								<table
									class="table table-striped table-bordered dt-responsive nowrap"
									cellspacing="0" id="CSR_per_person_table" width="100%">
									<thead>
										<tr>
											<th style="width: 20%">직원이름</th>
											<th style="width: 20%">개수</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${count_request_by_employee}" var="crbe">
											<tr>
												<c:forEach items="${employee_list}" var="e">
													<c:if test="${crbe.employee_key == e.employee_key}">
														<td class="csr_per_person_name">${e.employee_name}</td>
													</c:if>
												</c:forEach>
												<td class="csr_per_person_count">${crbe.count}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!-- 직원 별 CSR 신청 건수 끝 -->



				<!-- CSR 별 투입시간-->
				<div class="col-md-6 col-sm-12 col-xs-12">
					<div class="x_panel">
						<div class="x_title">
							<h2>프로젝트-유지보수 투입시간</h2>

							<div class="col-md-8" style="float:right">
								<ul class="nav navbar-right panel_toolbox">
									<li><a class="collapse-link"><i
											class="fa fa-chevron-up"></i></a></li>
									<li><a class="table-link"><i class="fa fa-table"></i>
									</a></li>

									<li><a class="chart-link"><i class="fa fa-bar-chart-o"></i></a></li>
								</ul>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="x_content">
							<div class="chart-content">
								<canvas id="mybarChart"></canvas>
							</div>
							<div class="table-content">
								<table
									class="table table-striped table-bordered dt-responsive nowrap"
									cellspacing="0" id="CSR_per_project_injection_time"
									width="100%">
									<thead>
										<tr>
											<th style="width: 20%">프로젝트이름</th>
											<th style="width: 20%">CSR이름</th>
											<th style="width: 20%">투입시간</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach items="${full_request_list}" var="list">
											<tr>
												<c:forEach items="${projectList}" var="e">
													<c:if test="${list.project_Key == e.project_Key}">
														<td class="injection_time_project_name">${e.project_Name}</td>
													</c:if>
												</c:forEach>
												<td class="injection_time_CSR_name">${list.request_Title}</td>
												<td class="injection_time">${list.request_Work_Time}</td>
											</tr>
										</c:forEach>


									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!-- CSR 별 투입시간 끝-->
				</div>
				<!-- CSR summary-->
				<div class="row">
					<div class="col-md-12">
						<div class="x_panel">
							<div class="x_title">
								<h2>유지보수 사항 요약</h2>
								<ul class="nav navbar-right panel_toolbox">
									<li><a class="collapse-link"><i
											class="fa fa-chevron-up"></i></a></li>
								</ul>
								<div class="clearfix"></div>
							</div>

							<div class="x_content data_table_wrapper">
								<!-- start project list -->

								<table id="my_CSR_summary"
									class="table table-striped table-bordered dt-responsive nowrap projects"
									cellspacing="0" width="100%">
									<thead>
										<tr>
											<th style="width: 1%">PMS</th>
											<th style="width: 20%">프로젝트 명</th>
											<th style="width: 20%">CSR 명</th>
											<th>담당자</th>
											<th>진행율</th>
											<th>작업상태</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${list}" var="vo">
											<tr>
												<td>${vo.request_Key}</td>
												<td><c:forEach items="${projectList}" var="e">
														<c:if test="${vo.project_Key == e.project_Key}">
																		${e.project_Name}
																	</c:if>
													</c:forEach></td>
												<td><a>${vo.request_Title}</a> <br /> <small>${vo.request_Date_Upload}</small></td>

												<!-- 유지보수 사항 작업자 이름, 직책 -->
												<td>
													<ul class="list-inline">
														<c:set var="list_name"
															value="worker_list_${vo.request_Key}" />
														<c:forEach items="${requestScope[list_name]}" var="worker">

															<span
																style="border: 1px solid skyblue; border-radius: 5px; background-color: skyblue; font-size: 1.1em; color: white; padding-top: 3px; padding-bottom: 3px;">${worker.employee_name}:${worker.employee_job}</span>

														</c:forEach>
													</ul>
												</td>
												<td class="project_progress">
													<div class="progress progress_sm">
														<div class="progress-bar bg-green" role="progressbar"
															data-transitiongoal="${vo.request_Progress}"></div>
													</div> <small>${vo.request_Progress}% Complete</small>
												</td>
												<td>
													<button type="button" class="btn btn-success btn-xs">${vo.request_State}</button>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<!-- end project list -->

							</div>
						</div>
					</div>
					<!-- CSR summary 끝-->

									</div>




				<!-- 	<div>
					<div class="x_content">

						<p>SALMON : 날짜별 프로젝트 추가 개수 테이블 in dashboard</p>
						<label class="control-label col-md-2 col-sm-3 col-xs-12">
							시작일자</label>
						<div class='col-md-9 col-sm-9 col-xs-12'>
							<div class='input-group date' id='date_for_project'>
								<input type='text' name="date_for_project"
									id="date_input_for_project" class="form-control" value="" /> <span
									class="input-group-addon"> <span
									class="glyphicon glyphicon-calendar"></span>
								</span>
							</div>
							<input type="button" value="검색" onclick="changeDate_project()" />
						</div>
						start project list
						<table class="table table-striped projects">
							<thead>
								<tr>
									<th style="width: 20%">등록날짜</th>
									<th style="width: 20%">프로젝트 개수</th>
								</tr>
							</thead>
							<tbody id="tbody_for_project_by_date">
								동적 생성
							</tbody>
						</table>
					</div>

					<div class="x_content">

						<p>SALMON : 날짜별 CSR 추가 개수 테이블 in dashboard</p>
						<label class="control-label col-md-2 col-sm-3 col-xs-12">
							시작일자</label>
						<div class='col-md-9 col-sm-9 col-xs-12'>
							<div class='input-group date' id='date_for_request'>
								<input type='text' name="date_for_project"
									id="date_input_for_request" class="form-control" value="" /> <span
									class="input-group-addon"> <span
									class="glyphicon glyphicon-calendar"></span>
								</span>
							</div>
							<input type="button" value="검색" onclick="changeDate_request()" />
						</div>
						start project list
						<table class="table table-striped projects">
							<thead>
								<tr>
									<th style="width: 20%">등록날짜</th>
									<th style="width: 20%">CSR 개수</th>
								</tr>
							</thead>
							<tbody id="tbody_for_request_by_date">
								동적 생성
							</tbody>
						</table>
					</div>



				</div>
			 -->

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
	<!-- bootstrap-progressbar -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<!-- FastClick -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/fastclick/lib/fastclick.js"></script>
	<!-- NProgress -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/nprogress/nprogress.js"></script>
	<!-- Chart.js -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/Chart.js/dist/Chart.min.js"></script>
	<!-- gauge.js -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/gauge.js/dist/gauge.min.js"></script>
	<!-- bootstrap-progressbar -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<!-- iCheck -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/iCheck/icheck.min.js"></script>
	<!-- Skycons -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/skycons/skycons.js"></script>
	<!-- Flot -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/Flot/jquery.flot.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/Flot/jquery.flot.pie.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/Flot/jquery.flot.time.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/Flot/jquery.flot.stack.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/Flot/jquery.flot.resize.js"></script>
	<!-- Flot plugins -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/flot.curvedlines/curvedLines.js"></script>
	<!-- DateJS -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/DateJS/build/date.js"></script>
	<!-- JQVMap -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/jqvmap/dist/jquery.vmap.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
	<!-- bootstrap-daterangepicker -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/moment/min/moment.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
	<!-- ECharts -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/echarts/dist/echarts.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/echarts/map/js/world.js"></script>
	<!-- ECharts -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/echarts/dist/echarts.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/echarts/map/js/world.js"></script>
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

	<!-- bootstrap-datetimepicker -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>

	<script src="<%=request.getContextPath()%>/resources/js/common.js"></script>
	<!-- 초기 그래프를 그리기 위한 세팅 -->
	<script>$(document).ready(function() {
		for(var i =0;i<$('.state').size();i++){
			if($('.state').eq(i).text() == '진행')
				$('.state').eq(i).addClass('btn btn-success btn-xs');
			else if($('.state').eq(i).text() == '완료')
				$('.state').eq(i).addClass('btn btn-primary btn-xs');
		}
		var date_start = new Date().add(-30).days()
		var date_end = new Date();
		
		$("#tbody_for_request_by_date_range").html("");
		
		<c:forEach items="${count_request_by_date}" var="crbd">		
			var date = new Date('${crbd.request_date_upload}');
			var a = $("<tr></tr>");
			
			if(date_start <= date && date_end >= date){
				// 동적 코드 생성		
				a.append("<td class='csr_per_days_day'>" + date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate() + "</td>");	
				a.append("<td class='csr_per_days_count'>" + "${crbd.count}" + "</td>");	
			}
			
			if(a.html() != '')
			$("#tbody_for_request_by_date_range").append(a);
			
		</c:forEach>
	
		$("#tbody_for_project_by_date_range").html("");
	
		<c:forEach items="${count_project_by_date}" var="cpbd">		
			var date = new Date('${cpbd.project_date_start}');
			
			var a = $("<tr></tr>");
			
			if(date_start <= date && date_end >= date){
				// 동적 코드 생성		
				a.append("<td class='project_per_days_day'>" + date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate() + "</td>");	
				a.append("<td class='project_per_days_count'>" + "${cpbd.count}" + "</td>");	
			}
			
			if(a.html() != '')
			$("#tbody_for_project_by_date_range").append(a);
			
		</c:forEach>
		
		
		var current_date = new Date()
		var quarter = getQuarter(current_date.getFullYear(),current_date);
		$("#quarter_project_select_year").val(current_date.getFullYear()).attr("selected", "selected");
		$("#quarter_project_select").val(quarter[0]).attr("selected", "selected");
		
		
		$("#tbody_for_project_by_date_range_quarter").html("");
	
		<c:forEach items="${count_project_by_date}" var="cpbd">		
			var date = new Date('${cpbd.project_date_start}');
	
			var a = $("<tr></tr>");
			
			if(new Date(quarter[1]) <= date &&new Date(quarter[2]) >= date){
				// 동적 코드 생성		
				a.append("<td class='quarter_project_table_day'>" + date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate() + "</td>");	
				a.append("<td class='quarter_project_table_count'>" + "${cpbd.count}" + "</td>");	
			}
			
			if(a.html() != '')
			$("#tbody_for_project_by_date_range_quarter").append(a);
			
		</c:forEach>
		
		$("#quarter_csr_select_year").val(current_date.getFullYear()).attr("selected", "selected");
		$("#quarter_csr_select").val(quarter[0]).attr("selected", "selected");
		
		$("#tbody_for_request_by_date_range_quarter").html("");
		
		<c:forEach items="${count_request_by_date}" var="crbd">		
			var date = new Date('${crbd.request_date_upload}');
			var a = $("<tr></tr>");
			
			if(new Date(quarter[1]) <= date && new Date(quarter[2]) >= date){
				// 동적 코드 생성		
				a.append("<td class='quarter_CSR_table_day'>" + date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate() + "</td>");	
				a.append("<td class='quarter_CSR_table_count'>" + "${crbd.count}" + "</td>");	
			}
			if(a.html() != '')
			$("#tbody_for_request_by_date_range_quarter").append(a);
		</c:forEach>
		
		
		
		
		var current_date = new Date();
		$('.time_for_deadline').each(function(){
			var deadline_date =new Date($(this).closest('.deadline_request_all').find('.deadline').html())
			$(this).html(deadline_date.getDate()-current_date.getDate())	
		});
		
	});
	function getQuarter(year,full_date){
		var quarter=0;
		var date_start,date_end;
		if(new Date(year+"-01-01")<=full_date && new Date(year+"-03-31") >= full_date){
			quarter=1;
			date_start = year+"-01-01";
			date_end = year+"-03-31";
		}
		if(new Date(year+"-04-01")<=full_date &&new Date(year+"-06-30") >= full_date){
			quarter=2;
			date_start = year+"-04-01";
			date_end = year+"-06-30";
		}
		if(new Date(year+"-07-01")<=full_date && new Date(year+"-09-30") >= full_date){
			quarter=3;
			date_start = year+"-07-01";
			date_end = year+"-09-30";
		}
		if(new Date(year+"-10-01")<=full_date &&new Date(year+"-12-31") >= full_date){
			quarter=4;
			date_start = year+"-10-01";
			date_end = year+"-12-31";
		}
		return [quarter,date_start,date_end];
	};
	
	function dateDiff(_date1, _date2) {
	    var betweenDay = (new Date(_date2).getTime() - new Date(_date1).getTime())/1000/60/60/24;  
	    return betweenDay;
	};

	</script>
	<!-- 초기 그래프를 그리기 위한 세팅 끝-->


	<!-- Custom Theme Scripts -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/build/js/custom.js"></script>


	<!-- 기간별 분기별 그래프  동적 변경-->
	<script type="text/javascript">
		function changeDate_project(){		
			var date = "2019-01-01";
			$("#tbody_for_project_by_date").html("");
			
			<c:forEach items="${count_project_by_date}" var="cpbd">
				date = '${cpbd.project_date_start}';
				
				var a = $("<tr></tr>");
				
				if($('#date_input_for_project').val() == date){
					// 동적 코드 생성
					
					a.append("<td>" + date + "</td>");	
					a.append("<td>" + "${cpbd.count}" + "</td>");	
					
				}
				if(a.html() != '')
				$("#tbody_for_project_by_date").append(a);
				
			</c:forEach>
		}
		
		function changeDate_request(){		
			
			var date = "2019-01-01";
			$("#tbody_for_request_by_date").html("");
			
			<c:forEach items="${count_request_by_date}" var="crbd">
				date = '${crbd.request_date_upload}';
				
				var a = $("<tr></tr>");
				
				if($('#date_input_for_request').val() == date){
					// 동적 코드 생성
					a.append("<td>" + date + "</td>");	
					a.append("<td>" + "${crbd.count}" + "</td>");	
				}
				if(a.html() != '')
				$("#tbody_for_request_by_date").append(a);
				
			</c:forEach>
		}
		/* -------------------------------기간별 그래프 */
		function changeDate_range_project(){		
			$('#recent_30_project').DataTable().destroy();
			$("#tbody_for_project_by_date_range").html("");
			var date_start;
			var date_end;
			
			<c:forEach items="${count_project_by_date}" var="cpbd">		
				var date = new Date('${cpbd.project_date_start}');
				date_start = new Date($('#date_start_input_for_project').val());
				date_end = new Date($('#date_end_input_for_project').val());
				
				var a = $("<tr></tr>");
				
				if(date_start <= date && date_end >= date){
					// 동적 코드 생성		
					a.append("<td class='project_per_days_day'>" + date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate() + "</td>");	
					a.append("<td class='project_per_days_count'>" + "${cpbd.count}" + "</td>");	
				}
				
				if(a.html() != '')
				$("#tbody_for_project_by_date_range").append(a);
				
			</c:forEach>
			$('#chart_plot_02').html();
			$('#chart_plot_02').empty();
			change_project_range(dateDiff(date_start,date_end),date_end);
			
		}
		
		function changeDate_range_request(){		
			$('#recent_30_CSR').DataTable().destroy();
			$("#tbody_for_request_by_date_range").html("");
			var date_start;
			var date_end;
			
			
			
			<c:forEach items="${count_request_by_date}" var="crbd">		
				var date = new Date('${crbd.request_date_upload}');
				date_start = new Date($('#date_start_input_for_request').val());
				date_end = new Date($('#date_end_input_for_request').val());
				
				var a = $("<tr></tr>");
				
				if(date_start <= date && date_end >= date){
					// 동적 코드 생성		
					a.append("<td class='csr_per_days_day'>" + date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate() + "</td>");	
					a.append("<td class='csr_per_days_day'>" + "${crbd.count}" + "</td>");	
				}
				
				if(a.html() != '')
				$("#tbody_for_request_by_date_range").append(a);
				
			</c:forEach>
			
			$('#CSR_per_month').html();
			$('#CSR_per_month').empty();
			change_csr_range(dateDiff(date_start,date_end),date_end);
		}
		/* 기간별 그래프 끝----------------*/
		
		/* --------------------분기별 그래프*/
		
		function quarter_switch(year,quarter){
			
			var start_end_date;
			
			switch (quarter) {
			case "1":
				start_end_date = [new Date(year+"-01-01"),new Date(year+"-03-31")];
				break;
			case "2":
				start_end_date = [new Date(year+"-04-01"),new Date(year+"-06-30")];
				break;
			case "3":
				start_end_date = [new Date(year+"-07-01"),new Date(year+"-09-30")];
				break;
			case "4":
				start_end_date = [new Date(year+"-10-01"),new Date(year+"-12-31")];
				break;
			}
			return start_end_date;
		}
		
		function quarter_project_select_control(){	
			
			var date_array = quarter_switch($('#quarter_project_select_year option:selected').val(),$('#quarter_project_select option:selected').val());
			
			date_start = date_array[0];
			date_end = date_array[1];
			
			$('#quarter_project_table').DataTable().destroy();
			$("#tbody_for_project_by_date_range_quarter").html("");
		
			<c:forEach items="${count_project_by_date}" var="cpbd">		
				var date = new Date('${cpbd.project_date_start}');
				
				
				var a = $("<tr></tr>");
				
				if(date_start <= date && date_end >= date){
					// 동적 코드 생성		
					a.append("<td class='quarter_project_table_day'>" + date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate() + "</td>");	
					a.append("<td class='quarter_project_table_count'>" + "${cpbd.count}" + "</td>");	
				}
				
				if(a.html() != '')
				$("#tbody_for_project_by_date_range_quarter").append(a);
				
			</c:forEach>
				
				$('#chart_plot_01').html();
				$('#chart_plot_01').empty();
				
				change_quarter_project("프로젝트 신청 수",'quarter_project_table',"#chart_plot_01",1,date_start,dateDiff(date_start,date_end));
			
			
		}
		
		function quarter_csr_select_control(){		
			var date_array = quarter_switch($('#quarter_csr_select_year option:selected').val(),$('#quarter_csr_select option:selected').val());
			
			date_start = date_array[0];
			date_end = date_array[1];
			
			
			$('#quarter_CSR_table').DataTable().destroy();
			
			$("#tbody_for_request_by_date_range_quarter").html("");
		
			<c:forEach items="${count_request_by_date}" var="crbd">		
				var date = new Date('${crbd.request_date_upload}');
				var a = $("<tr></tr>");
			
				if(new Date(date_start) <= date && new Date(date_end) >= date){
				// 동적 코드 생성		
					a.append("<td class='quarter_CSR_table_day'>" + date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate() + "</td>");	
					a.append("<td class='quarter_CSR_table_count'>" + "${crbd.count}" + "</td>");	
				}
				if(a.html() != '')
					$("#tbody_for_request_by_date_range_quarter").append(a);
			</c:forEach>
				
				$('#CSR_per_quarter').html();
				$('#CSR_per_quarter').empty();
				
				change_quarter_project("프로젝트 신청 수",'quarter_CSR_table',"#CSR_per_quarter",30,date_start,dateDiff(date_start,date_end));
			
		}
		/* 분기별 그래프 끝*/
		</script>

		<script>
			$('#myDatepicker').datetimepicker();
	
			$('#date_for_project').datetimepicker({
				format : 'YYYY-MM-DD'
			});
			$('#date_for_request').datetimepicker({
				format : 'YYYY-MM-DD'
			});
			$('#date_start_for_project').datetimepicker({
				format : 'YYYY-MM-DD'
			});
			$('#date_end_for_project').datetimepicker({
				format : 'YYYY-MM-DD'
			});
			
			$('#date_start_for_request').datetimepicker({
				format : 'YYYY-MM-DD'
			});
			$('#date_end_for_request').datetimepicker({
				format : 'YYYY-MM-DD'
			});
			
			$('#myDatepicker2_2').datetimepicker({
				format : 'YYYY-MM-DD'
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
