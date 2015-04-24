<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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

	<div id="header"></div>

	<div id="content">
		<h2 style="color: red; position: absolute; right: 39%; top: 20%;">Mail
			or login are already in use!</h2>
		<div id="login">
			<script>
	function checkPassword(p1, p2)
{
	if (p1.value != p2.value) {
	p2.setCustomValidity('Пароль не совпадает');
	} else {
	p2.setCustomValidity('');
}
}
</script>
			<c:url value="/user/reg" var="reg" />
			<form:form action="${reg}" method="post" class="form-horizontal"
				commandName="client">
				<div class="control-group">
					<label class="control-label" for="inputEmail">Email</label>
					<div class="controls">
						<input type="text" name="mail" placeholder="Email" required
							pattern="^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$" /><span
							class="required">&nbsp;</span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="log">Login</label>
					<div class="controls">
						<input type="text" name="login" placeholder="Your login" id="log"
							required pattern="[A-Za-z0-9]{1,30}"><span
							class="required">&nbsp;</span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="p1">Password</label>
					<div class="controls">
						<input type="password" name="password" placeholder="Password"
							id="p1" required pattern="[A-Za-z0-9]{1,30}"><span
							class="required">&nbsp;</span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="confirm">Confirm Password</label>
					<div class="controls">
						<input type="password" name="confirm"
							placeholder="Retype password" id="confirm" required
							pattern="[A-Za-z0-9]{1,30}"
							onfocus="checkPassword(document.getElementById('p1'), this);"
							oninput="checkPassword(document.getElementById('p1'), this);"><span
							class="required">&nbsp;</span>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<button type="submit" class="btn">Registration</button>
						<a href="<c:url value="/user/login"/>" class="btn btn-danger">Cancel</a>
					</div>
				</div>

			</form:form>
		</div>
	</div>


</body>
</html>