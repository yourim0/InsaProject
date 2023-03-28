<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en" class="h-100">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<title>인사시스템</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.1/examples/cover/">

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link href="css/cover.css" rel="stylesheet">


<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>


<!-- Custom styles for this template -->
<link href="css/cover.css" rel="stylesheet">
</head>

<body class="d-flex h-100 text-center text-black">
	<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
		<header>
			<div>
				<h3 class="float-md-start mb-0">Soft</h3>
				<nav class="nav nav-masthead justify-content-center float-md-end">
					<a class="nav-link active" aria-current="page" href="#">Home</a> <a
						class="nav-link" href="#">Input</a> <a class="nav-link" href="#">Search</a>
				</nav>
				<br />
			</div>

		</header>


		<!-- form -->
		<main>
			<form id="search_Form" method="post">
				<div class="container">
					<div class="row">
						<div class="col">
							<div class="right">
								<p>
									사번 <input type="text" id="sabun" name="sabun" value=""></input>
								</p>
								<p>
									직위 <select name="pos_gbn_code">
											<option value="">선택</option>
											<c:forEach items="${result }" var="result">
												<c:if test="${result.gubun eq 'A04'}">
													<option value="${result.gubun}${result.code}">
														${result.name}</option>
												</c:if>
											</c:forEach>
										</select>
								</p>
							</div>
						</div>
						<div class="col">
							<div class="right">
								<p>
									사원명 <input type="text" name="name" id="name" value="${info.name }" korOnly></input>
								</p>
								<p>
									입사일 <input type="date" id="join_date" name="join_date"></input>
								</p>
							</div>
						</div>
						<div class="col">
							<div class="right">
								<p>
									입사구분 <select name="join_gbn_code">
										<option value="">선택</option>
										<c:forEach items="${result }" var="result">
											<c:if test="${result.gubun eq 'A01'}">
												<option value="${result.gubun}${result.code}">
													${result.name}</option>
											</c:if>
										</c:forEach>
									</select>
								</p>
								<p>
									퇴사일 <input type="date" id="retire_date" name="retire_date"></input>
								</p>
							</div>
						</div>
						<div class="col">
							<div class="right">
								<p>
									투입여부 <select name="put_yn">
										<option value="">선택</option>
										<c:forEach items="${result }" var="result">
											<c:if test="${result.gubun eq 'A07'}">
												<option value="${result.gubun}${result.code}">
													${result.name}</option>
											</c:if>
										</c:forEach>
									</select>
								</p>
								<p>
									직종 <select name="job_type">
										<option value="">선택</option>
										<c:forEach items="${result }" var="result">
											<c:if test="${result.gubun eq 'A03'}">
												<option value="${result.gubun}${result.code}">
													${result.name}</option>
											</c:if>
										</c:forEach>
									</select>
								</p>

								<div class="inputBtn">
									<button type="button" class="btn btn-dark btn-sm"
										onclick="submit_search();">검색</button>
									<button type="reset" class="btn btn-dark btn-sm">초기화</button>
									<button type="button" class="btn btn-dark btn-sm"
										onClick="location.href='/index'">이전</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</main>
		<div class="table" style="margin-top: 30px;">
			<table border='1' style="width: 100%;">
			<thead>
				<tr>
					<th>사번</th>
					<th>성명</th>
					<th>주민번호</th>
					<th>핸드폰 번호</th>
					<th>직위</th>
					<th>입사일자</th>
					<th>퇴사일자</th>
					<th>투입여부</th>
					<th>연봉</th>
				</tr>
			</thead>
			<tbody id="dynamicTbody">	
				<c:if test="${empty value}">
					<td colspan="9">검색된 데이터가 없습니다</td>
				</c:if>
				<c:if test="${!empty value}">
					<c:forEach items="${value}" var="value">
						<tr>
							<td class="align-middle align-middle" onclick="location.href='/sabun=?'">
								<c:out value="${value.sabun}" />
							</td>
							<td class="align-middle align-middle">
								<c:out value="${value.name}" />
							</td>
							<td class="align-middle align-middle">
								<c:out value="${value.reg_no}" />
							</td>
							<td class="align-middle align-middle">
								<c:out value="${value.hp}" />
							</td>
							<td class="align-middle align-middle">
								<c:out value="${value.pos_gbn_code}" />
							</td>
							<td class="align-middle align-middle">
								<fmt:formatDate value="${value.join_date}" pattern="yyyy-MM-dd" />
							</td>
							<td class="align-middle align-middle">
								<fmt:formatDate value="${value.retire_date}" pattern="yyyy-MM-dd" />
							</td>
							<td class="align-middle align-middle">
								<c:out value="${value.put_yn}" />
							</td>
							<td class="align-middle align-middle">
								<c:out value="${value.salary}" />
							</td>
						</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>

	<script>
		//입사일,퇴사일
		$.datepicker.setDefaults({
			dateFormat : 'yy-mm-dd'
		});

		$("#join_date,#retire_date").datepicker();
		//입사일, 퇴사일 비교
		$(document).ready(
				function() {
					$('#retire_date').datepicker(
							"option",
							"onClose",
							function(selectedDate) {
								if (selectedDate.length == 10)
									$("#join_date").datepicker("option",
											"maxDate", selectedDate);
								else
									$("#join_date").datepicker("option",
											"maxDate", max);
							});
					$('#join_date').datepicker(
							"option",
							"onClose",
							function(selectedDate) {
								if (selectedDate.length == 10)
									$("#retire_date").datepicker("option",
											"minDate", selectedDate);
								else
									$("#retire_date").datepicker("option",
											"minDate", min);
							});
				});

		//검색
		function submit_search() {
			$.ajax({
					type : "POST",
					url : "/insaListForm.do",
					data : $("#search_Form").serialize(),
					contentType : "application/x-www-form-urlencoded; charset=utf-8",
					dataType : "json",
					success : function(data) {
						var list = JSON.stringify(data);
						console.log(list);
						console.log(data[0].sabun);
						if(data != null){
							var html = '';	
							
							for(key in data){
							html += '<tr>';
							html += '<td>'+data[key].sabun+'</td>';
							html += '<td>'+data[key].name+'</td>';
							html += '<td>'+data[key].reg_no+'</td>';
							html += '<td>'+data[key].hp+'</td>';
							html += '<td>'+data[key].hp+'</td>';
							html += '<td>'+data[key].hp+'</td>';
							html += '<td>'+data[key].hp+'</td>';
							html += '<td>'+data[key].hp+'</td>';
							html += '<td>'+data[key].hp+'</td>';
							html += '</tr>';	
							}
							$("#dynamicTbody").empty();
							$("#dynamicTbody").append(html);
						}
					},
					error : function(request, status, error) {
						alert("code:" + request.status + "\n" + "error:"+ error);
					}
				});
		}
	</script>
</body>
</html>
