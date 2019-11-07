<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">



<!-- top navigation -->
<div class="top_nav">
	<div class="nav_menu">
		<nav>
			<div class="nav toggle">
				<a id="menu_toggle"><i class="fa fa-bars"></i></a>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li class=""><a href="javascript:;"
					class="user-profile dropdown-toggle" data-toggle="dropdown"
					aria-expanded="false"> <img
						src="<%=request.getContextPath()%>/resources/gentelella-master/production/images/img.jpg"
						alt="">${userId}<span class=" fa fa-angle-down"></span>
				</a>
					<ul class="dropdown-menu dropdown-usermenu pull-right">
						
						<li><a href="<%=request.getContextPath()%>/user_logout"><i
								class="fa fa-sign-out pull-right"></i>로그아웃</a></li>
					</ul></li>

			
			</ul>
		</nav>
	</div>
</div>
<!-- /top navigation -->




</html>