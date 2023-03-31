<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


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
<script type="text/javascript"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
			<button type="button" class="btn btn-dark btn-sm" style="float: right" onclick="submit_check();">수정</button>
			<button type="button" class="btn btn-dark btn-sm" style="float: right" onclick="location.href='delete.do?sabun=${info[0].sabun}'">삭제</button>
			<button type="button" class="btn btn-dark btn-sm" style="float: right" onClick="location.href='/insaListForm.do'">이전</button>
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
									*사번 <input type="text" id="sabun" name="sabun" value="${info[0].sabun}" readonly></input>
								</p>
								<p>
									*아이디 <input id="id" name="id" type="text" value="${info[0].id}"></input>
									<button type="button" class="id_chk_button">중복확인</button> <input
										type="hidden" name="checked_id" >
								</p>
								<p>
									전화번호 <input type="text" id="phone" name="phone" maxlength="12" value="${info[0].phone}" phoneHp></input>
								</p>
								<p>
									*이메일 <input type="text" id="email1" style="width: 130px;" ekOnly></input>
									<input type="hidden" id="email" name="email"></input> @
									<input type="text" id="domain-txt" style="width: 70px;" value="${info[0].email}"  ekOnly />
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
									주소 <input type="number" placeholder="우편번호" name="zip" id="zip" value="${info[0].zip}" style="width: 130px;" readonly>
									<button type="button" onclick="execPostCode()">주소검색</button>
									</input>
								</p>
								<p>
									직위 <select name="pos_gbn_code">
										<option value="">선택</option>
										<c:forEach items="${result }" var="result">
											<c:if test="${result.gubun eq 'A04'}">
												<option value="${result.gubun}${result.code}"
													<c:if test="${info[0].pos_gbn_code == A03002}">selected</c:if>>
													${result.name}
													</option>
											</c:if>
										</c:forEach>
									</select>
								</p>
							</div>
						</div>
						<div class="col">
							<div class="right">
								<p>
									*사원명 <input type="text" name="name" id="name" value="${info[0].name}" korOnly></input>
								</p>
								<p>
									*비밀번호 <input type="text" name="pwd1" id="pwd1"></input>
									<input type="hidden" name="pwd" id="pwd"></input>
								</p>
								<p>
									*휴대폰번호 <input type="text" name="hp" id="hp" maxlength="13" value="${info[0].hp}" hpHyphen></input>
								</p>
								<p>
									직종 <select name="job_type">
										<option value="">선택</option>
										<c:set var="jobtypeValue" value="${info[0].job_type}" />
										<c:set var="jobSplit" value="$(fn:substring(jobtypeValue,3,6))" />
										<c:forEach items="${result }" var="result">
											<c:if test="${result.gubun eq 'A03'}">
												<option value="${result.gubun}${result.code}"
												<c:if test="${result.code eq jobSplit}">selected</c:if>>
													${result.name}
														
												</option>
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
									영문이름 <input type="text" id="eng_name" name="eng_name" value="${info[0].eng_name}" engOnly></input>
								</p>
								<p>
									*비밀번호 확인 <input type="text" id="pwd_chk1" name="pwd_chk1"></input>
									<input type="hidden" id="pwd_chk" name="pwd_chk"></input>
								</p>
								<p>
									*주민번호 <input type="text" id="reg_no1" name="reg_no1" maxlength="14" value="${info[0].reg_no}" masking></input>
									<input type="hidden" id="reg_no" name="reg_no"></input>
								</p>
								<p>
									연령 <input type="text" id="years" name="years" style="width: 80px" value="${info[0].years}" readonly>
									</input> 성별 <select id="sex" name="sex" style="width: 80px" value="${info[0].sex}" disabled>
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
									<input type="text" placeholder="세부주소" name="addr2" id="addr2" style="width: 100%;" value="${info[0].addr2}" readyonly></input>
								</p>
								<p>
									연봉 <input type="text" id="salary1" name="salary1" placeholder="(만원) "
										style="text-align: right" onKeyup="this.value=this.value.replace(/[^-0-9]/g,''); " value="${info[0].salary}"></input>
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
									사업자번호 <input type="text" name="cmp_reg_no" id="cmp_reg_no" maxlength="12" value="${info[0].cmp_reg_no}" comHyphen></input>
								</p>
								<p>
									자기소개 <input type="text" placeholder="100자 내외로 적으시오" id="self_intro" name="self_intro" style="width: 100%; height: 50px;" value="${info[0].self_intro}"></input>
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
									사업체명 <input type="text" id="crm_name" name="crm_name" value="${info[0].crm_name}"></input>
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
									입영일 <input type="date" id="mil_startdate" name="mil_startdate" value="${info[0].mil_startdate}"></input>
								</p>
								<p>
									*입사일 <input type="date" id="join_date" name="join_date" value="${info[0].join_date}"></input>
								</p>
								<p>
									사업자등록증 <input type="text" id="cmp_reg_image" name="cmp_reg_image"></input>
								</p>
								<p>
									이력서 <input type="text" id="carrier" name="carrier" value="${info[0].carrier}"></input>
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
									전역일 <input type="date" id="mil_enddate" name="mil_enddate" value="${info[0].mil_enddate}"></input>
								</p>
								<p>
									퇴사일 <input type="date" id="retire_date" name="retire_date" value="${info[0].retire_date}"></input>
								</p>
								<p>
									<button type="button">미리보기</button>
									<label class="btn-upload" for="file"> 등록 </label> 
									<input type="file" name="file" id="file">
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
	
	/*공백 유효성 검증*/
	function submit_check() {
		var form = document.getElementById("submit_Form");
		var name = document.getElementById("name");
		var id = document.getElementById("id");
		var pwd = document.getElementById("pwd");
		var pwd1 = document.getElementById("pwd1");
		var pwd_chk = document.getElementById("pwd_chk");
		var pwd_chk1 = document.getElementById("pwd_chk1");
		var hp = document.getElementById("hp");
		var email1 = document.getElementById("email1");
		var email = document.getElementById("email");
		var reg_no = document.getElementById("reg_no");
		var join_date = document.getElementById("join_date");
		
		if (pwd1.value == "") {
			alert("패스워드를 입력하세요.");
			return false;
		}
		if (pwd_chk1.value == "") {
			alert("패스워드 확인을 입력하세요.");
			return false;
		}
		
		//아이디 중복체크 여부
		if ($("input[name='checked_id']").val() == '') {
			alert('아이디 중복체크를 해주세요.');
			$("input[name='checked_id']").eq(0).focus();
			return false;
		}

		//비밀번호 확인 일치 여부
		if (pwd.value != pwd_chk.value) {
			alert('비밀번호를 확인해주세요.');
			return false;
		}
		
		if($("#zip").val() == null || $("#zip").val() == "") {
			$("#zip").val(null);
		}	
		
		if($("#salary").val() == null || $("#salary").val() == "") {
			$("#salary").val(null);
		}
		
		if($("#retire_date").val() == null || $("#retire_date").val() == "") {
			$("#retire_date").val(null);
			
		}

	  		 $("#sex").attr("disabled", false);
			form.submit();
		};

		
		//달력 
		$.datepicker.setDefaults({
			dateFormat : 'yy-mm-dd'
		});

		$("#mil_startdate,#join_date,#mil_enddate,#retire_date").datepicker();

		//전역, 입대일자 비교
		$(document).ready(function(){
			$('#mil_enddate').datepicker("option", "onClose", function (selectedDate) {
            	if(selectedDate.length==10)
                $("#mil_startdate").datepicker("option", "maxDate", selectedDate);
            	else
            		$("#mil_startdate").datepicker("option", "maxDate", max);
            });
            $('#mil_startdate').datepicker("option", "onClose", function (selectedDate) {
            	if(selectedDate.length==10)
                    $("#mil_enddate").datepicker("option", "minDate", selectedDate);
                else
                    $("#mil_enddate").datepicker("option", "minDate", min);
            });
			});
		
		//입사일, 퇴사일 비교
		$(document).ready(function(){
			$('#retire_date').datepicker("option", "onClose", function (selectedDate) {
            	if(selectedDate.length==10)
                $("#join_date").datepicker("option", "maxDate", selectedDate);
            	else
            		$("#join_date").datepicker("option", "maxDate", max);
            });
            $('#join_date').datepicker("option", "onClose", function (selectedDate) {
            	if(selectedDate.length==10)
                    $("#retire_date").datepicker("option", "minDate", selectedDate);
                else
                    $("#retire_date").datepicker("option", "minDate", min);
            });
			});

		//입력제한 유효성 검증
		$(document).on("keyup", "input[korOnly]", function() {
			$(this).val( $(this).val().replace(/[a-zA-Z]/,"") 
				);
		});
		
		$(document).on("keyup", "input[engOnly]", function() {
			$(this).val( $(this).val().replace(/[ㄱ-ㅎ가-힣]/g,"") 
				);
		});
		
		$(document).on("keyup", "input[ekOnly]", function() {
			$(this).val( $(this).val().replace(/[^a-zA-Z0-9]$/g,"") 
				);
		});
		
		//비밀번호 마스킹
		var pwd1 = document.querySelector("#pwd1");
		pwd1.onblur = function(e){
			var pwd1 = $('#pwd1').val();
			$('#pwd').val(pwd1);
			//console.log($('#pwd').val());
			var pwd1_len = pwd1.substring(0,pwd1.length-1);
			var pwd1_last = pwd1.substring(pwd1.length, pwd1.length-1);
			var pwd1_re = pwd1_len.replace(/./g,"*") + pwd1_last;
			$('#pwd1').val(pwd1_re);

			
		}
		
		//var pwd_chk1 = document.querySelector("#pwd_chk1");
		pwd_chk1.onblur = function(e){
			var pwd = $('#pwd_chk1').val();
			$('#pwd_chk').val(pwd);
			//console.log($('#pwd_chk').val());
			var pwd_len = pwd.substring(0,pwd.length-1);
			var pwd_last = pwd.substring(pwd.length, pwd.length-1);
			var pwd_re = pwd_len.replace(/./g,"*") + pwd_last;
			$('#pwd_chk1').val(pwd_re);
		}
		
		
		//주민번호 마스킹
		$(document).on("keyup", "input[masking]", function() {
			var req = $(this).val().replace(/[^0-9]/g, '').replace(/^(\d{0,6})(\d{0,7})$/g, '$1-$2').replace(/-{1,2}$/g, ''); 
			var req1 = $(this).val().replace(/[^0-9]/g, '').replace(/^(\d{0,6})(\d{0,7})$/g, '$1-$2').replace(/-{1,2}$/g, '').replace(/(-?)([1-4]{1})([0-9]{6})\b/gi, "$1$2******"); 
			$(this).val(req1);
			$('#reg_no').val(req);
			if(req.length == 14){
				 genderChk();
				 ageChk();
			}
		});
		
		//주민번호 성별체크
		function genderChk(){
			var reg_no = $('#reg_no').val();
			var reg_sp = reg_no.split('-');
			var reg1 = reg_sp[1];
			if(reg1[0] == 1 || reg1[0] == 3){
				console.log("남");
				$('#sex').val('남자').prop("selected",true);
			}else if(reg1[1] == 2 || reg1[0] == 4){
				$('#sex').val('여자').prop("selected",true);
			}
		}

		
		//주민번호 연령체크
		function ageChk(){
			var today = new Date(); //현재 날짜,시간		
			var reg_no = $('#reg_no').val().split('-');
			var reg_age = reg_no[0]; //주민번호 앞 6자리
			var reg_age2 = reg_no[1].substr(0,1); //주민번호 뒷자리
			var birthDate = null;
			var age=0;
			var monthChk = 0;
			var yy = null;
			var mm = reg_age.substr(2,2);//월
			var dd = reg_age.substr(4,2) //일
			
			if(reg_age2 == 1 || reg_age2 == 2){
				yy = '19' + reg_age.substr(0,2);
				birthDate = new Date(yy*1, mm-1, dd*1);
				age = today.getFullYear() - birthDate.getFullYear();
				monthChk = today.getMonth() - birthDate.getMonth();
				if(monthChk < 0 || (monthChk === 0 && today.getDate() < birthDate.getDate())){
					age--;
				}
			}else{
				yy = '20' + reg_age.substr(0,2);
				birthDate = new Date(yy*1, mm-1, dd*1);
				age = today.getFullYear() - birthDate.getFullYear();
				monthChk = today.getMonth() - birthDate.getMonth();
				if(monthChk < 0 || (monthChk === 0 && today.getDate() < birthDate.getDate())){
					age--;
				}
			}
			$('#years').val(age);

		}
		
		//휴대폰 번호 하이픈
		//.substring(0, number.length - 6) + "******");
		$(document).on("keyup", "input[hpHyphen]", function() {
				$(this).val( $(this).val().replace(/[^0-9]/g, '').replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, '$1-$2-$3').replace(/-{1,2}$/g, ''));
			});
		
		//전화번호 
		$(document).on("keyup", "input[phoneHp]", function() { 
			$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/^(\d{0,2})(\d{0,4})(\d{0,4})$/g, '$1-$2-$3').replace(/-{1,2}$/g, ''));
		});
		
		
		//사업자 번호 하이픈
		$(document).on("keyup", "input[comHyphen]", function() {
				$(this).val( $(this).val().replace(/[^0-9]/g, '').replace(/^(\d{0,3})(\d{0,2})(\d{0,5})$/g, '$1-$2-$3').replace(/-{1,2}$/g, ''));
			});
	
		//주소검색 api
		function execPostCode() {
         new daum.Postcode({
             oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                console.log(data.zonecode);
                console.log(fullRoadAddr);
                
                
                $("[name=zip]").val(data.zonecode);
                $("[name=addr1]").val(fullRoadAddr);
                
                /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
                document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
            }
         }).open();
     }
		
		//아이디 중복체크
		$('.id_chk_button').click(function() {
			var memberId = $('#id').val();
			console.log(memberId);
			var data = {
				memberId : memberId
			}
			var RegExp = /[a-zA-Z0-9]$/;
			
			//아이디 중복확인
			if (memberId == '') {
				alert("아이디를 입력하세요.");
				return false;
			} else if (!RegExp.test(memberId)) {
				alert("ID는 영문자와 숫자로만 입력하여 주세요.");
				$('#id').val("");
				return false;
			} else if (memberId.match(RegExp)) {
				
				$.ajax({
					type : "post",
					url : "/memberIdChk",
					data : data,
					success : function(result) {
						if (result == "fail") {
							alert("사용 불가한 아이디입니다.");
							$('.id').val("");
						} else {
							//체크 여부 확인
							$("input[name=checked_id]").val('y');
							alert("사용 가능한 아이디 입니다.");
						}
					}
				});
			}
		});

		//이메일 직접입력 or 선택
		var email = document.querySelector('#email')
		var email1 = document.querySelector('#email1')
		var domainList = document.querySelector('#domain-list')
		var domainInput = document.querySelector('#domain-txt')
		// select 옵션 변경 시
		domainList.addEventListener('change', (event) => {
		  // option에 있는 도메인 선택 시
		  if(event.target.value !== "type") {
		    // 선택한 도메인을 input에 입력하고 disabled
		    domainInput.value = event.target.value
		    domainInput.disabled = true
		    email.value = email1.value + "@" + domainInput.value;
		    console.log(email.value);
		  } else { // 직접 입력 시
		    // input 내용 초기화 & 입력 가능하도록 변경
		    domainInput.value = ""
		    domainInput.disabled = false
		    email.value = email1.value + domainInput;
		    console.log(email.value);
		  }
		});
		
		//email split
		$( document ).ready(function() {
			var email = "<c:out value='${info[0].email}' />";
			console.log(email);
			var email_sp = email.split("@");
			var email_sp1 = email_sp[0];
			console.log(email_sp1);
			var email_sp2 = email_sp[1];
			console.log(email_sp2);
			$("#email1").val(email_sp1);
			$("#domain-txt").val(email_sp2);
		});


		
		
		//연봉 천단위 콤마처리
		document.getElementById("salary1").addEventListener("keyup", function (e) {
	   		$(this).val($(this).val().replace(/\,/g, '').replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'));
		});
		
		var salary1 = document.querySelector("#salary1");
		salary1.onblur = function(e){
			var salary1 = $('#salary1').val();
			var salary_split = salary1.replace(",","");
			var salary_split1 = Number(salary_split);
			$('#salary').val(salary_split1);
			//console.log($('#salary').val());
				}
		
		
		
		//군필여부 
		var mil_yn = document.querySelector("#mil_yn");
		var mil_type = document.querySelector("#mil_type");
		var mil_level = document.querySelector("#mil_level");
		var mil_startdate = document.querySelector("#mil_startdate");
		var mil_enddate = document.querySelector("#mil_enddate");		
		
		mil_yn.addEventListener('change',(event) => {
			if(event.target.value !== "Y"){
				mil_type.disabled = true;
				mil_level.disabled = true;
				mil_type.value="Y" ;
				mil_level.value="" ;
				//$("#mil_startdate").val(null);
				mil_startdate.value=null;
				mil_enddate.value=null;
				$("#mil_startdate").datepicker('option', 'disabled', true);
				$("#mil_enddate").datepicker('option', 'disabled', true);
				
			}else{
				mil_type.disabled = false;
				mil_level.disabled = false;
				$("#mil_startdate").datepicker('option', 'disabled', false);
				$("#mil_enddate").datepicker('option', 'disabled', false);
			}
		});
		
	
	</script>
</body>

</html>
