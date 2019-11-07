<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">



<div class="col-md-3 left_col menu_fixed">
	<div class="left_col scroll-view">
		<div class="navbar nav_title container"
			style="border: 0; border: 0; padding-right: 15px; padding-left: 45px; margin-right: auto; margin-left: auto;">
			<a href="<%=request.getContextPath()%>/user_dashboard" class="site_title"> <img
				src="<%=request.getContextPath()%>/resources/img/logo.png"
				width="121px" height="33px">
			</a>
		</div>

		<div class="clearfix"></div>

		<!-- menu profile quick info -->
		<div class="profile clearfix">
			<div class="profile_pic">
				<img
					src="<%=request.getContextPath()%>/resources/gentelella-master/production/images/img.jpg"
					alt="..." class="img-circle profile_img">
			</div>
			<div class="profile_info">

				<h2>
					<a style="color: white;">${userId}&nbsp님</a>
				</h2>
				<span>진행중 <a href="<%=request.getContextPath()%>/CSR_Individual_proceed"
					style="color: skyblue; font-weight: bold; font-size: 1.3em">${userWork}</a>건
					입니다
				</span>
			</div>
		</div>
		<!-- /menu profile quick info -->

		<br />
		<!-- sidebar menu -->
		<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
			<div class="menu_section">

				<ul class="nav side-menu">

					<li class=""><a href="<%=request.getContextPath()%>/user_dashboard"><i
							class="fa fa-bar-chart"></i> 대시보드</a></li>


					<li><a><i class="fa fa-sitemap"></i> 유지보수 관리<span
							class="fa fa-chevron-down"></span></a>
						<ul class="nav child_menu" style="display: none;">
							<li class="hasDepth"><a>전체 유지보수 사항<span class="fa fa-chevron-down"></span></a>
								<ul class="nav child_menu" style="display: none;">
									<li class="sub_menu"><a href="<%=request.getContextPath()%>/CSR_all">전체</a></li>
									<li class="sub_menu"><a href="<%=request.getContextPath()%>/CSR_all_proceed">진행중</a></li>
									<li class="sub_menu"><a href="<%=request.getContextPath()%>/CSR_all_finished">완료</a></li>
								</ul></li>
							<li class="hasDepth"><a>담당 유지보수 사항<span class="fa fa-chevron-down"></span></a>
								<ul class="nav child_menu" style="display: none;">
									<li class="sub_menu"><a href="<%=request.getContextPath()%>/CSR_Individual">전체</a></li>
									<li class="sub_menu"><a href="<%=request.getContextPath()%>/CSR_Individual_proceed">진행중</a></li>
									<li class="sub_menu"><a href="<%=request.getContextPath()%>/CSR_Individual_finished">완료</a></li>
								</ul></li>
							<li><a href="<%=request.getContextPath()%>/CSR_register">신규 유지보수 사항 등록</a></li>
						</ul></li>

					<li><a><i class="fa fa-table"></i> Project 관리 <span
							class="fa fa-chevron-down"></span></a>
						<ul class="nav child_menu" style="display: none;">
							<li class="hasDepth"><a>전체 프로젝트<span class="fa fa-chevron-down"></span></a>
								<ul class="nav child_menu" style="display: none;">
									<li class="sub_menu"><a href="<%=request.getContextPath()%>/projects_all">전체</a></li>
									<li class="sub_menu"><a href="<%=request.getContextPath()%>/projects_all_waitng">대기중</a></li>
									<li class="sub_menu"><a href="<%=request.getContextPath()%>/projects_all_proceed">진행중</a></li>
									<li class="sub_menu"><a href="<%=request.getContextPath()%>/projects_all_finished">완료</a></li>
								</ul></li>
							<li><a href="<%=request.getContextPath()%>/projects_register">신규 프로젝트 등록</a></li>
						</ul></li>
						
					<!-- 2019-07-09 SALMON -->
					<!-- PRO 직책만 사용 가능 -->
					<c:if test="${userJob == 'PRO' }">
						<li><a><i class="fa fa-users"></i>사용자 관리<span
								class="fa fa-chevron-down"></span></a>
							<ul class="nav child_menu">
								<li><a href="<%=request.getContextPath()%>/manage_user">사용자 관리</a></li>
								<li><a href="<%=request.getContextPath()%>/manage_user_register">신규 사용자 등록</a></li>
							</ul></li>
						</c:if>
				</ul>
			</div>

		</div>
		<!-- /sidebar menu -->

		
	</div>
</div>



</html>