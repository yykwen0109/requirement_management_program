<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.msg{color:#ff0000}
</style>
</head>
<body>
<div align="center">

<h3>개인 정보 입력</h3>
<hr width = "400">

	<form:form action="join" method = "post" commandName = "personVO">
		<table border = "1" cellpadding = "2" cellspacing = "0">
			<tr>
				<td>이름</td>
				<td><form:input path="name" /><form:errors path="name"  cssClass="msg"/></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><form:input path="age" /><form:errors path="age"  cssClass="msg"/></td>
			</tr>
			<tr>
				<td>주민번호</td>
				<td><form:input path="id" /><form:errors path="id"  cssClass="msg"/></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><form:input path="address" /><form:errors path="address"  cssClass="msg"/></td>
			</tr>
			<tr>
				<td colspan = "2" align = "center">
					<input type = "submit" value = "등록"/> &nbsp;&nbsp;
					<input type = "reset" value = "취소" />
				</td>
			</tr>
			
		</table>
	</form:form>
</div>	
</body>
</html>