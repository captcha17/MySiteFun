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

		<div style="margin: 0px auto; width: 1000px;">
			<h2>
				<c:out value="${objId.name}" />
			</h2>
			<br> <img src="<c:url value="/admin/image?index=${objId.id}"/>"
				height="600" width="900"><br> <br>
			<c:out value="${objId.description}" />
			<br> <br> <br>


			<p>
			<h4>Оставить свой комментарий :</h4>
			</p>
			<form action="<c:url value="/navigation/comment"/>" id="newComment">
				<textarea name="comment" id="comment" rows="6" cols="40"
					style="width: 50%"></textarea>
				<br>
				<button type="submit" class="btn">Отправить</button>
			</form>
			<p id="hideLogin" style="display: none;">${login}</p>
			<p id="getcomment" />
			<br>
			<hr />
			<p class="text-info">
			<h5>Комментарии:</h5>
			</p>
		</div>

		<c:forEach items="${listComments}" var="com" begin="0" end="9"
			step="1">
			<div style="margin: 0px auto; width: 500px;">
				<c:out value="${com.login}" />
				<br>
				<c:out value="${com.comment}" />
				<br> <br>
			</div>
		</c:forEach>

	</div>

	<div id="footer"></div>

</body>
</html>