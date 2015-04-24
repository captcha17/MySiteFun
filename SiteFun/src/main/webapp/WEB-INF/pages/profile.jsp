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

		<div>
			<div style="margin: 0px auto; width: 1000px;">
				<h2>Ваши данные :</h2>
				<br>
				<p class="text-warning">
					Ваш логин :
					<c:out value="${client.login}" />
				</p>
				<br>
				<p class="text-warning">
					Ваша почта :
					<c:out value="${client.mail}" />
				</p>
				<br>
				<p class="text-warning">
					Ваше имя :
					<c:out value="${client.myname}" />
				</p>
				<br>
				<p class="text-warning">
					Ваша фамилия :
					<c:out value="${client.mylastname}" />
				</p>
				<br>
				<p class="text-warning">
					Ваш пол :
					<c:out value="${client.sex}" />
				</p>
				<br>
				<p class="text-warning">
					Информация о вас :
					<c:out value="${client.about}" />
				</p>
				<br> <a class="btn btn-info btn-mini" href="#"
					onclick="$('.addInfo').show();">Добавить информацию о себе</a><br>
				<br>

				<form action="<c:url value="/navigation/change"/>" method="post"
					class="addInfo" style="display: none;">
					<label class="control-label" for="myName">Имя</label>
					<div class="controls">
						<input type="text" name="myname" id="myName" placeholder="Имя">
					</div>
					<label class="control-label" for="myLastName">Фамилия</label>
					<div class="controls">
						<input type="text" name="mylastname" id="myLastName"
							placeholder="Фамилия">
					</div>
					Пол:<br> <label class="radio"> <input type="radio"
						name="sex" id="optionsRadios1" value="male" checked>
						Мужской
					</label> <label class="radio"> <input type="radio" name="sex"
						id="optionsRadios2" value="female"> Женский
					</label><br> О себе:<br>
					<textarea name="about" rows="3"></textarea>
					<br>
					<button type="submit" class="btn">Отправить</button>
				</form>
			</div>

		</div>

	</div>

	<div id="footer"></div>

</body>
</html>