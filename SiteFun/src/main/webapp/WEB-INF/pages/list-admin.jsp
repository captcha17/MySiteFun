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
		<ul class="nav nav-list">
			<li class="nav-header">Редактировать</li>
			<li><a href="#myModal" data-toggle="modal">Добавить новость</a></li>
			<li><a href="#" onclick="$('.show').show();">Удалить новость</a></li>
			<li><a href="<c:url value="/admin/list-admin"/>">Отмена</a></li>
			<li><a href="<c:url value="/admin/admin-questions"/>">Вопросы</a></li>
		</ul>
	</div>

	<div id="content">

		<div>
			<c:forEach items="${news}" var="nov" begin="${x}0" end="${x}9"
				step="1">
				<div style="margin: 0px auto; width: 1000px;">
					<h2 class="text-success">
						<a href="<c:url value="/admin/delete?index=${nov.id}"/>"
							class="show" style="display: none;">&nbsp;</a>
						<c:out value="${nov.name}" />
					</h2>
					<br>
					<c:out value="${nov.brief}" />
					<br> <br> <img
						src="<c:url value="/admin/image?index=${nov.id}"/>" height="400"
						width="600"><br> <br> <a
						href="<c:url value="/navigation/out?index=${nov.id}"/>">Читать
						далее...</a>
				</div>
			</c:forEach>
		</div>

		<div class="modal hide fade" id="myModal" tabindex="-1" role="dialog">
			<c:url value="/admin/add" var="url" />
			<form:form action="${url}" method="post" commandName="news"
				enctype="multipart/form-data" modelAttribute="uploadform">

				<div class="modal-header">
					<button class="close" type="button" data-dismiss="modal">X</button>
					<h3 id="myModalLabel">Добавление новости</h3>
				</div>
				<div class="modal-body">

					<h4>Название новости</h4>
					<br> <input type="text" id="name" name="name"
						style="width: 100%" />
					<h4>Раздел новости</h4>
					<select name="category" id="category">
						<option value="show">Шоу-бизнес</option>
						<option value="fun">Юмор</option>
						<option value="sport">Спорт</option>
						<option value="game">Игры</option>
						<option value="gadgets">Гаджеты</option>
					</select><br>
					<h4>Изображение</h4>
					<br> <input type="file" required="" id="image" name="files[0]">
					<h4>Краткое описание</h4>
					<br>
					<textarea name="brief" id="brief" rows="10" style="width: 100%"></textarea>
					<h4>Информационный блок</h4>
					<textarea name="description" id="description" rows="15"
						style="width: 100%"></textarea>

				</div>
				<div class="modal-footer">
					<input type="submit" class="btn btn-primary" value="Сохранить">
					<button class="btn" data-dismiss="modal">Закрыть</button>
				</div>
			</form:form>
		</div>


		<div id="footer" class="pagination pagination-centered">
			<ul>
				<li><a href="#">Prev</a></li>
				<li><a href="<c:url value="/navigation/pagination?page=0"/>">1</a></li>
				<li><a href="<c:url value="/navigation/pagination?page=1"/>">2</a></li>
				<li><a href="<c:url value="/navigation/pagination?page=2"/>">3</a></li>
				<li><a href="<c:url value="/navigation/pagination?page=3"/>">4</a></li>
				<li><a href="<c:url value="/navigation/pagination?page=4"/>">5</a></li>
				<li><a href="#">Next</a></li>
			</ul>
		</div>
	</div>

	<script src="<c:url value="/resources/js/list.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery-ui.js"/>"></script>


</body>
</html>