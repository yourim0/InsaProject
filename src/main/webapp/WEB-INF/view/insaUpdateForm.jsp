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
<title>�λ�ý���</title>

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

		<div class="inputBtn">
			<button type="button" class="btn btn-dark btn-sm">����</button>
			<button type="button" class="btn btn-dark btn-sm">����</button>
			<button type="button" class="btn btn-dark btn-sm">����</button>
		</div>

		<main>
			<div class="container">
				<form class="form-inline" style="width: 100%">
					<div class="row">
						<div class="col" style="margin: auto; display: blcok;">
							<img src="resources/user.png" /><br />
							<button type="button">�����ø���</button>
						</div>
						<div class="col">
							<div class="right">
								<p>
									��� <input type="text" placeholder="�ڵ�����"></input>
								</p>
								<p>
									���̵� <input type="text"></input>
								</p>
								<p>
									��ȭ��ȣ <input type="text"></input>
								</p>
								<p>
									�̸��� <input type="text" style="width:130px;"></input> @
									<select name="" style="width:60px;">
										<option value="">����</option>
									</select>
								</p>
								<p>
									�ּ� <input type="text" placeholder="�����ȣ" style="width:130px;"><button type="button">�ּҰ˻�</button></input>
								</p>
								<p>
									���� <select name="">
										<option value="">����</option>
									</select>
								</p>
							</div>
						</div>
						<div class="col">
							<div class="right">
								<p>
									����� <input type="text"></input>
								</p>
								<p>
									��й�ȣ <input type="text"></input>
								</p>
								<p>
									�޴�����ȣ <input type="text"></input>
								</p>
								<p>
									���� <select name="">
										<option value="">����</option>
									</select>
								</p>
								<p>
									<input type="text" placeholder="�ּ�" style="width:100%;"></input>
								</p>
								<p>
									�μ� <select name="">
										<option value="">����</option>
									</select>
								</p>
							</div>
						</div>
						<div class="col">
							<div class="right">
								<p>
									�����̸� <input type="text"></input>
								</p>
								<p>
									��й�ȣ Ȯ�� <input type="text"></input>
								</p>
								<p>
									�ֹι�ȣ <input type="text"></input>
								</p>
								<p>
									���� <input type="text" style="width:80px"></input> ���� <select name="" style="width:80px">
										<option value="">����</option>
									</select>
								</p>
								<p>
								<input type="text" placeholder="�����ּ�" style="width:100%;"></input>
								</p>
								<p>
									���� <input type="text" placeholder="(����)" style="text-align:right"></input>
								</p>
							</div>
						</div>
					</div>
					<br />
					<div class="row">
						<div class="col">
							<div class="right">
								<p>
									�Ի籸�� <select name="">
										<option value="">����</option>
									</select>
								</p>
								<p>
									���� <select name="">
										<option value="">����</option>
									</select>
								</p>
								<p>
									KOSA��� <select name="">
										<option value="">����</option>
									</select>
								</p>
								<p>
									����ڹ�ȣ <input type="text"></input>
								</p>
								<p>
									�ڱ�Ұ� <input type="text" placeholder="100�� ���ܷ� �����ÿ�" style="width:100%; height:50px;" ></input>
								</p>
							</div>
						</div>

						<div class="col">
							<div class="right">
								<p>
									�����з� <select name="">
										<option value="">����</option>
									</select>
								</p>
								<p>
									��� <select name="">
										<option value="">����</option>
									</select>
								</p>
								<p>
									KOSA��� <select name="">
										<option value="">����</option>
									</select>
								</p>
								<p>
									���ü�� <input type="text"></input>
								</p>
							</div>
						</div>
						<div class="col">
							<div class="right">
								<p>
									���Կ��� <select name="">
										<option value="">����</option>
									</select>
								</p>
								<p>
									�Կ��� <input type="text"></input>
								</p>
								<p>
									�Ի��� <input type="text"></input>
								</p>
								<p>
									����ڵ���� <input type="text"></input>
								</p>
								<p>
									�̷¼� <input type="text"></input>
								</p>
							</div>
						</div>
						<div class="col">
							<div class="right">
								<p>
									���ʿ��� <select name="">
										<option value="">����</option>
									</select>
								</p>
								<p>
									������ <input type="text"></input>
								</p>
								<p>
									����� <input type="text"></input>
								</p>
								<p>
									<button type="button">�̸�����</button>
									<button type="button">���</button>
								</p>
								<p>
									<button type="button">�ٿ�</button>
									<button type="button">���� ���ε�</button>
								</p>
							</div>
						</div>
					</div>
				</form>
			</div>

		</main>

	</div>

</body>

</html>
