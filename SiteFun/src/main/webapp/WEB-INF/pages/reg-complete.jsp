<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="header.jsp" charEncoding="UTF-8"></c:import>
<link rel="stylesheet"
	href="<c:url value="/resources/css/style-login.css"/>" />
<title>Insert title here</title>
</head>
<body>

	<div id="header">
		<h1>Регистрация завершена</h1>
	</div>
	<script language='javascript'>
  var delay = 5000;
  setTimeout("document.location.href='<c:url value="/user/login"/>'", delay);
</script>
	<p style="color: red">
		Через 5 секунд Вы будете перенаправлены на страницу авторизации. Если
		этого не произойдет, то перейдите самостоятельно: <a
			href='<c:url value="/user/login"/>'>Вернуться</a>
	</p>




</body>