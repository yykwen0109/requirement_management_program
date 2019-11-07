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

<title>Gentelella Alela! |</title>

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
						<div class="col-md-6 col-xs-9 container">
							<div class="x_panel">
								<div class="x_title">
									<h2>
										CSR 등록 <small></small>
									</h2>
									<ul class="nav navbar-right panel_toolbox">
										<li><a class="collapse-link"><i
												class="fa fa-chevron-up"></i></a></li>

									</ul>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<br />
									<form id="mainForm" class="form-horizontal form-label-left"
										action="addRequirement" method="post"
										 novalidate>
										<!--  -->

										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">프로젝트
												검색</label>
											<div class="col-md-6 col-sm-6 col-xs-10">
												<input class="form-control" type="text" id="search_keyword"
													name="projectNameSch" value="" placeholder="프로젝트 명">
											</div>
											<input type="button" style="max-width: 60px" class="btn btn-info  col-md-1 col-sm-1 col-xs-2" name="projectSch"
												value="검색" onclick="filter()">
										</div>

										<div class="item form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">프로젝트
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<select class="form-control" id="select_project"
													name="project_Key" onchange="changeProjectKey()"
													required="required">
													<c:forEach items="${list_project}" var="vo">
														<option value="${vo.project_Key}">${vo.project_Name}</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<div class="item form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">요청
												제목<span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input class="form-control" type="text" name="request_Title" maxlength="50"
													id="request_Title" placeholder="" required="required">
											</div>
										</div>

										<div class="item form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">요청
												내용</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<textarea class="form-control" rows="3" placeholder="" maxlength="300"
													id="request_Content" name="request_Content"></textarea>
											</div>
										</div>

										<div class="item form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">작업
												요청자</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input class="form-control" id="request_Requester_Name"
													type="text" name="request_Requester_Name"
													placeholder="작업 요청자 " required="required">
											</div>
										</div>
										<!-- 요청일은 게시글 등록시 TimeStamp
										<div class="form-group ">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">
												요청일</label>
											<div class='col-md-6 col-sm-6 col-xs-12'>
												<div class='input-group date' id='myDatepicker2'>
													<input type='text' name="request_Date_Upload" class="form-control" /> <span
														class="input-group-addon"> <span
														class="glyphicon glyphicon-calendar"></span>
													</span>
												</div>
											</div>
										</div>
										-->
										<div class="item form-group ">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">
												작업 구분</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<select class="form-control"
													id="request_Work_Classification"
													name="request_Work_Classification">
													<option value="유지보수">유지보수</option>
													<option value="하자보수">하자보수</option>
													<option value="기타">기타</option>
												</select>
											</div>
										</div>
										<div class="item form-group ">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">
												작업 상태</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<select class="form-control" id="request_State"
													name="request_State">
													<option value="진행">진행</option>
													<option value="완료">완료</option>
												</select>
											</div>
										</div>
										<div class="form-group ">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">
												진행율</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<select class="form-control" id="request_Progress"
													name="request_Progress">
													<option value="0">0%</option>
													<option value="10">10%</option>
													<option value="20">20%</option>
													<option value="30">30%</option>
													<option value="40">40%</option>
													<option value="50">50%</option>
													<option value="60">60%</option>
													<option value="70">70%</option>
													<option value="80">80%</option>
													<option value="90">90%
														</oghkrption>
													<option value="100">100%</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">
												작업자 목록</label>
											<div class="col-md-6 col-sm-6 col-xs-12">

												<button type="button" onclick="addWorkerForm();">
													<i class="fa fa-plus"></i>
												</button>
												<button type="button" onclick="resetWorkerForm();">
													<i class="fa fa-repeat"></i>
												</button>
											</div>
										</div>
										<!--  동적생성 -->
										<div id="WorkerDiv">
											<input type="hidden" id="numberOfWorker"
												name="numberOfWorker" value="0" />
										</div>

										<div class="item form-group ">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">
												최종 완료일</label>
											<div class='col-md-6 col-sm-6 col-xs-12'>
												<div class='input-group date' id='myDatepicker2_2'>
													<input type='text' name="request_Date_End"
														id="request_Date_End" class="form-control readonly"
														required="required" /> <span class="input-group-addon">
														<span class="glyphicon glyphicon-calendar"></span>
													</span>
												</div>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">총
												작업시간</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input class="form-control" type="number" min="0" max="10000"
													id="request_Work_Time" name="request_Work_Time"
													placeholder="" value='0'>
											</div>
										</div>


										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">처리
												내용 및 특이사항</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<textarea class="form-control" rows="3" placeholder="" maxlength="300"
													id="request_Content_Detail" name="request_Content_Detail"></textarea>
											</div>
										</div>
										<br />
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
	<!-- Switchery -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/switchery/dist/switchery.min.js"></script>
	<!-- Select2 -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/select2/dist/js/select2.full.min.js"></script>
	<!-- bootstrap-daterangepicker -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/moment/min/moment.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
	<!-- bootstrap-datetimepicker -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
	
	<!-- Initialize datetimepicker -->
	<script>
		$('#myDatepicker').datetimepicker();

		$('#myDatepicker2').datetimepicker({
			format : 'YYYY-MM-DD'
		});
		$('#myDatepicker2_2').datetimepicker({
			format : 'YYYY-MM-DD',
			minDate : new Date(),
			ignoreReadonly : true
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
		function check(t, target, message) {
			if (t.test(target)) {
				return true;
			}

			alert(message);
			return false;
		}

		// To make field readonly
		$(".readonly").keydown(function(e) {
			e.preventDefault();
		});

		function checkForm() {
			var request_Title = $("#request_Title").val();
			// 요청제목
			var request_Content = $("#request_Content").val();
			// 요청내용	    
			var request_Requester_Name = $("#request_Requester_Name").val();
			// 작업 요청자
			var request_Work_Classification = $("#request_Work_Classification")
					.val();
			// 작업구분
			var request_State = $("#request_State").val();
			// 작업상태
			var request_Progress = $("#request_Progress").val();
			// 진행율

			var request_Date_End = $("#request_Date_End").val();
			// 최종완료일
			var request_Work_Time = $("#request_Work_Time").val();
			// 총작업시간
			var request_Content_Detail = $("#request_Content_Detail").val();
			// 처리 내용 및 특이사항

			// Check Regular Expressions
			var date_check = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;
			var nameCheck = /^[가-힣a-zA-Z]{1,20}$/;
			var numberCheck = /^[0-9]$/;

			if (request_Title == '' || request_Title == null) {
				alert("요청제목을 확인해주세요.");
				return false;
			}
			if(request_Title.length > 50){
		    	alert("요청제목이 너무 깁니다.");
		    	return false;
		    }

			if (request_Requester_Name == '' || request_Requester_Name == null) {
				alert("작업 요청자를 확인해주세요.");
				return false;
			}

			if (!check(nameCheck, request_Requester_Name,
					"작업 요청자는 한글/영어로 입력해주세요.")) {
				return false;
			}
			if (request_Work_Classification == ''
					|| request_Work_Classification == null) {
				alert("작업구분을 확인해주세요.");
				return false;
			}
			if (request_Work_Classification != '유지보수'
					&& request_Work_Classification != '하자보수'
					&& request_Work_Classification != '기타') {
				alert("부적절한 작업구분입니다.");
				return false;
			}

			if (request_State == '' || request_State == null) {
				alert("작업상태를 확인해주세요.");
				return false;
			}

			if (request_State != '진행' && request_State != '완료') {
				alert("부적절한 작업상태입니다.");
				return false;
			}

			if (request_Progress == '' || request_Progress == null) {
				alert("진행율을 확인해주세요.");
				return false;
			}

			if (request_Date_End == '' || request_Date_End == null) {
				alert("최종 완료일자를 확인해주세요.");
				return false;
			}
			if (!check(date_check, request_Date_End, "최종 완료일자를 다시 확인해주세요.")) {
				return false;
			}

			if (request_Work_Time == '' || request_Work_Time == null) {
				$("#request_Work_Time").val(0);
			}
			
			if(request_Work_Time < 0) {
		    	alert("총 작업시간이 0보다 작습니다.");
		    	return false
		    }
		    if(request_Work_Time > 10000) {
		    	alert("총 작업시간이 너무 큽니다.");
		    	return false;
		    }

			var tempBool = true;

			var tempKeys = new Array();
			for (var j = 0; j < numberOfWorker; j++) {
				var worker = $("#worker" + j).val();
				tempKeys.push(worker);
			}
			workerKeys = tempKeys;

			for (var j = 0; j < numberOfWorker; j++) {
				tempBool = checkWorker(j);
				if (!tempBool)
					break;
			}
			if (!tempBool)
				return false;

			return true;
		}
	</script>
<!-- Custom Theme Scripts -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/build/js/custom.js"></script>

	<script type="text/javascript">
		var numberOfWorker = 0;
		var workerKeys = new Array();

		function addWorkerForm() {
			var d1 = $("<div class='form-group'></div>");
			d1
					.html("<label class='control-label col-md-3 col-sm-3 col-xs-6'>담당자</label>"
							+ "<div class='col-md-2 col-sm-3 col-xs-6'>"
							+ "<select class='form-control worker' id='worker" + numberOfWorker + "' name='worker" + numberOfWorker + "_key' placeholder='' required='required'></select>"
							+ "</div>"
							+ "<label class='control-label col-md-2 col-sm-2 col-xs-6'>작업시간</label>"
							+ "<div class='col-md-2 col-sm-3 col-xs-6'>"
							+ "<input class='form-control' type='number' min='0' max='1000' id='worker" + numberOfWorker + "_workTime' name='worker" + numberOfWorker + "_workTime' placeholder=''></div>"
							+ "</div></div>");

			var d2 = $("<div class='form-group'></div>");
			d2
					.html("<label class='control-label col-md-3 col-sm-3 col-xs-6'>작업시작일</label>"
							+ "<div class='col-md-2 col-sm-3 col-xs-6'>"
							+ "<div class='input-group date' id='myDatepicker_a"+numberOfWorker+"'>"
							+ "<input class='form-control readonly' type='text' id='worker" + numberOfWorker + "_date_start' name='worker" + numberOfWorker + "_date_start' placeholder=''>"
							+ "<span class='input-group-addon'><span class='glyphicon glyphicon-calendar'></span></span>"
							+ "</div></div>"
							+ "<label class='control-label col-md-2 col-sm-2 col-xs-6'>작업종료일</label>"
							+ "<div class='col-md-2 col-sm-3 col-xs-6'>"
							+ "<div class='input-group date' id='myDatepicker_b"+numberOfWorker+"'>"
							+ "<input class='form-control readonly' type='text' id='worker" + numberOfWorker + "_date_end' name='worker" + numberOfWorker + "_date_end' placeholder=''>"
							+ "<span class='input-group-addon'><span class='glyphicon glyphicon-calendar'></span></span>"
							+ "</div></div>");
			var target = $("#WorkerDiv");
			target.append(d1);
			target.append(d2);
			var select = $("#worker" + numberOfWorker);

			var dict = {};

			<c:forEach items="${userList}" var="item">
			dict["${item.employee_key}"] = "${item.employee_name}";
			</c:forEach>

			select.html("");
			for ( var key in dict) {
				select.append("<option value="+key+">" + dict[key]
						+ "</option>");
			}

			if (Object.keys(dict).length == 0) {
				select.html("<option value=-1> 직원목록 0 에러 </option>");
			}

			$("#myDatepicker_a" + numberOfWorker).datetimepicker({
				format : 'YYYY-MM-DD',
				minDate : new Date(),
				ignoreReadonly : true
			});

			$("#myDatepicker_b" + numberOfWorker).datetimepicker({
				format : 'YYYY-MM-DD',
				minDate : new Date(),
				ignoreReadonly : true

			});

			appendOnSelect(numberOfWorker);

			numberOfWorker += 1;
			$("#numberOfWorker").val(numberOfWorker);

		}

		function appendOnSelect(numberOfWorker) {
			$("#myDatepicker_a" + numberOfWorker).on(
					"dp.change",
					function(e) {
						$("#myDatepicker_b" + numberOfWorker).data(
								"DateTimePicker").minDate(e.date);
					});
		}

		function filter() {
			var keyword = document.getElementById("search_keyword").value;
			var select = document.getElementById("select_project");
			var none = true;
			var first = 0;
			for (var i = 0; i < select.length; i++) {
				var txt = select.options[i].text;
				if (txt.toLowerCase().indexOf(
						keyword.toLowerCase()) == -1
						&& keyword.trim() !== "") {
					$(select.options[i]).attr('disabled', 'disabled').hide();
				} else {
					if (none)
						first = i;
					$(select.options[i]).removeAttr('disabled').show();
					none = false;
				}
			}
			if (none) {
				select.value = "";
			} else {
				select.value = select.options[first].value;
			}
		}

		function resetWorkerForm() {
			var target = $("#WorkerDiv");
			target.html("");
			numberOfWorker = 0;
			$("#numberOfWorker").val(numberOfWorker);
		}

		function checkWorker(i) {

			//담당자
			var worker = $("#worker" + i).val();
			//작업시작일
			var date_start = $("#worker" + i + "_date_start").val();
			//작업종료일
			var date_end = $("#worker" + i + "_date_end").val();
			//작업시간
			var workTime = $("#worker" + i + "_workTime").val();

			var date_check = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;

			var n = 0;
			for ( var k in workerKeys) {
				if (worker == workerKeys[k]) {
					n++;
				}
			}
			if (n > 1) {
				alert("중복된 작업자가 있습니다. 다시 확인해주세요.");
				return false;
			}
			if (date_start == '' || date_start == null) {
				//alert("작업시작일을 확인해주세요.");
				//return false;
			} else if (!check(date_check, date_start, "작업시작일을 다시 확인해주세요.")) {
				return false;
			}
			if (date_end == '' || date_end == null) {
				//alert("작업종료일을 확인해주세요.");
				//return false;
			} else if (!check(date_check, date_end, "작업종료일을 다시 확인해주세요.")) {
				return false;
			}

			if (workTime == '' || workTime == null) {
				$("#worker" + i + "_workTime").val(0);
			}
			if(workTime < 0) {
		    	alert("작업자의 작업시간이 0보다 작습니다.");
		    	return false
		    }
			if(workTime > 1000) {
		    	alert("작업자의 작업시간이 너무 큽니다.");
		    	return false;
		    }
			
			return true;
		}
	</script>
</body>
</html>
