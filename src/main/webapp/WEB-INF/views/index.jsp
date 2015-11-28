<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page isELIgnored="false"%>
<html>
<head>

<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Shape Processing</title>

<link href="<c:url value="/resources/style.css" />" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<style type="text/css">
</style>

</head>

<body>
	<div class="container">
		<form:form role="form" method="POST"
			action="${pageContext.servletContext.contextPath}/processDimension">

			<div class="row">
				<div class="col-md-12 col-xs-12">
					<div class="form-group">
						<label class="control-label">Length</label>
						<form:input maxlength="100" path="length" type="text"
							required="required" class="form-control"
							placeholder="Enter Length" id="dimLength" />
					</div>
					<div class="form-group">
						<label class="control-label">Width</label>
						<form:input maxlength="100" type="text" path="width"
							required="required" class="form-control"
							placeholder="Enter Width" id="dimWidth" />
					</div>
					<div class="form-group">
						<label class="control-label">Height</label>
						<form:input maxlength="100" path="height" type="text"
							required="required" class="form-control"
							placeholder="Enter Height" id="dimHeight" />
					</div>
					<div class="form-group">
						<label class="control-label">Unit</label>
						<form:select path="unit" class="form-control" required="required"
							id="unit">
							<form:options items="${unitList}" />
						</form:select>
					</div>
					<div class="form-group">
						<label class="control-label">Shape: </label>
						<div class="radio-inline">
							<form:radiobutton path="shape" value="cube" />
							Cube
						</div>
						<div class="radio-inline">
							<form:radiobutton path="shape" value="spyramid" />
							Square Pyramid
						</div>
						<div class="radio-inline">
							<form:radiobutton path="shape" value="tpyramid" />
							Triangular Pyramid
						</div>
					</div>
					<div class="form-group">
						<form:button type="submit"
							class="btn btn-success" id="dimSubmit">Process</form:button>
					</div>
				</div>
			</div>
		</form:form>
	</div>

</body>

</html>