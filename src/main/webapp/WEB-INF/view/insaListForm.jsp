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
		<main>
			<input id="hidden_num" type="hidden"></input>
			<form id="search_Form" method="post">
				<div class="container">
					<div class="row">
						<div class="col">
							<div class="right">
								<p>
									사번 <input type="text" id="sabun" name="sabun"></input>
								</p>
								<p>
									직위 <select name="pos_gbn_code" id="pos_gbn_code">
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
									사원명 <input type="text" name="name" id="name"  korOnly></input>
								</p>
								<p>
									입사일 <input type="text" id="join_date" name="join_date"></input>
								</p>
							</div>
						</div>
						<div class="col">
							<div class="right">
								<p>
									입사구분 <select name="join_gbn_code" id="join_gbn_code">
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
									퇴사일 <input type="text" id="retire_date" name="retire_date"></input>
								</p>
							</div>
						</div>
						<div class="col">
							<div class="right">
								<p>
									투입여부 <select name="put_yn" id="put_yn">
										<option value="">선택</option>
										<c:forEach items="${result}" var="result">
											<c:if test="${result.gubun eq 'A07'}">
												<option value="${result.gubun}${result.code}">
													${result.name}</option>
											</c:if>
										</c:forEach>
									</select>
								</p>
								<p>
									직종 <select name="job_type" id="job_type">
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
									<button type="button" id="search" class="btn btn-dark btn-sm">검색</button>
									<button type="button" id="delBtn" class="btn btn-dark btn-sm" >삭제</button>
									<button type="reset" class="btn btn-dark btn-sm" onclick="resetTable();">초기화</button>
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
						<th></th>
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
				<td></td>
				<td colspan="9">검색된 데이터가 없습니다</td>
				</tbody>
			</table>
			<div id="paging"></div>
			<span id="si"></span>
		</div>
		<!-- 삭제 Modal Start-->				
		<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="deleteModalLabel">삭제</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        삭제하시겠습니까?
		      </div>
		      <div class="modal-footer">
		      	<button type="button" class="btn btn-primary" id="delSubmit">삭제하기</button>
		       	<button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
		    	</div>
		   	 </div>
		  	</div>
		</div>
		<!-- 삭제 Modal end -->
	</div>

	<script>

	//삭제 모달
		$("#delBtn").click(function(){ //삭제버튼
			$("#deleteModal").modal(); 
			$("#delSubmit").on("click",function(){ //모달안의 버튼
			    // 체크한 항목을 담을 배열 선언
			    var arr = [];
			    // 체크한 항목만 취득
			    var checked = $("input[name='delChk']:checked");
			   	var length = $("input[name='delChk']:checked").length;
			   	console.log(length);
			    if(length == 0){
			    	alert("삭제할 항목을 체크해주세요");
			    }else{
			    $(checked).each(function() {
			    	arr.push($(this).val());
			    });
			    var param = {"sabunList" : arr};
				$.ajax({
					url:"delete.do",
					dataType    :   "json",
	                contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
					type : "post",
					data : param,
					success:function(result){
						if(result.code == "OK"){
							alert(result.message);
							getPaging($("#hidden_num").val());
							$('#deleteModal').modal('hide');
							//location.replace("insaListForm.do");
							
						}else{
							alert(result.message);
						}
						
					},error : function(error){
						alert("error");
					}
				
				})
			   }
			});
		});
	
		//입사일,퇴사일
		$.datepicker.setDefaults({
			dateFormat : 'yy-mm-dd'
		});

		$("#retire_date").datepicker();
		$("#join_date").datepicker();
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
				
	
		var urlObj = new URL(location.href);
		var urlParams = new URLSearchParams(urlObj.search);
		console.log(urlParams)
		if(urlParams.has('num')){
			for (const key of urlParams.keys()) {
				var value = urlParams.get(key);
				//console.log("value" + value);
				if(key != 'num'){
					console.log("key" + key);
					console.log("value" + value);
					if(value != undefined){
						console.log($("#"+key));
						if(key == 'name' || key == 'join_date' || key == 'retire_date'){
							// 인풋 구간
							$("#"+key).val(value);
							
						}else if(key == 'sabunSch'){
							$("#sabun").val(value);
						}else if(key == 'put_yn' || key == 'pos_gbn_code' || key == 'join_gbn_code' || key == 'job_type'){
							
							//console.log(value);
							// 셀렉트 박스 구간
							//$("#"+key).val(value);
							$("#"+key).val(value).prop("selected", true);
							//console.log("zzz" + $("#"+key).val());
						}
						
						//$("#"+key).val(value);
					}	
				}
			}
			getPaging(urlParams.get('num'));
		}
				});
		//초기화 버튼
		function resetTable(){
			var html = '<td></td><td colspan="9">검색된 데이터가 없습니다</td>';
			$("#dynamicTbody").empty();
			$("#dynamicTbody").append(html);
			$("#paging").empty();
		}
		
		//검색 버튼
		$("#search").click(function(){ 
			getPaging(1);
		});
		
		function si(num){
			console.log("getPaging si");
			console.log(num);
			$("#hidden_num").val(num)
			getPaging(num);
		};

		//페이징처리
		function getPaging(num){
			$.ajax({
				url:`/getListWithPaging?num=${'${num}'}`,
				type:'GET',
				data :$("#search_Form").serialize(),
				contentType : "application/x-www-form-urlencoded; charset=utf-8",
				dataType : "json",
				success : function(data) {
					//var list = JSON.stringify(data);
					var list = data.list;
					var prev = data.prev;
					var next = data.next;
					var startPageNum = data.startPageNum;
					var endPageNum = data.endPageNum;
					var num = data.num;
					$("#hidden_num").val(num);
					var sabunSch = $("#sabun").val();
					var name = $("#name").val();
					var pos_gbn_code = $("#pos_gbn_code option:selected").val();
					var join_date = $("#join_date").val();
					var join_gbn_code = $("#join_gbn_code option:selected").val();
					var retire_date = $("#retire_date").val();
					var put_yn = $("#put_yn option:selected").val();
					var job_type = $("#job_type option:selected").val();
					
					console.log(sabunSch);
					
					//console.log(`${'${data.pageNum}'}`);
					if(list.length < 1){ //자바단에서 9999면 else로 비교 list 있으면 0000 (js에서는 보여주기만) 처리하는게 좋다
						var html = '';
						html = '<td></td><td colspan="9">검색된 데이터가 없습니다</td>';
						$("#dynamicTbody").empty();
						$("#dynamicTbody").append(html);
					}else{
						var html = ``;	
						var pos;
						var put;
						for(key in list){
							
							//var name = encodeURI(list[key].name,"UTF-8");
							
							if(list[key].retire_date === null){
								list[key].retire_date = '';
							}
							if(list[key].put_yn === null){
								list[key].put_yn = '';
							}
							if(list[key].salary === null){
								list[key].salary = '';
							}
							
						html += `<tr>`;
						//html += `<td onClick="location.href='/insaUpdateForm.do?sabun=${'${data[key].sabun}'}'"> ${'${data[key].sabun}'}</td>`; 링크제거
						html += `<td><input style="width:15px;height:15px;" type="checkbox" name="delChk" value=${'${list[key].sabun}'}></td>`;
						//html += `<td><a href="#" onclick="updateInfo(this);"> ${'${list[key].sabun}'} </a></td>`;
						html += `<td><a href="/insaUpdateForm.do?num=${'${num}'}&sabun=${'${list[key].sabun}'}&sabunSch=${'${sabunSch}'}&searchName=${'${name}'}&searchJoin_gbn_code=${'${join_gbn_code}'}&searchPos_gbn_code=${'${pos_gbn_code}'}&searchJoin_day=${'${join_date}'}&searchRetire_day=${'${retire_date}'}&searchPut_yn=${'${put_yn}'}&searchJob_type=${'${job_type}'}"> ${'${list[key].sabun}'} </a></td>`;
						html += `<td>${'${list[key].name}'}</td>`;
						html += `<td>${'${list[key].reg_no_masking}'}</td>`;
						html += `<td>${'${list[key].hp}'}</td>`;
						if(list[key].pos_gbn_code === 'A04001'){
							pos = '사원';
						}else if(list[key].pos_gbn_code === 'A04002'){
							pos ='주임';
						}else if(list[key].pos_gbn_code === 'A04003'){
							pos ='대리';
						}else if(list[key].pos_gbn_code === 'A04004'){
							pos ='과장';
						}else if(list[key].pos_gbn_code === 'A04005'){
							pos ='차장';
						}else{
							pos='';
						}
						html += `<td>` + pos + `</td>`;
						html += `<td>${'${list[key].join_date}'}</td>`;
						html += `<td>${'${list[key].retire_date}'}</td>`;
						if(list[key].put_yn === 'A07001'){
							put = 'Y';
						}else if(list[key].put_yn === 'A07002'){
							put = 'N';
						}else{
							put = '';
						}
						html += `<td>` + put + `</td>`;
						html += `<td>${'${list[key].salary}'}</td>`;
						html += `</tr>`;	
						}
						var a = "";	
						
						//for(num in `${'${data.pageNum}'}`){
							
						if(prev){
							a += `<span id="si" onclick="si(${'${startPageNum - 1}'})"> [ 이전 ]</span>&nbsp;&nbsp;`;
						}
						
						for(var i = data.startPageNum; i <= data.endPageNum; i++){
							if(num != i){
								a += `<span id="si" value=${'${i}'} onclick="si(${'${i}'})">${'${i}'}</span>&nbsp;&nbsp;`;
							}else if(num == i){
								a += `<span id="si" value=${'${i}'} style="color:blue;">${'${i}'}</span>&nbsp;&nbsp;`;
							}
							
							//a += `<span><a href=/getListWithPaging?num=\${i}>\${i}</a></span>`;
							 
							//이스케이프 문자->문자열로 보지 않게함)
							 //a += `${i}`;
							 //console.log(`${'${i}'}`);
						}
						if(next){
							a += `<span id="si" onclick="si(${'${endPageNum + 1}'})"> [ 다음 ]</span>&nbsp;&nbsp;`;
							}
						$("#paging").empty();
						$("#paging").append(a);
						$("#dynamicTbody").empty();
						$("#dynamicTbody").append(html);
					}
				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "error:"+ error);
				}
			});
		}
			
		var String1 = '${success}';
		if(String1 == "OK"){
			alert("삭제가 완료되었습니다.");
		};
		
	</script>
</body>
</html>
