<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<c:import url="header.jsp" charEncoding="UTF-8"></c:import>
</head>
<body>

	<div id="header">
		<c:import url="header-main.jsp" charEncoding="UTF-8"></c:import>
	</div>

	<div id="sidebar">
		<c:import url="sidebar.jsp" charEncoding="UTF-8"></c:import>
	</div>

	<div id="content">

		<ul class="nav nav-tabs nav-stacked">
			<li style="text-align: center"><a
				href="<c:url value="/navigation/category?group=show"/>">Шоу-бизнес</a></li>
			<li style="text-align: center"><a
				href="<c:url value="/navigation/category?group=fun"/>">Юмор</a></li>
			<li style="text-align: center"><a
				href="<c:url value="/navigation/category?group=sport"/>">Спорт</a></li>
			<li style="text-align: center"><a
				href="<c:url value="/navigation/category?group=game"/>">Игры</a></li>
			<li style="text-align: center"><a
				href="<c:url value="/navigation/category?group=gadgets"/>">Гаджеты</a></li>
		</ul>

	</div>



</body>
</html>