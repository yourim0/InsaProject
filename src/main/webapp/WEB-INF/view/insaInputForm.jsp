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
<script type="text/javascript"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
				<button type="button" class="btn btn-dark btn-sm" id="submitBtn"
					style="float: right" onclick="submit_check()">등록</button>
				<button type="button" class="btn btn-dark btn-sm"
					style="float: right" onClick="location.href='/index'">전화면</button>
				<button type="button" class="btn btn-dark btn-sm"
					style="float: right">초기화</button>
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
									*사번 <input type="text" id="sabun" name="sabun" placeholder="자동생성"></input>
								</p>
								<p>
									*아이디 <input id="id" name="id" type="text"></input>
								</p>
								<p>
									전화번호 <input type="text"></input>
								</p>
								<p>
									*이메일 <input type="text" style="width: 130px;"></input> @ <select
										name="email" id="id" style="width: 60px;">
										<option value="1">선택</option>
									</select>
								</p>
								<p>
									주소 <input type="text" placeholder="우편번호" style="width: 130px;">
									<button type="button">주소검색</button>
									</input>
								</p>
								<p>
									직위 <select name="pos_gbn_code">
										<option value="">선택</option>
									</select>
								</p>
							</div>
						</div>
						<div class="col">
							<div class="right">
								<p>
									*사원명 <input type="text" name="name" id="name" korOnly></input>
								</p>
								<p>
									*비밀번호 <input type="text" name="pwd" id="pwd"></input>
								</p>
								<p>
									*휴대폰번호 <input type="text" name="hp" id="hp"></input>
								</p>
								<p>
									직종 <select name="job_type">
										<option value="">선택</option>
										<c:forEach items="${result }" var="result">
											<option value="${result.name}"
												<c:if test="${(job_type) == (result.name)}"> selected </c:if>>
											${result.name}
											</option>
										</c:forEach>
									</select>
								</p>
								<p>
									<input type="text" placeholder="주소" style="width: 100%;"></input>
								</p>
								<p>
									부서 <select name="">
										<option value="">선택</option>
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
									*비밀번호 확인 <input type="text" id="pwd_chk" name="pwd_chk"></input>
								</p>
								<p>
									*주민번호 <input type="text" id="reg_no" name="reg_no"></input>
								</p>
								<p>
									연령 <input type="text" style="width: 80px"></input> 성별 <select
										name="" style="width: 80px">
										<option value="">선택</option>
									</select>
								</p>
								<p>
									<input type="text" placeholder="세부주소" style="width: 100%;"></input>
								</p>
								<p>
									연봉 <input type="text" placeholder="(만원)"
										style="text-align: right"></input>
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
									</select>
								</p>
								<p>
									군별 <select name="mil_type">
										<option value="">선택</option>
									</select>
								</p>
								<p>
									KOSA등록 <select name="kosa_reg_yn">
										<option value="">선택</option>
									</select>
								</p>
								<p>
									사업자번호 <input type="text"></input>
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
									등급 <select name="grade">
										<option value="">선택</option>
									</select>
								</p>
								<p>
									계급 <select name="mil_level">
										<option value="">선택</option>
									</select>
								</p>
								<p>
									KOSA등급 <select name="kosa_class_code">
										<option value="">선택</option>
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
									</select>
								</p>
								<p>
									입영일 <input type="text" id="dapi1"></input>
								</p>
								<p>
									*입사일 <input type="text" id="join_date" name="join_date"></input>
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
									군필여부 <select name="mil_yn">
										<option value="">선택</option>
									</select>
								</p>
								<p>
									전역일 <input type="text" id="dapi3"></input>
								</p>
								<p>
									퇴사일 <input type="text" id="dapi4"></input>
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

	<script>
	
	/*입력제한 유효성 검증*/	
	
	$(document).on("keyup", "input[korOnly]", function() {
		$(this).val( $(this).val().replace(/[a-zA-Z]/,"") 
			);
	});
	
	$(document).on("keyup", "input[engOnly]", function() {
		$(this).val( $(this).val().replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/,"") 
			);
	});
	
	/*공백 유효성 검증*/
	function submit_check() {
		var form = document.getElementById("submit_Form");
		var sabun = document.getElementById("sabun");
		var name = document.getElementById("name");
		var id = document.getElementById("id");
		var pwd = document.getElementById("pwd");
		var pwd_chk = document.getElementById("pwd_chk");
		var hp = document.getElementById("hp");
		var email = document.getElementById("email");
		var reg_no = document.getElementById("reg_no");
		var join_date = document.getElementById("join_date");
		
		var engName = /[a-zA-Z]/;
		var korName = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		var RegExp = /^[a-zA-Z0-9]{4,12}$/; //id와 유효성 검사 정규식
		var RegExpPw = /^(?=.*[a-zA-Z])((?=.*\d)(?=.*\W)).{8,16}$/;//password 유효성 검사 정규식
		var RegExpTest = /^[0-9]{4}$/; //전화번호 유효성검사
		var tel_1 = $("#tel_1").val();
		var tel_2 = $("#tel_2").val();
		var tel_3 = $("#tel_3").val();
		var phoneNum = "";
		phoneNum = tel_1 + "-" + tel_2 + "-" + tel_3;
		//console.log("phonenum : " + phoneNum);
		$("#phoneNum").val(phoneNum);
		
		if (sabun.value == "") {
			alert("사번을 입력하세요.");
			return false;
		} 
		if (pwd.value == "") {
			alert("패스워드를 입력하세요.");
			return false;
		}
		if (pwck_input.value == "") {
			alert("패스워드 확인을 입력하세요.");
			return false;
		}
		if (!tel_1) {
			alert("올바른 휴대전화를 입력하세요.");
			return false;
		}
		if (!tel_2) {
			alert("올바른 휴대전화를 입력하세요.");
			return false;
		}
		if (!tel_3) {
			alert("올바른 휴대전화를 입력하세요.");
			return false;
		}
		//아이디 중복체크 여부
		if ($("input[name='checked_id']").val() == '') {
			alert('아이디 중복체크를 해주세요.');
			$("input[name='checked_id']").eq(0).focus();
			return false;
		}
		
		//영문명 형식검사
		if (!engName.test(engName.value)) {
			alert("영문만 입력해주세요.");
			return false;
		}
		
		//한글명 형식검사
		if (!korName.test(name.value)) {
		alert("한글만 입력해주세요.");
		return false;
		}
		
		//비밀번호 확인 일치 여부
		if (pw.value != pwck.value) {
			alert('올바른 비밀번호를 입력해주세요.');
			return false;
		}
		//패스워드 형식검사
		if (!RegExpPw.test(pwck.value)) {
			alert("비밀번호는 문자, 숫자, 특수문자가 각각 최소 1개 이상 포함, 최소 8자리로 입력하여 주세요.");
			return false;
		}
		//휴대폰 번호 검사
		if (!RegExpTest.test(tel_2)) {
			alert('숫자 4자리를 입력해주세요.');
			return false;
		}
		if (!RegExpTest.test(tel_3)) {
			alert('숫자 4자리를 입력해주세요.');
			return false;
		}
		form.submit();
	
		//달력 
		$.datepicker.setDefaults({
			dateFormat : 'yy-mm-dd',
		});

		$(function() {
			$("#dapi1,#join_date,#dapi3,#dapi4").datepicker();
		});

	};
	</script>


</body>
</html>
