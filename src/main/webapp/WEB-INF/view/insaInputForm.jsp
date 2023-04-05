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


<link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/cover/">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<!-- 주소api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<title>인사시스템</title>
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

		<form id="submit_Form" method="post" enctype="multipart/form-data">
			<div class="inputBtn">
				<button type="button" class="btn btn-dark btn-sm" id="submitBtn" style="float: right" onclick="submit_check()">등록</button>
				<button type="button" class="btn btn-dark btn-sm" style="float: right" onClick="location.href='/index'">전화면</button>
				<button type="reset" class="btn btn-dark btn-sm" style="float: right">초기화</button>
			</div>


			<main>
				<div class="container">
					<div class="row">
						<div class="col" style="margin: auto; display: block;">
							<img id = "profile_img" src="resources/imgs/default_profile.png" /><br /> 
							<label class="btn-file" for="profile"> 사진올리기 </label>
							<input type="file" name="profile" id="profile" accept=".jpg,.pdf,.png" style="display:none;" onchange="readFile(event)">
						</div>
						<div class="col">
							<div class="right">
								<p>
									*사번 <input type="text" id="sabun" name="sabun" value="" readonly></input>
								</p>
								<p>
									*아이디 <input id="id" name="id" type="text"></input>
									<button type="button" class="id_chk_button btn-file ">중복확인</button> <input
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
									<button type="button" class="btn-file" onclick="execPostCode()">주소검색</button>
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
									*사원명 <input type="text" name="name" id="name" korOnly></input>
								</p>
								<p>
									*비밀번호 <input type="text" name="pwd_as" id="pwd_as"></input>
									<div id="msg">
									</div>
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
									*비밀번호 확인 <input type="text" id="pwd_chk_as" name="pwd_chk_as"></input>
									<input type="hidden" id="pwd_chk" name="pwd_chk"></input>
								</p>
								<p>
									*주민번호 <input type="text" id="reg_no1" name="reg_no1" maxlength="14" masking></input>
									<input type="hidden" id="reg_no" name="reg_no"></input>
									<input type="hidden" id="reg_no_masking" name="reg_no_masking" />
								</p>
								<p>
									연령 <input type="text" id="years" name="years" style="width: 80px" readonly></input> 
									성별 <select id="sex" name="sex" style="width: 80px;" disabled>
										<option value="">선택</option>
										<c:forEach items="${result }" var="item">
											<c:if test="${item.gubun eq 'A02'}">
												<option value="${item.gubun}${item.code}">
													${item.name}</option>
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
												<option value="${result.gubun}${result.code}"
												<c:if test="${result.code eq '002'}">selected</c:if>>
													${result.name}</option>
											</c:if>
										</c:forEach>
									</select>
								</p>
								<p>
									군별 <select id="mil_type" name="mil_type" disabled>
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
									KOSA등록 <select name="kosa_reg_yn" id="kosa_reg_yn">
										<option value="">선택</option>
										<c:forEach items="${result }" var="result">
											<c:if test="${result.gubun eq 'A11'}">
												<option value="${result.gubun}${result.code}"
												<c:if test="${result.code eq '002'}">selected</c:if>>
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
									계급 <select id="mil_level" name="mil_level" disabled>
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
									KOSA등급 <select name="kosa_class_code" id="kosa_class_code">
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
												<option value="${result.gubun}${result.code}"
												<c:if test="${result.code eq '002'}">selected</c:if>>
													${result.name}</option>
											</c:if>
										</c:forEach>
									</select>
								</p>
								<p>
									입영일 <input type="date" id="mil_startdate" name="mil_startdate" disabled></input>
								</p>
								<p>
									*입사일 <input type="date" id="join_date" name="join_date"></input>
								</p>
								<p>
									사업자등록증 <input type="text" class="fileName" id="fileName" name="fileName"></input>
								</p>
								<p>
									이력서 <input type="text" class="profileName" id="profileName" name="profileName"></input>
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
												<option value="${result.gubun}${result.code}"
												<c:if test="${result.code eq '002'}">selected</c:if>>
													${result.name}</option>
											</c:if>
										</c:forEach>
									</select>
								</p>
								<p>
									전역일 <input type="date" id="mil_enddate" name="mil_enddate" disabled></input>
								</p>
								<p>
									퇴사일 <input type="date" id="retire_date" name="retire_date"></input>
								</p>
								<p>
									<button class="btn-file reg_previewbtn" id="viewbtn" type="button">미리보기</button>
									<label class="btn-file" for=cmp_reg> 등록 </label> 
									<input type="file" name="cmp_reg" id="cmp_reg" class="cmp_reg" accept=".jpg,.pdf,.png" style="display:none;" onchange="javascript:document.getElementById('fileName').value = this.value">
								</p>
								<p>
									<button class="btn-file profile_previewbtn" type="button">미리보기</button>
									<label class="btn-file" for="carrier"> 파일 업로드 </label> <input
										type="file" name="carrier" id="carrier" class="carrier" accept=".jpg,.pdf,.png" style="display:none;" onchange="javascript:document.getElementById('profileName').value = this.value">
								</p>
							</div>
						</div>
					</div>
				</div>
				
				<!-- Modal -->				
				<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">등록</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        등록하시겠습니까?
				      </div>
				      <div class="modal-footer">
				      	<button type="button" class="btn btn-primary" id="modalSubmit">등록하기</button>
				       	<button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
				      </div>
				    </div>
				  </div>
				</div>
			</main>
		</form>
	</div>
	


	<script>
	/*유효성 체크*/
	function submit_check() {
		var form = $("#submit_Form");
		var name = $("#name");
		var id = $("#id");
		var pwd = $("#pwd");
		var pwd_as = $("#pwd_as");
		var pwd_chk = $("#pwd_chk");
		var pwd_chk_as = $("#pwd_chk_as");
		var hp = $("#hp");
		var email1 = $("#email1");
		var email = $("#email");
		var reg_no = $("#reg_no");
		var join_date = $("#join_date");
		var domainList = $("#domain-list");
		var domainInput = $("#domain-txt");
		
		if (name.val() == "") {
			alert("사원명을 입력하세요.");
			return false;
		}
		
		if (pwd_as.val() == "") {
			alert("패스워드를 입력하세요.");
			return false;
		}
		if (pwd_chk_as.val() == "") {
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
		if (pwd.val() != pwd_chk.val()) {
			alert('비밀번호를 확인해주세요.');
			return false;
		}
		
		if (reg_no.val() == "") {
			alert("주민번호를 입력하세요.");
			return false;
		}
		
		if (email1.val() == "" || domainList.val() == "" || domainInput.value == "") {
			alert("이메일을 입력하세요.");
			return false;
		}
		
		if (hp.val() == "") {
			alert("휴대폰번호를 입력하세요.");
			return false;
		}
		
		if (join_date.val() == "") {
			alert("입사일자를 입력하세요.");
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

		
		//첨부파일 확장자 체크
		var profile = $("#profileName").val();
		profile = profile.slice(profile.indexOf(".") + 1).toLowerCase();
		var cpm_reg = $("#fileName").val();
		cpm_reg = cpm_reg.slice(cpm_reg.indexOf(".") + 1).toLowerCase();
		if(profile !== '' && profile!= "jpg" && profile != "png" &&  profile != "pdf"){
			alert("이력서는 파일은 (jpg, png, gif) 형식만 등록 가능합니다.");
			return false;
		}else if(cpm_reg !== '' && cpm_reg != "jpg" && cpm_reg != "png" && cpm_reg != "pdf"){
			alert("사업자등록증은 파일은 (jpg, png, gif) 형식만 등록 가능합니다.");
			return false;
		}
		
  		
  		$("#exampleModal").modal();
	};
		
		//등록버튼 
		$("#modalSubmit").on("click",function(){
			var form = document.getElementById("submit_Form");
			modalClick(form);
		});


		//달력 
		$.datepicker.setDefaults({
			dateFormat : 'yy-mm-dd'
		});

		
		//datepicker
		$("#mil_startdate,#join_date,#mil_enddate,#retire_date").datepicker();

		//전역일이 입대보다 앞일 수 없게
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
		
		//입사일이 퇴사일보다 앞일 수 없게
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
		var pwd_as = document.querySelector("#pwd_as");
		pwd_as.onblur = function(e){
			var pwd_as = $('#pwd_as').val();
			$('#pwd').val(pwd_as);
			//console.log($('#pwd').val());
			var pwd_as_len = pwd_as.substring(0,pwd_as.length-1);
			var pwd_as_last = pwd_as.substring(pwd_as.length, pwd_as.length-1);
			var pwd_as_re = pwd_as_len.replace(/./g,"*") + pwd_as_last;
			$('#pwd_as').val(pwd_as_re);
		}
		
		//var pwd_chk_as = document.querySelector("#pwd_chk_as");
		pwd_chk_as.onblur = function(e){
			var pwd = $('#pwd_chk_as').val();
			$('#pwd_chk').val(pwd);
			//console.log($('#pwd_chk').val());
			var pwd_len = pwd.substring(0,pwd.length-1);
			var pwd_last = pwd.substring(pwd.length, pwd.length-1);
			var pwd_re = pwd_len.replace(/./g,"*") + pwd_last;
			$('#pwd_chk_as').val(pwd_re);
		}
		

		//비밀번호 확인
		    $(function(){
                $("#pwd_chk_as").on("blur",function(){
                    var msg = $("#msg").val();
                    if($("#pwd").val() == $("#pwd_chk").val()){
                        $("#msg").html("패스워드가 일치합니다.");
                        $("#msg").css("color","blue");
                        
                    }else{
                        $("#msg").html("패스워드가 일치하지 않습니다.");
                        $("#msg").css("color","red");
                    }
                })
            })

		
		//주민번호 마스킹
		$(document).on("keyup", "input[masking]", function() {
			var req = $(this).val().replace(/[^0-9]/g, '').replace(/^(\d{0,6})(\d{0,7})$/g, '$1-$2').replace(/-{1,2}$/g, ''); 
			var req1 = $(this).val().replace(/[^0-9]/g, '').replace(/^(\d{0,6})(\d{0,7})$/g, '$1-$2').replace(/-{1,2}$/g, '').replace(/(-?)([1-4]{1})([0-9]{6})\b/gi, "$1$2******"); 
			$(this).val(req1);
			$('#reg_no').val(req);
			if(req.length == 14){
				 genderChk();
				 ageChk();
				 $('#reg_no_masking').val($("#reg_no1").val());
				 console.log($('#reg_no').val());
				 console.log($('#reg_no_masking').val());
			}
		});
		
		//주민번호 성별체크
		function genderChk(){
			var reg_no = $('#reg_no').val();
			var reg_sp = reg_no.split('-');
			
			var reg1 = reg_sp[1];
			if(reg1[0] == 1 || reg1[0] == 3){ //남자
				$('#sex').val('A02002').prop("selected",true);
			}else if(reg1[0] == 2 || reg1[0] == 4){ //여자 
				$('#sex').val('A02001').prop("selected",true);
			}
		}
		
		//주민번호 연령체크
		function ageChk(){
			var today = new Date(); //현재 날짜,시간		
			var reg_no = $('#reg_no').val().split('-');
			var reg_age = reg_no[0]; //주민번호 앞 6자리
			var reg_no1 =$('#reg_no1');
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
			if(age <= 0 || mm <0 || mm > 12){
				alert("올바르지 않은 주민번호 입니다.");
				reg_no1.val('');
				return false;
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
							//체크 여부
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
		
		//연봉 천단위 콤마처리
		//document.getElementById("salary1").addEventListener("keyup", function (e) {
	   	//	$(this).val($(this).val().replace(/\,/g, '').replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'));
		//});
		document.getElementById("salary1").addEventListener("keyup", function (e) {
	   		$(this).val($(this).val().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		}); 
		//number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		
		var salary1 = document.querySelector("#salary1");
		salary1.onblur = function(e){ //포커스해지시
			var salary1 = $('#salary1').val();
			var salary_split = salary1.replaceAll(",","");
			var salary_split1 = Number(salary_split);
			$('#salary').val(salary_split1);
			console.log($('#salary').val());
				}
		
		//군필여부 
		var mil_yn = document.querySelector("#mil_yn");
		var mil_type = document.querySelector("#mil_type");
		var mil_level = document.querySelector("#mil_level");
		var mil_startdate = document.querySelector("#mil_startdate");
		var mil_enddate = document.querySelector("#mil_enddate");		
		
	
		mil_yn.addEventListener('change',(event) => {
			//console.log("milyn" + event.target.value);
			if(event.target.value !== "A08001"){
				mil_type.disabled = true;
				mil_level.disabled = true;
				mil_type.value="" ;
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
		
		var kosa_yn = document.querySelector("#kosa_reg_yn");
		var kosa_class_code = document.querySelector("#kosa_class_code");
		
		kosa_yn.addEventListener('change',(event) => {
			if(event.target.value !== "A11001"){
				kosa_class_code.disabled = true;
				kosa_class_code.value="" ;
				kosa_class_code.value=null ;
	
			}else{
				kosa_class_code.disabled = false;
				}
		});
		
		
		//등록하시겠습니까?
		function modalClick(formName){
			formName.action="insaInputForm.do";
			formName.method="post";
			formName.submit();
		}
		
		//사업자 미리보기 팝업
		$(".reg_previewbtn").on("click",function(){
			var a = $("#fileName").val();
			if(a == ''){
				alert("파일을 등록해주세요");
			}else{		
			var fileName = a.replace(/c:\\fakepath\\/i,'');
			var path = "/resources/imgs/" + fileName;
			var host = $(location).attr('host'); //현재 페이지의 메인 URL
			var url = "http://" + host + path;
			var status = "width=300px,height=300px";
			window.open(url,"popup",status);
			}
		});
	
		//이력서 미리보기 팝업
			$(".profile_previewbtn").on("click",function(){
			var a = $("#profileName").val();
			if(a == ''){
				alert("파일을 등록해주세요");
			}else{		
			var fileName = a.replace(/c:\\fakepath\\/i,'');
			var path = "/resources/imgs/" + fileName;
			var host = $(location).attr('host'); //현재 페이지의 메인 URL
			var url = "http://" + host + path;
			var status = "width=300px,height=300px";
			window.open(url,"popup",status);
			}
		});

		//프로필 미리보기
		function readFile(input){
			var input = event.target;
	
			var reader = new FileReader();
			reader.onload = function(){
			var dataURL = reader.result;
			$("#profile_img").attr("src", '');
			$("#profile_img").attr("src", dataURL);
			};
			reader.readAsDataURL(input.files[0]);
		}
		
		$(document).ready(function(){
			var String1 = '<c:out value="${success}"/>'; 
			if(String1 == "OK"){
				alert("등록이 완료되었습니다.");
			}
		});
	</script>
</body>
</html>
