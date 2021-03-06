<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<c:import url="header.jsp" charEncoding="UTF-8"></c:import>
<script src="<c:url value="/resources/js/jquery-1.7.1.js"/>"></script>
<script src="<c:url value="/resources/js/basic.js"/>"></script>
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
			<c:forEach items="${news}" var="nov">
				<div style="margin: 15px auto; width: 1000px;">
					<img src="<c:url value="/admin/image?index=${nov.id}"/>"
						height="400" width="600"> <a
						class="btn btn-warning btn-large"
						href="<c:url value="/admin/save?index=${nov.id}"/>">Скачать</a><br>
					<br>
				</div>
			</c:forEach>
		</div>

	</div>

	<div id="footer"></div>

</body>
</html>