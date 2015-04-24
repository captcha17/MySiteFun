<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
</head>
<body>
	<div>
		<c:import url="header.jsp" charEncoding="UTF-8"></c:import>
	</div>

	<h1>Items</h1>
	<div class="table-wrapper">
		<table id="items-list" class="tablesorter">
			<thead>
				<tr>
					<th>Name</th>
					<th>Description</th>
					<th>Price</th>
					<th>Remove</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${items}" var="item">
					<tr>
						<td><c:out value="${item.name}" /></td>
						<td><c:out value="${item.description}" /></td>
						<td><fmt:formatNumber value="${item.price}"
								maxFractionDigits="2" /></td>
						<td class="delete">&nbsp;</td>
						<input type="hidden" value="${item.id}" class="item-id" />
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<!-- Modal div -->
	<div id="dialog-confirm" title="Delete item?"
		style="height: 50px; display: none;">
		<div>
			<span class="ui-icon ui-icon-alert"
				style="float: left; margin: 0 7px 20px 0;"></span>Are you sure?
		</div>
	</div>

	<!-- Delete item form -->
	<c:url value="/item/delete" var="url" />
	<form action="${url}" method="post" id="delete-item-form">
		<input type="hidden" name="id" value="-1" />
	</form>


	<script src="<c:url value="/resources/js/jquery-1.7.1.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.tablesorter.js"/>"></script>
	<script src="<c:url value="/resources/js/list.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery-ui.js"/>"></script>

</body>
</html>