<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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




		<main>
			<div class="container">
				<form class="form-inline" style="width: 100%">
					<div class="row">
						<div class="col">
							<div class="right">
								<p>
									사번 <input type="text"></input>
								</p>
								<p>
									직위 <input type="text"></input>
								</p>
							</div>
						</div>
						<div class="col">
							<div class="right">
								<p>
									사원명 <input type="text"></input>
								</p>
								<p>
									입사일 <input type="text"></input>
								</p>
							</div>
						</div>
						<div class="col">
							<div class="right">
								<p>
									입사구분 <input type="text" placeholder="자동생성"></input>
								</p>
								<p>
									퇴사일 <input type="text"></input>
								</p>
							</div>
						</div>
						<div class="col">
							<div class="right">
								<p>
									투입여부 <input type="text" placeholder="자동생성"></input>
								</p>
								<p>
									직종 <input type="text"></input>
								</p>
								
								<div class="inputBtn">
									<button type="button" class="btn btn-dark btn-sm">검색</button>
									<button type="button" class="btn btn-dark btn-sm">삭제</button>
									<button type="button" class="btn btn-dark btn-sm">초기화</button>			
									<button type="button" class="btn btn-dark btn-sm">이전</button>
								</div>
							</div>
						</div>
					</div>

				</form>
			</div>

		</main>

	</div>

</body>

</html>
