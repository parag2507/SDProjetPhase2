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
.thumb {
	margin-bottom: 30px;
}
</style>

</head>

<body>
	<div class="container">
		<form:form role="form" method="POST"
			action="${pageContext.servletContext.contextPath}/processDimension">
			<div class="row">
				<div class="col-md-12 col-xs-12"><h2>Shape Processing</h2></div>
			</div>
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
						<form:button type="submit" class="btn btn-success" id="dimSubmit">Process</form:button>
					</div>
				</div>
			</div>
		</form:form>
		
		<div class="row">
			<div class=" col-lg-offset-4 col-lg-8 col-md-8">
				<h5 ><span style="color:red">*</span>Please click on the image to read the instructions</h5>
			</div>
			
		</div>

		<div class="row">
			<c:choose>
				<c:when test="${shapeType == 'cube'}">
					<div class="col-lg-3 col-md-4 col-xs-6 thumb">
						<a data-target="#cubetype1" data-toggle="modal" class="thumbnail"
							href="#cubetype1"> <img class="img-responsive"
							src="<c:url value="/resources/CubeType1.png" />" alt="">
						</a>
						<h4>Type1</h4>
					</div>
					<div data-target="#cubetype2" data-toggle="modal"
						class="col-lg-3 col-md-4 col-xs-6 thumb">
						<a class="thumbnail" href="#cubetype2"> <img
							class="img-responsive"
							src="<c:url value="/resources/CubeType2.png" />" alt="">
						</a>
						<h4>Type2</h4>
					</div>
					<div data-target="#cubetype3" data-toggle="modal"
						class="col-lg-3 col-md-4 col-xs-6 thumb">
						<a class="thumbnail" href="#cubetype3"> <img
							class="img-responsive"
							src="<c:url value="/resources/CubeType3.png" />" alt="">
						</a>
						<h4>Type3</h4>
					</div>
					<div data-target="#cubetype4" data-toggle="modal"
						class="col-lg-3 col-md-4 col-xs-6 thumb">
						<a class="thumbnail" href="#cubetype4"> <img
							class="img-responsive"
							src="<c:url value="/resources/CubeType4.png" />" alt="">
						</a>
						<h4>Type4</h4>
					</div>
				</c:when>
				<c:when test="${shapeType == 'spyramid'}">

					<div
						class="col-lg-offset-4 col-md-offset-4 col-lg-4 col-md-4 col-xs-6 thumb">
						<a data-target="#spyramid" data-toggle="modal" class="thumbnail"
							href="#spyramid"> <img class="img-responsive"
							src="<c:url value="/resources/Square base pyramid.png" />" alt="">
						</a>
						<h3>Square Base Pyramid</h3>
					</div>
				</c:when>
				<c:when test="${shapeType == 'tpyramid'}">
					<div
						class="col-lg-offset-4 col-md-offset-4 col-lg-4 col-md-4 col-xs-6 thumb">
						<a data-target="#tpyramid" data-toggle="modal" class="thumbnail"
							href="#tpyramid"> <img class="img-responsive"
							src="<c:url value="/resources/Trianglebasedpyramid.png" />"
							alt="">
						</a>
						<h3>Triangular Base Pyramid</h3>
					</div>
				</c:when>
			</c:choose>
		</div>
	</div>

	<!-- Cube Type 1 Modal -->
	<div class="modal fade" id="cubetype1" tabindex="-1" role="dialog"
		aria-labelledby="cubetype1">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Cube Type 1</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-6 col-mod-6">
							<img class="img-responsive"
								src="<c:url value="/resources/CubeType1.png" />" alt="">
						</div>
						<div class="col-lg-6 col-mod-6">
							<img class="img-responsive"
								src="<c:url value="/resources/Type1 base.png" />" alt="">
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12 col-mod-12">
							<div class="table-responsive">
								<table class="table table-bordered">
									<tr>
										<td><h5>Wooden Piece dimension</h5></td>
										<td>"${command.length} ${command.unit} *
											"${command.width} ${command.unit} * "${command.height}
											${command.unit}"</td>
									</tr>

									<tr>
										<td><h5>Piece 1 Description</h5></td>
										<td>
											<div class="row">
												<div class="col-lg-8 col-mod-8">
													<figure>
														<figcaption>
															top length =
															<c:out value="${shape[0].pieces[0].topLength}" />
														</figcaption>
														<img class="img-responsive"
															src="<c:url value="/resources/cubetype1_piece1.png" />"
															alt="">
														<figcaption>
															bottom length =
															<c:out value="${shape[0].pieces[0].bottomLength}" />
														</figcaption>
													</figure>
												</div>
												<div class="col-lg-4 col-mod-4">
													<h5>
														Number of pieces =
														<c:out value="${shape[0].pieces[0].count}" />
													</h5>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td><h5>Piece 2 Description</h5></td>
										<td>
											<div class="row">
												<div class="col-lg-8 col-mod-8">
													<figure>
														<figcaption>
															top length =
															<c:out value="${shape[0].pieces[1].topLength}" />
														</figcaption>
														<img class="img-responsive"
															src="<c:url value="/resources/cubetype1_piece2.png" />"
															alt="">
														<figcaption>
															bottom length =
															<c:out value="${shape[0].pieces[1].bottomLength}" />
														</figcaption>
													</figure>
												</div>
												<div class="col-lg-4 col-mod-4">
													<h5>
														Number of pieces =
														<c:out value="${shape[0].pieces[1].count}" />
													</h5>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td><h5>Marking on the plank</h5></td>
										<td><img class="img-responsive"
											src="<c:url value="/resources/cube type 1 scale.png" />"
											alt=""></td>
									</tr>
									<tr>
										<td><h5>Volume of the cube</h5></td>
										<td><c:out value="${shape[0].volume} ${command.unit} 3" /></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- Cube Type 2 Modal -->
	<div class="modal fade" id="cubetype2" tabindex="-1" role="dialog"
		aria-labelledby="cubetype2">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Cube Type 2</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-6 col-mod-6">
							<img class="img-responsive"
								src="<c:url value="/resources/CubeType2.png" />" alt="">
						</div>
						<div class="col-lg-6 col-mod-6">
							<img class="img-responsive"
								src="<c:url value="/resources/Type2 base.png" />" alt="">
						</div>
					</div>

					<div class="row">
						<div class="col-lg-12 col-mod-12">
							<div class="table-responsive">
								<table class="table table-bordered">
									<tr>
										<td><h5>Wooden Piece dimension</h5></td>
										<td>"${command.length} ${command.unit} *
											"${command.width} ${command.unit} * "${command.height}
											${command.unit}"</td>
									</tr>

									<tr>
										<td><h5>Piece 1 Description</h5></td>
										<td>
											<div class="row">
												<div class="col-lg-8 col-mod-8">
													<figure>
														<figcaption>
															top length =
															<c:out value="${shape[1].pieces[0].topLength}" />
														</figcaption>
														<img class="img-responsive"
															src="<c:url value="/resources/cube type 2 &4_ piece 1.png" />"
															alt="">
														<figcaption>
															bottom length =
															<c:out value="${shape[1].pieces[0].bottomLength}" />
														</figcaption>
													</figure>
												</div>
												<div class="col-lg-4 col-mod-4">
													<h5>
														Number of pieces =
														<c:out value="${shape[1].pieces[0].count}" />
													</h5>
												</div>
											</div>
										</td>
									</tr>

									<tr>
										<td><h5>Piece 2 Description</h5></td>
										<td>
											<div class="row">
												<div class="col-lg-8 col-mod-8">
													<figure>
														<figcaption>
															top length =
															<c:out value="${shape[1].pieces[1].topLength}" />
														</figcaption>
														<img class="img-responsive"
															src="<c:url value="/resources/cube type 2 &4_ piece 2.png" />"
															alt="">
														<figcaption>
															bottom length =
															<c:out value="${shape[1].pieces[1].bottomLength}" />
														</figcaption>
													</figure>
												</div>
												<div class="col-lg-4 col-mod-4">
													<h5>
														Number of pieces =
														<c:out value="${shape[1].pieces[1].count}" />
													</h5>
												</div>
											</div>
										</td>
									</tr>

									<tr>
										<td><h5>Piece 3 Description</h5></td>
										<td>
											<div class="row">
												<div class="col-lg-8 col-mod-8">
													<figure>
														<figcaption>
															top length =
															<c:out value="${shape[1].pieces[2].topLength}" />
														</figcaption>
														<img class="img-responsive"
															src="<c:url value="/resources/cube type 2 &4_ piece 3.png" />"
															alt="">
														<figcaption>
															bottom length =
															<c:out value="${shape[1].pieces[2].bottomLength}" />
														</figcaption>
													</figure>
												</div>
												<div class="col-lg-4 col-mod-4">
													<h5>
														Number of pieces =
														<c:out value="${shape[1].pieces[2].count}" />
													</h5>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td><h5>Marking on the plank</h5></td>
										<td><img class="img-responsive"
											src="<c:url value="/resources/cube type 2 and 4 scale.png" />"
											alt=""></td>
									</tr>
									<tr>
										<td><h5>Volume of the cube</h5></td>
										<td><c:out value="${shape[1].volume} ${command.unit} 3" /></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- Cube Type 3 Modal -->
	<div class="modal fade" id="cubetype3" tabindex="-1" role="dialog"
		aria-labelledby="cubetype3">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Cube Type 3</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-6 col-mod-6">
							<img class="img-responsive"
								src="<c:url value="/resources/CubeType3.png" />" alt="">
						</div>
						<div class="col-lg-6 col-mod-6">
							<img class="img-responsive"
								src="<c:url value="/resources/Type3 base.png" />" alt="">
						</div>
					</div>

					<div class="row">
						<div class="col-lg-12 col-mod-12">
							<div class="table-responsive">
								<table class="table table-bordered">
									<tr>
										<td><h5>Wooden Piece dimension</h5></td>
										<td>"${command.length} ${command.unit} *
											"${command.width} ${command.unit} * "${command.height}
											${command.unit}"</td>
									</tr>

									<tr>
										<td><h5>Piece 1 Description</h5></td>
										<td>
											<div class="row">
												<div class="col-lg-8 col-mod-8">
													<figure>
														<figcaption>
															top length =
															<c:out value="${shape[2].pieces[0].topLength}" />
														</figcaption>
														<img class="img-responsive"
															src="<c:url value="/resources/cube type 3_ piece 1.png" />"
															alt="">
														<figcaption>
															bottom length =
															<c:out value="${shape[2].pieces[0].bottomLength}" />
														</figcaption>
													</figure>
												</div>
												<div class="col-lg-4 col-mod-4">
													<h5>
														Number of pieces =
														<c:out value="${shape[2].pieces[0].count}" />
													</h5>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td><h5>Piece 2 Description</h5></td>
										<td>
											<div class="row">
												<div class="col-lg-8 col-mod-8">
													<figure>
														<figcaption>
															top length =
															<c:out value="${shape[2].pieces[1].topLength}" />
														</figcaption>
														<img class="img-responsive"
															src="<c:url value="/resources/cube type 3_ piece 2.png" />"
															alt="">
														<figcaption>
															bottom length =
															<c:out value="${shape[2].pieces[1].bottomLength}" />
														</figcaption>
													</figure>
												</div>
												<div class="col-lg-4 col-mod-4">
													<h5>
														Number of pieces =
														<c:out value="${shape[2].pieces[1].count}" />
													</h5>
												</div>
											</div>
										</td>
									</tr>

									<tr>
										<td><h5>Marking on the plank</h5></td>
										<td><img class="img-responsive"
											src="<c:url value="/resources/cube type 3 scale.png" />"
											alt=""></td>
									</tr>
									<tr>
										<td><h5>Volume of the cube</h5></td>
										<td><c:out value="${shape[2].volume} ${command.unit} 3" /></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- Cube Type 4 Modal -->
	<div class="modal fade" id="cubetype4" tabindex="-1" role="dialog"
		aria-labelledby="cubetype4">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Cube Type 4</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-6 col-mod-6">
							<img class="img-responsive"
								src="<c:url value="/resources/CubeType4.png" />" alt="">
						</div>
						<div class="col-lg-6 col-mod-6">
							<img class="img-responsive"
								src="<c:url value="/resources/Type4 base.png" />" alt="">
						</div>
					</div>

					<div class="row">
						<div class="col-lg-12 col-mod-12">
							<div class="table-responsive">
								<table class="table table-bordered">
									<tr>
										<td><h5>Wooden Piece dimension</h5></td>
										<td>"${command.length} ${command.unit} *
											"${command.width} ${command.unit} * "${command.height}
											${command.unit}"</td>
									</tr>

									<tr>
										<td><h5>Piece 1 Description</h5></td>
										<td>
											<div class="row">
												<div class="col-lg-8 col-mod-8">
													<figure>
														<figcaption>
															top length =
															<c:out value="${shape[3].pieces[0].topLength}" />
														</figcaption>
														<img class="img-responsive"
															src="<c:url value="/resources/cube type 2 &4_ piece 1.png" />"
															alt="">
														<figcaption>
															bottom length =
															<c:out value="${shape[3].pieces[0].bottomLength}" />
														</figcaption>
													</figure>
												</div>
												<div class="col-lg-4 col-mod-4">
													<h5>
														Number of pieces =
														<c:out value="${shape[3].pieces[0].count}" />
													</h5>
												</div>
											</div>
										</td>
									</tr>

									<tr>
										<td><h5>Piece 2 Description</h5></td>
										<td>
											<div class="row">
												<div class="col-lg-8 col-mod-8">
													<figure>
														<figcaption>
															top length =
															<c:out value="${shape[3].pieces[1].topLength}" />
														</figcaption>
														<img class="img-responsive"
															src="<c:url value="/resources/cube type 2 &4_ piece 2.png" />"
															alt="">
														<figcaption>
															bottom length =
															<c:out value="${shape[3].pieces[1].bottomLength}" />
														</figcaption>
													</figure>
												</div>
												<div class="col-lg-4 col-mod-4">
													<h5>
														Number of pieces =
														<c:out value="${shape[3].pieces[1].count}" />
													</h5>
												</div>
											</div>
										</td>
									</tr>

									<tr>
										<td><h5>Piece 3 Description</h5></td>
										<td>
											<div class="row">
												<div class="col-lg-8 col-mod-8">
													<figure>
														<figcaption>
															top length =
															<c:out value="${shape[3].pieces[2].topLength}" />
														</figcaption>
														<img class="img-responsive"
															src="<c:url value="/resources/cube type 2 &4_ piece 3.png" />"
															alt="">
														<figcaption>
															bottom length =
															<c:out value="${shape[3].pieces[2].bottomLength}" />
														</figcaption>
													</figure>
												</div>
												<div class="col-lg-4 col-mod-4">
													<h5>
														Number of pieces =
														<c:out value="${shape[3].pieces[2].count}" />
													</h5>
												</div>
											</div>
										</td>
									</tr>


									<tr>
										<td><h5>Marking on the plank</h5></td>
										<td><img class="img-responsive"
											src="<c:url value="/resources/cube type 2 and 4 scale.png" />"
											alt=""></td>
									</tr>
									<tr>
										<td><h5>Volume of the cube</h5></td>
										<td><c:out value="${shape[3].volume} ${command.unit} 3" /></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- Square Pyramid Modal -->
	<div class="modal fade" id="spyramid" tabindex="-1" role="dialog"
		aria-labelledby="spyramid">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Square Pyramid</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-12 col-mod-12">
							<img class="img-responsive"
								src="<c:url value="/resources/Square base pyramid.png" />" alt="">
						</div>

					</div>
					<div class="row">
						<div class="col-lg-12 col-mod-12">
							<div class="table-responsive">
								<table class="table table-bordered">
									<tr>
										<td><h5>Wooden Piece dimension</h5></td>
										<td>"${command.length} ${command.unit} *
											"${command.width} ${command.unit} * "${command.height}
											${command.unit}"</td>
									</tr>

									<tr>
										<td><h5>Piece 1 Description</h5></td>
										<td>
											<div class="row">
												<div class="col-lg-8 col-mod-8">
													<figure>
														<figcaption>
															top length =
															<c:out value="${shape[0].pieces[0].topLength}" />
														</figcaption>
														<img class="img-responsive"
															src="<c:url value="/resources/square_base_pyramid_piece 1.png" />"
															alt="">
														<figcaption>
															bottom length =
															<c:out value="${shape[0].pieces[0].bottomLength}" />
														</figcaption>
													</figure>
												</div>
												<div class="col-lg-4 col-mod-4">
													<h5>
														Number of pieces =
														<c:out value="${shape[0].pieces[0].count}" />
													</h5>
												</div>
											</div>
										</td>
									</tr>

									<tr>
										<td><h5>Piece 2 Description</h5></td>
										<td>
											<div class="row">
												<div class="col-lg-8 col-mod-8">
													<figure>
														<figcaption>
															top length =
															<c:out value="${shape[0].pieces[1].topLength}" />
														</figcaption>
														<img class="img-responsive"
															src="<c:url value="/resources/square_base_pyramid_piece 2.png" />"
															alt="">
														<figcaption>
															bottom length =
															<c:out value="${shape[0].pieces[1].bottomLength}" />
														</figcaption>
													</figure>
												</div>
												<div class="col-lg-4 col-mod-4">
													<h5>
														Number of pieces =
														<c:out value="${shape[0].pieces[1].count}" />
													</h5>
												</div>
											</div>
										</td>
									</tr>

									<tr>
										<td><h5>Piece 3 Description</h5></td>
										<td>
											<div class="row">
												<div class="col-lg-8 col-mod-8">
													<figure>
														<figcaption>
															top length =
															<c:out value="${shape[0].pieces[2].topLength}" />
														</figcaption>
														<img class="img-responsive"
															src="<c:url value="/resources/square_base_pyramid_piece 3.png" />"
															alt="">
														<figcaption>
															bottom length =
															<c:out value="${shape[0].pieces[2].bottomLength}" />
														</figcaption>
													</figure>
												</div>
												<div class="col-lg-4 col-mod-4">
													<h5>
														Number of pieces =
														<c:out value="${shape[0].pieces[2].count}" />
													</h5>
												</div>
											</div>
										</td>
									</tr>


									<tr>
										<td><h5>Marking on the plank</h5></td>
										<td><img class="img-responsive"
											src="<c:url value="/resources/Square base pyramid scale.png" />"
											alt=""></td>
									</tr>
									<tr>
										<td><h5>Volume of the Square pyramid</h5></td>
										<td><c:out value="${shape[0].volume} ${command.unit} 3" /></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- Triangular Pyramid Modal -->
	<div class="modal fade" id="tpyramid" tabindex="-1" role="dialog"
		aria-labelledby="tpyramid">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Triangular Pyramid</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-12 col-mod-12">
							<img class="img-responsive"
								src="<c:url value="/resources/Trianglebasedpyramid.png" />"
								alt="">
						</div>

					</div>
					<div class="row">
						<div class="col-lg-12 col-mod-12">
							<div class="table-responsive">
								<table class="table table-bordered">
									<tr>
										<td><h5>Wooden Piece dimension</h5></td>
										<td>"${command.length} ${command.unit} *
											"${command.width} ${command.unit} * "${command.height}
											${command.unit}"</td>
									</tr>


									<tr>
										<td><h5>Piece 1 Description</h5></td>
										<td>
											<div class="row">
												<div class="col-lg-8 col-mod-8">
													<figure>
														<figcaption>
															top length =
															<c:out value="${shape[0].pieces[0].topLength}" />
														</figcaption>
														<img class="img-responsive"
															src="<c:url value="/resources/triangle_base_pyramid_piece 1.png" />"
															alt="">
														<figcaption>
															bottom length =
															<c:out value="${shape[0].pieces[0].bottomLength}" />
														</figcaption>
													</figure>
												</div>
												<div class="col-lg-4 col-mod-4">
													<h5>
														Number of pieces =
														<c:out value="${shape[0].pieces[0].count}" />
													</h5>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td><h5>Piece 2 Description</h5></td>
										<td>
											<div class="row">
												<div class="col-lg-8 col-mod-8">
													<figure>
														<figcaption>
															top length =
															<c:out value="${shape[0].pieces[1].topLength}" />
														</figcaption>
														<img class="img-responsive"
															src="<c:url value="/resources/triangle_base_pyramid_piece 2.png" />"
															alt="">
														<figcaption>
															bottom length =
															<c:out value="${shape[0].pieces[1].bottomLength}" />
														</figcaption>
													</figure>
												</div>
												<div class="col-lg-4 col-mod-4">
													<h5>
														Number of pieces =
														<c:out value="${shape[0].pieces[1].count}" />
													</h5>
												</div>
											</div>
										</td>
									</tr>

									<tr>
										<td><h5>Marking on the plank</h5></td>
										<td><img class="img-responsive"
											src="<c:url value="/resources/Triangle base pyramid scale.png" />"
											alt=""></td>
									</tr>
									<tr>
										<td><h5>Volume of the Triangular pyramid</h5></td>
										<td><c:out value="${shape[0].volume} ${command.unit} 3" /></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

</body>

</html>