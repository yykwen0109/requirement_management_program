<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Project Table List</title>
</head>
<body>
<div align = "center">
	<h3>Project Table</h3>
	<hr width = "500">
	<table width = "600" cellpadding = "0" cellspacing="0" border = "1">
		<tr>
		<colgroup bgcolor = "#ddffaa">
			<col width = "10%">
			<col width = "70%">
			<col width = "20%">
		</colgroup>
			<td align = "center">Project_Key</td>
			<td align = "center">Project_State</td>
			<td align = "center">Project_Company</td>
			<td align = "center">Project_Name</td>
			<td align = "center">Project_Type</td>
			<td align = "center">Project_Scope</td>
			<td align = "center">Project_Date_Start</td>
			<td align = "center">Project_Date_End</td>
			<td align = "center">Project_Remarks</td>
			<td align = "center">Project_PM</td>
			<td align = "center">Project_Manager</td>
		</tr>
		<c:forEach items = "${list}" var = "vo">
		<tr bgcolor = "white">
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
	</table>
	
	<a href = "writeForm"> 글쓰기</a>
	
</div>
</body>
</html>