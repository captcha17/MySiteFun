<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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

		<div>
			<c:forEach items="${news}" var="nov" begin="${x}0" end="${x}9"
				step="1">
				<div style="margin: 0px auto; width: 1000px;">
					<a href="<c:url value="/navigation/out?index=${nov.id}"/>"><h2
							class="text-success">
							<c:out value="${nov.name}" />
						</h2></a> <br>
					<c:out value="${nov.brief}" />
					<br> <br> <img class="img-rounded"
						src="<c:url value="/admin/image?index=${nov.id}"/>" height="400"
						width="600"><br> <br> <a
						href="<c:url value="/navigation/out?index=${nov.id}"/>">Читать
						далее...</a>
				</div>
			</c:forEach>
		</div>

		<div id="footer" class="pagination pagination-centered">
			<ul>
				<li><a
					href="<c:url value="/navigation/pagination?page=${x-1}"/>">Prev</a></li>
				<li><a href="<c:url value="/navigation/pagination?page=0"/>">1</a></li>
				<li><a href="<c:url value="/navigation/pagination?page=1"/>">2</a></li>
				<li><a href="<c:url value="/navigation/pagination?page=2"/>">3</a></li>
				<li><a href="<c:url value="/navigation/pagination?page=3"/>">4</a></li>
				<li><a href="<c:url value="/navigation/pagination?page=4"/>">5</a></li>
				<li><a
					href="<c:url value="/navigation/pagination?page=${x+1}"/>">Next</a></li>
			</ul>
		</div>
	</div>

	<script src="<c:url value="/resources/js/list.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery-ui.js"/>"></script>

</body>
</html>