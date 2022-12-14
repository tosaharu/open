<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="ja">
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>退会確認</title>
<jsp:include page="/common_css.jsp" />
</head>
<body>
	<jsp:include page="/header.jsp" />
	<div class="container" style="max-width: 540px;">
		<div
			class="d-flex flex-column justify-content-center align-items-center">
			<br>
			<h2>退会確認</h2>
			<br>
			<img src="data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 12 12' width='12' height='12' fill='none' stroke='%23dc3545'%3e%3ccircle cx='6' cy='6' r='4.5'/%3e%3cpath stroke-linejoin='round' d='M5.8 3.6h.4L6 6.5z'/%3e%3ccircle cx='6' cy='8.2' r='.6' fill='%23dc3545' stroke='none'/%3e%3c/svg%3e" width="120" height="120" class="rounded me-2"
				alt="allert" />
			<form action="U_Quit" method="post">
			<p class="text-center">
				退会手続きを実行します。<br>お客様の情報はすべて削除されますがよろしいでしょうか？
			</p>
			<br>
				<div class="form-outline mb-1 row justify-content-center">
					<button type="button" class="btn btn-secondary col-3 mx-2"
						onclick="history.back(-1);return false;">いいえ</button>
					<br>
					<button type="submit" class="btn btn-danger col-3 mx-2">はい</button>
				</div>
			</form>
		</div>
	</div>



	<jsp:include page="/common_js.jsp" />

</body>
</html>
