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

<link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/cover/">

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
		<form id="submit_Form" method="post">
		<div class="inputBtn">
			<button type="button" class="btn btn-dark btn-sm" style="float: right">수정</button>
			<button type="button" class="btn btn-dark btn-sm" style="float: right">삭제</button>
			<button type="button" class="btn btn-dark btn-sm" style="float: right">이전</button>
		</div>

			<main>
				<div class="container">
					<div class="row">
						<div class="col" style="margin: auto; display: blcok;">
							<img src="resources/user.png" /><br /> <label
								class="btn-upload" for="file"> 사진올리기 </label> <input type="file"
								name="file" id="file">
						</div>
						<div class="col">
							<div class="right">
								<p>
									*사번 <input type="text" id="sabun" name="sabun" value="${info.sabun }" readonly></input>
								</p>
								<p>
									*아이디 <input id="id" name="id" type="text"></input>
									<button type="button" class="id_chk_button">중복확인</button> <input
										type="hidden" name="checked_id" value="">
								</p>
								<p>
									전화번호 <input type="text" id="phone" name="phone" maxlength="12" phoneHp></input>
								</p>
								<p>
									*이메일 <input type="text" id="email1" style="width: 130px;" ekOnly></input>
									<input type="hidden" id="email" name="email"></input> @
									<input type="text" id="domain-txt" style="width: 70px;" ekOnly />
									<select class="box" id="domain-list" style="width: 70px;">
										<option value="">선택</option>
										<option value="type">직접입력</option>
										<option value="naver.com">naver.com</option>
										<option value="google.com">google.com</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="nate.com">nate.com</option>
										<option value="kakao.com">kakao.com</option>
									</select>
								</p>
								<p>
									주소 <input type="number" placeholder="우편번호" name="zip" id="zip" style="width: 130px;" readonly>
									<button type="button" onclick="execPostCode()">주소검색</button>
									</input>
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
									*사원명 <input type="text" name="name" id="name" value="${info.name }" korOnly></input>
								</p>
								<p>
									*비밀번호 <input type="text" name="pwd1" id="pwd1"></input>
									<input type="hidden" name="pwd" id="pwd"></input>
								</p>
								<p>
									*휴대폰번호 <input type="text" name="hp" id="hp" maxlength="13" hpHyphen></input>
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
								<p>
									<input type="text" placeholder="주소" name="addr1" id="addr1" style="width: 100%;" readyonly></input>
								</p>
								<p>
									부서 <select name="dept_code">
										<option value="">선택</option>
										<c:forEach items="${result }" var="result">
											<c:if test="${result.gubun eq 'A05'}">
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
									영문이름 <input type="text" id="eng_name" name="eng_name" engOnly></input>
								</p>
								<p>
									*비밀번호 확인 <input type="text" id="pwd_chk1" name="pwd_chk1"></input>
									<input type="hidden" id="pwd_chk" name="pwd_chk"></input>
								</p>
								<p>
									*주민번호 <input type="text" id="reg_no1" name="reg_no1" maxlength="14" masking></input>
									<input type="hidden" id="reg_no" name="reg_no"></input>
								</p>
								<p>
									연령 <input type="text" id="years" name="years" style="width: 80px" readonly>
									</input> 성별 <select id="sex" name="sex" style="width: 80px" disabled>
										<option value="">선택</option>
										<c:forEach items="${result }" var="result">
											<c:if test="${result.gubun eq 'A02'}">
												<option value="${result.name}">
													${result.name}</option>
											</c:if>
										</c:forEach>
									</select>
								</p>
								<p>
									<input type="text" placeholder="세부주소" name="addr2" id="addr2" style="width: 100%;" readyonly></input>
								</p>
								<p>
									연봉 <input type="text" id="salary1" name="salary1" placeholder="(만원)"
										style="text-align: right" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');"></input>
										<input type="hidden" id="salary" name="salary"></input>
								</p>
							</div>
						</div>
					</div>
					<br />
					<div class="row">
						<div class="col">
							<div class="right">
								<p>
									입사구분 <select name="join_gbn_code">
										<option value="">선택</option>
										<c:forEach items="${result }" var="result">
											<c:if test="${result.gubun eq 'A01'}">
												<option value="${result.gubun}${result.code}" >
													${result.name}</option>
											</c:if>
										</c:forEach>
									</select>
								</p>
								<p>
									군별 <select id="mil_type" name="mil_type">
										<option value="">선택</option>
										<c:forEach items="${result }" var="result">
											<c:if test="${result.gubun eq 'A09'}">
												<option value="${result.gubun}${result.code}">
													${result.name}</option>
											</c:if>
										</c:forEach>
									</select>
								</p>
								<p>
									KOSA등록 <select name="kosa_reg_yn">
										<option value="">선택</option>
										<c:forEach items="${result }" var="result">
											<c:if test="${result.gubun eq 'A11'}">
												<option value="${result.gubun}${result.code}">
													${result.name}</option>
											</c:if>
										</c:forEach>
									</select>
								</p>
								<p>
									사업자번호 <input type="text" name="com_reg_no" id="com_reg_no" maxlength="12" comHyphen></input>
								</p>
								<p>
									자기소개 <input type="text" placeholder="100자 내외로 적으시오"
										style="width: 100%; height: 50px;"></input>
								</p>
							</div>
						</div>

						<div class="col">
							<div class="right">
								<p>
									최종학력 <select name="gart_level">
										<option value="">선택</option>
										<c:forEach items="${result }" var="result">
											<c:if test="${result.gubun eq 'A06'}">
												<option value="${result.gubun}${result.code}">
													${result.name}</option>
											</c:if>
										</c:forEach>
									</select>
								</p>
								<p>
									계급 <select id="mil_level" name="mil_level">
										<option value="">선택</option>
										<c:forEach items="${result }" var="result">
											<c:if test="${result.gubun eq 'A10'}">
												<option value="${result.gubun}${result.code}">
													${result.name}</option>
											</c:if>
										</c:forEach>
									</select>
								</p>
								<p>
									KOSA등급 <select name="kosa_class_code">
										<option value="">선택</option>
										<c:forEach items="${result }" var="result">
											<c:if test="${result.gubun eq 'A12'}">
												<option value="${result.gubun}${result.code}">
													${result.name}</option>
											</c:if>
										</c:forEach>
									</select>
								</p>
								<p>
									사업체명 <input type="text"></input>
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
									입영일 <input type="date" id="mil_startdate" name="mil_startdate"></input>
								</p>
								<p>
									*입사일 <input type="date" id="join_date" name="join_date"></input>
								</p>
								<p>
									사업자등록증 <input type="text"></input>
								</p>
								<p>
									이력서 <input type="text"></input>
								</p>
							</div>
						</div>
						<div class="col">
							<div class="right">
								<p>
									군필여부 <select id="mil_yn" name="mil_yn">
										<option value="">선택</option>
										<c:forEach items="${result }" var="result">
											<c:if test="${result.gubun eq 'A08'}">
												<option value="${result.name}">
													${result.name}</option>
											</c:if>
										</c:forEach>
									</select>
								</p>
								<p>
									전역일 <input type="date" id="mil_enddate" name="mil_enddate"></input>
								</p>
								<p>
									퇴사일 <input type="date" id="retire_date" name="retire_date"></input>
								</p>
								<p>
									<button type="button">미리보기</button>
									<label class="btn-upload" for="file"> 등록 </label> <input
										type="file" name="file" id="file">
								</p>
								<p>
									<button type="button">미리보기</button>
									<label class="btn-upload" for="file"> 파일 업로드 </label> <input
										type="file" name="file" id="file">
								</p>
							</div>
						</div>
					</div>
				</div>
			</main>
		</form>
	</div>

</body>

</html>
