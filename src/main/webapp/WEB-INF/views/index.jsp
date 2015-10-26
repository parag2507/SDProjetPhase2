<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link href="<c:url value="/resources/NewFile.css" />" rel="stylesheet">

</head>

<body>

	<h2 align="center" style="padding-bottom: 8px">Cube processing</h2>
	<div align="center" class="container"
		style="padding-right: 30%; padding-left: 30%">
		<form:form method="POST"
			action="${pageContext.servletContext.contextPath}/processDimension">
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">

						<tr>
							<td><label name=dimensionLabel> Enter the length </label></td>
							<td><form:input style="width:inherit;margin-bottom:3px"
									type="number" path="length" class="form-control"
									id="dimLength" /></td>
						</tr>
						<tr>
							<td><label name=dimensionLabel> Enter the width </label></td>
							<td><form:input style="width:inherit;margin-bottom:3px"
									type="number" path="width" class="form-control"
									id="dimWidth" /></td>
						</tr>
						<tr>
							<td><label name=dimensionLabel> Enter the height </label></td>
							<td><form:input style="width:inherit;margin-bottom:3px"
									type="number" path="height" class="form-control"
									id="dimHeight" /></td>
						</tr>
						<tr>
							<td><label name=dimensionLabel> Select the unit </label></td>
							<td><form:select style="width:100%" path="unit"
									id="unit">
									<form:options items="${unitList}" /></td>
							</form:select>
						</tr>
						<tr>
							<td></td>
							<td>
							<br><br>
							<form:button style="width:inherit;margin-bottom:3px"
									type="submit" class="form-control" id="dimSubmit">Process Cube</form:button></td>
						</tr>

					</div>
				</div>

			</div>
		</form:form>
	</div>
	<table>
	<tr>
	<td><b>Type1</b></td>
	<td><b>Type2</b></td>
	<td><b>Type3</b></td>
	<td><b>Type4</b></td>
	</tr>
	<tr>
	<td><img src="<c:url value="/resources/Type1.gif" />" style="width:370px;height:350px;"/></td>
	<td><img src="<c:url value="/resources/Type2.gif" />" style="width:370px;height:350px;"/></td>
	<td><img src="<c:url value="/resources/Type3.gif" />" style="width:370px;height:350px;"/></td>
	<td><img src="<c:url value="/resources/Type4.gif" />" style="width:370px;height:350px;"/></td>
	</tr>
	</table>

</body>

</html>