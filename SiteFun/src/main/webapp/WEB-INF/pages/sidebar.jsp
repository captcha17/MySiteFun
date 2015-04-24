<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
</head>
<body>


	<div class="well">
		<ul class="nav nav-list">
			<li class="nav-header">Заголовок списка</li>
			<li class="active"><a href="<c:url value="/admin/list-admin"/>">Домой</a></li>
			<li><a href="<c:url value="/navigation/categories"/>">Категории</a></li>
			<li class="nav-header">Добро пожаловать:</li>
			<li style="font-style: italic"><c:out value="${login}" /></li>
			<li><a href="<c:url value="/navigation/profile?log=${login}"/>">Профиль</a></li>
			<li><a href="<c:url value="/navigation/settings?log=${login}"/>">Настройки</a></li>
			<li class="divider"></li>
			<li><a href="<c:url value="/user/login"/>">Выход</a></li>
		</ul>
	</div>

</body>
</html>