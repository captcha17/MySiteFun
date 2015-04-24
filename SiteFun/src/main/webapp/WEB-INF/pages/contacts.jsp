<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="header.jsp" charEncoding="UTF-8"></c:import>
<title>Contacts</title>
</head>
<body>
	<p style="margin-bottom: 7px; padding: 20px;">
		ИП «Ракушев проджект» <br /> 211666, Беларусь, г. Минск <br />
		ул.Ракушевская, д.99, 9 этаж, офис-9 <br /> Тел.: (029) 894-27-97 <br />
		Факс: (017) 200-00-00 <br /> Электронная почта: pitek16@mail.ru
	<div style="padding: 20px;">
		<form action="<c:url value="/navigation/question"/>" method="POST">
			<b>Оперативная связь</b>
			<table style="width: 90%;">
				<tr>
					<td style="text-align: right; padding-right: 10px;"><span>
							Фамилия, Имя, Отчество <font color='red'><span>*</span></font>
					</span></td>
					<td><input type="text" name="fio" value="" size="0" /></td>
				</tr>
				<tr>
					<td style="text-align: right; padding-right: 10px;"><span>
							Наименование организации </span></td>
					<td><input type="text" name="organization" value="" size="0" />
					</td>
				</tr>
				<tr>
					<td style="text-align: right; padding-right: 10px;"><span>
							Телефон, факс </span></td>
					<td><input type="text" name="phone" value="" size="0" /></td>
				</tr>
				<tr>
					<td style="text-align: right; padding-right: 10px;"><span>
							Адрес электронной почты <font color='red'><span>*</span></font>
					</span></td>
					<td><input type="text" name="mail" value="" size="0" /></td>
				</tr>
				<tr>
					<td style="text-align: right; padding-right: 10px;"><span>
							Сообщение <font color='red'><span>*</span></font>
					</span></td>
					<td><textarea name="sms" cols="40" rows="5"></textarea></td>
				</tr>
				<tr>
					<td><span><font color='red'><span>*</span></font> -
							Поля, обязательные для заполнения</span></td>
					<td><input type="submit" value="Отправить"
						class="btn btn-success"
						style="padding: 0 5px 1px; font-size: 11px; height: 23px;" /> <a
						href="<c:url value="/admin/list-admin"/>" class="btn"
						style="padding: 0 5px 1px; font-size: 11px; height: 23px;">На
							главную</a></td>
				</tr>
				<h4 style="color: red">
					<c:out value="${error}" />
				</h4>
				<h4 style="color: green">
					<c:out value="${success}" />
				</h4>
			</table>
		</form>
	</div>
</body>
</html>