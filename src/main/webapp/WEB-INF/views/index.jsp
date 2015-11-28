<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page isELIgnored="false"%>
<html>
<head>

<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<title>Shape Processing</title>
<meta name="description" content="Fullscreen Form Interface: A distraction-free form concept with fancy animations" />
<meta name="keywords" content="fullscreen form, css animations, distraction-free, web design" />
<meta name="author" content="Codrops" />

<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/normalize.css" />" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/demo.css" />" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/component.css" />" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/cs-select.css" />" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/cs-skin-boxes.css" />" />
<%-- <link href="<c:url value="/resources/NewFile.css" />" rel="stylesheet"> --%>

<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="<c:url value="/resources/js/modernizr.custom.js" />"></script>


</head>

<body>

	<div class="container">

		<div class="fs-form-wrap" id="fs-form-wrap">
		<form:form id="myform" method="POST"
			action="${pageContext.servletContext.contextPath}/processDimension" 
			class="fs-form fs-form-full" autocomplete="off">
			<ol class="fs-fields">
				<li>
					<label class="fs-field-label fs-anim-upper" for="length" data-info="Please enter the length of the wooden plank">Whats the Length</label>
					<form:input class="fs-anim-lower" path="length" id="dimLength" name="dimLength" type="number" placeholder="10" required="true"/>
				</li>
				<li>
					<label class="fs-field-label fs-anim-upper" for="width" data-info="Please enter the width of the wooden plank">Whats the Width?</label>
					<form:input class="fs-anim-lower" path="width" id="dimWidth" name="dimWidth" type="number" placeholder="10" required="true"/>
				</li>
				<li>
					<label class="fs-field-label fs-anim-upper" for="height" data-info="Please enter the height of the wooden plank">Whats the Height?</label>
					<form:input class="fs-anim-lower" path="height" id="dimHeight" name="dimHeight" type="number" placeholder="10" required="true"/>
				</li>
				<li data-input-trigger>
					<label class="fs-field-label fs-anim-upper" data-info="Please select a unit in which the result is required">Choose a unit.</label>
					<form:select class="cs-select cs-skin-boxes fs-anim-lower" path="unit" id="unit">
						<form:options items="${unitList}" /></td>
					</form:select>
				</li>
			</ol><!-- /fs-fields -->
			<form:button class="fs-submit" id="dimSubmit" type="submit">Process</form:button>
		</form:form>

		</div>

	</div>

	<script src="<c:url value="/resources/js/classie.js" />"></script>
	<script src="<c:url value="/resources/js/selectFx.js" />"></script>
	<script src="<c:url value="/resources/js/fullscreenForm.js" />"></script>
	<script>
		(function() {
			var formWrap = document.getElementById( 'fs-form-wrap' );

			[].slice.call( document.querySelectorAll( 'select.cs-select' ) ).forEach( function(el) {	
				new SelectFx( el, {
					stickyPlaceholder: false,
					onChange: function(val){
						document.querySelector('span.cs-placeholder').style.backgroundColor = val;
					}
				});
			} );

			new FForm( formWrap, {
				onReview : function() {
					classie.add( document.body, 'overview' ); // for demo purposes only
				}
			} );
		})();
	</script>

</body>

</html>