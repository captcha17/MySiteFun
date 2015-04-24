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
				<h2>Смена пароля :</h2>
				<br>
				<h4 style="color: red">
					<c:out value="${error}" />
				</h4>
				<h4 style="color: green">
					<c:out value="${success}" />
				</h4>
				<h4 style="color: red">
					<c:out value="${notconfirm}" />
				</h4>
				<form action="<c:url value="/navigation/changepass"/>" method="post">
					<label class="control-label" for="oldPassword">Старый
						пароль</label>
					<div class="controls">
						<input type="password" name="oldPassword" id="oldPassword"
							placeholder="********">
					</div>
					<label class="control-label" for="newPassword">Новый пароль</label>
					<div class="controls">
						<input type="password" name="newPassword" id="newPassword"
							placeholder="********">
					</div>
					<label class="control-label" for="confirm">Подтверждение
						пароля</label>
					<div class="controls">
						<input type="password" name="confirm" id="confirm"
							placeholder="********">
					</div>
					<button type="submit" class="btn">Отправить</button>
				</form>
			</div>

		</div>

	</div>

	<div id="footer"></div>

</body>
</html>