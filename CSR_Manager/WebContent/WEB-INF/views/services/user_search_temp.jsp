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
			<div class="right_col" role="main">
				<div class="">


					<div class="clearfix"></div>

					<div class="row">

						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2></h2>

									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<div class="container-fluid">
										<div id="ui-view">
											<div>
												<div class="animated fadeIn">
													<form method="get" action="./search">
														<div class="row">
															<div class="col-lg-12">
																<div class="card">
																	<div class='card-body'>
																		<div class="row">
																			<div class="form-group col-sm-4">
																				<select class="form-control" name="project_State">
																					<option value=0>진행상태</option>
																					<option value=1>진행중</option>
																					<option value=2>대기</option>
																					<option value=3>마케팅</option>
																					<option value=4>건별</option>

																				</select>
																			</div>
																			<div class="form-group col-sm-4">
																				<select class="form-control" name="project_Scope">
																					<option value=0>계약구분</option>
																					<option value=1>프로젝트</option>
																					<option value=2>유지보수</option>
																					<option value=3>하자보수</option>
																					<option value=4>SM</option>
																					<option value=5>웹 접근성 개선</option>
																					<option value=6>기타</option>
																				</select>
																			</div>
																			<div class="col-sm-4">
																				<div class="form-group">
																					<select class="form-control" name="project_Type">
																						<option value=0>유형</option>
																						<option value=1>싱글</option>
																						<option value=2>외부</option>
																						<option value=3>통합</option>
																						<option value=4>PHP</option>
																						<option value=5>기타</option>
																					</select>
																				</div>
																			</div>
																		</div>
																		=
																		<div class='row'>
																			<div class="input-prepend input-group col-sm-12">
																				<div class="input-group-prepend">
																					<select class="form-control" name="">
																						<option>전체</option>
																						<option>프로젝트</option>
																						<option>고객</option>
																						<option>담당자</option>
																					</select>
																				</div>
																				<input class="form-control" id="prependedInput"
																					size="16" type="text" placeholder=""> <span
																					class="input-group-append"> <input
																					class="btn btn-sm btn-primary" type="submit"
																					style='margin-right: 1.5em;'> <i
																					class="fa fa-search" style="font-size: 0.9em"></i>
																					</button>

																				</span> <span class="input-group-append">
																					<button class="btn btn-sm btn-ghost-success"
																						type="button">
																						<i class="fas fa-plus"></i>
																					</button>
																				</span>
																			</div>




																		</div>
																	</div>
																</div>
															</div>
														</div>
													</form>
													<table
														class="table table-responsive-sm table-bordered table-striped table-sm">
														<thead>
															<tr>
																<th>프로젝트 키</th>
																<th>프로젝트 진행상태</th>
																<th>프로젝트 고객회사</th>
																<th>프로젝트 이름</th>
																<th>프로젝트 유형</th>
																<th>프로젝트 계약구분</th>
																<th>업무 시작일</th>
																<th>업무 종료일</th>
																<th>비고</th>
																<th>PM</th>
																<th>담당자</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${search_list}" var="vo">
																<tr bgcolor="white">
																	<td>${vo.project_Key}</td>
																	<td>${vo.project_State}</td>
																	<td>${vo.project_Company}</td>
																	<td>${vo.project_Name}</td>
																	<td>${vo.project_Type}</td>
																	<td>${vo.project_Scope}</td>
																	<td>${vo.project_Date_Start}</td>
																	<td>${vo.project_Date_End}</td>
																	<td>${vo.project_Remarks}</td>
																	<td>${vo.project_PM}</td>
																	<td>${vo.project_Manager}</td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>



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