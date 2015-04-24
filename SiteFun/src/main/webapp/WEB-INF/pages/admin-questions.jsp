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
			<c:forEach items="${questions}" var="q" begin="0" end="9" step="1">
				<div style="margin: 0px auto; width: 1000px; padding-top: 20px;">
					<p>
						ФИО : <span class="text-success"><c:out value="${q.fio}" /></span>
					</p>
					<br>
					<p>
						Организация : <span class="text-success"><c:out
								value="${q.organization}" /></span>
					</p>
					<br>
					<p>
						Телефон : <span class="text-success"><c:out
								value="${q.phone}" /></span>
					</p>
					<br>
					<p>
						Почта : <span class="text-success"><c:out value="${q.mail}" /></span>
					</p>
					<br>
					<p>
						Сообщение : <span class="text-success"><c:out
								value="${q.sms}" /></span>
					</p>
					<br> <br>


				</div>
			</c:forEach>
		</div>

	</div>

	<div id="footer"></div>

</body>
</html>