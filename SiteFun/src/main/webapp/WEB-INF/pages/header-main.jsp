<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Date"%>

<html>
<head>


</head>
<body>

	<div class="navbar navbar-inverse" style="position: static;">
		<div class="navbar-inner">
			<div class="container">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".subnav-collapse"><br /> <span class="icon-bar"></span><br />
					<span class="icon-bar"></span><br /> <span class="icon-bar"></span><br />
				</a><br /> <a class="brand" href="<c:url value="/admin/list-admin"/>"
					style="text-shadow: 2px 1px 0px #fff, 9px 8px 0px rgba(0, 0, 0, 0.15)">Funs</a>
				</p>
				<div class="nav-collapse subnav-collapse">
					<ul class="nav">

						<li class="active"><a
							href="<c:url value="/admin/list-admin"/>">Главная</a></li>
						<li><a href="#">Видео-контент</a></li>
						<li><a href="<c:url value="/navigation/photo"/>">Фото</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">Категории <b class="caret"></b></a>
							</p>
							<ul class="dropdown-menu">
								<li><a
									href="<c:url value="/navigation/category?group=show"/>">Шоу-бизнес</a></li>
								<li><a
									href="<c:url value="/navigation/category?group=fun"/>">Юмор</a></li>
								<li><a
									href="<c:url value="/navigation/category?group=sport"/>">Спорт</a></li>
								<li><a
									href="<c:url value="/navigation/category?group=game"/>">Игры</a></li>
								<li><a
									href="<c:url value="/navigation/category?group=gadgets"/>">Гаджеты</a></li>
							</ul></li>
					</ul>
					<form class="navbar-search pull-left"
						action="<c:url value="/navigation/search"/>">
						<input type="text" class="search-query span2" name="searchRequest"
							placeholder="Search"><br />
					</form>
					<ul class="nav pull-right">
						<li><a href="<c:url value="/navigation/contacts"/>">Контакты</a></li>
						<li class="divider-vertical"></li>
						<li><a href="#"><%= new Date() %></a>
							</p></li>
					</ul>
				</div>
				</p>
			</div>
			</p>
		</div>
		</p>
	</div>

</body>
</html>