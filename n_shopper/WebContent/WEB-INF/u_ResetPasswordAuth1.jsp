
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String errorMessage = (String) request.getAttribute("errorMessage");
%>
<!DOCTYPE html>

<html lang="ja">
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />

<title>パスワードリセット認証画面1</title>
<jsp:include page="/common_css.jsp" />

</head>
<body>
	<jsp:include page="/header.jsp" />
	<div class="container" style="max-width: 540px;">
		<div
			class="d-flex flex-column justify-content-center align-items-center mx-auto">
			<br>
			<h2>パスワード再設定</h2>
			<br>
			<!-- エラーメッセージが存在するときだけ表示する -->
			<div id="errormessage"></div>
			<div class="container">
				<form action="U_ResetPasswordAuth" method="post" id="main_form">
					<div class="form-outline mb-1" id="email_outline">
						<label for="email" class="form-label">メールアドレス</label> <input
							type="email" class="form-control" id="email" name="email"
							required="required" placeholder="abc12345@example.co.jp" />
						<div id="validationServerUsernameFeedback"
							class="invalid-feedback">有効なメールアドレスを入力してください</div>
					</div>
					<div class="row mb-1">
						<div class="form-outline col">
							<label for="exampleInputEmail1" class="form-label">生年月日</label>
							<div class="row form-outline ">
								<div class="col" id="year-select_outline">
									<select id="year-select" class="form-select"
										aria-label="Default select example" name="year"
										required="required" onchange="CheckSelectedMonth()">
									</select>
									<div id="validationServerUsernameFeedback"
										class="invalid-feedback">年を入力してください</div>
								</div>
								<div class="col" id="month-select_outline">
									<select id="month-select" class="form-select"
										aria-label="Default select example" name="month"
										required="required" onchange="CheckSelectedMonth()">
									</select>
									<div id="validationServerUsernameFeedback"
										class="invalid-feedback">月を入力してください</div>
								</div>
								<div class="col" id="day-select_outline">
									<select id="day-select" class="form-select"
										aria-label="Default select example" name="day"
										required="required">
									</select>
									<div id="validationServerUsernameFeedback"
										class="invalid-feedback">日を入力してください</div>
								</div>
							</div>
						</div>
					</div>
					<br>
				<div class="row justify-content-center">

					<button type="button" class="btn btn-secondary col-3 mx-2"
						onclick="history.back(-1);return false;">戻る</button>
					<button type="button" id="subm1" class="btn btn-primary col-3 mx-2" disabled>送信</button>
				</div>
					<!-- Modal -->
					<div class="modal fade" id="modal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">送信先確認</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<table class="table">
										<p>
											下記のメールアドレスに認証用パスワードを送ります。<br>よろしいでしょうか？
										</p>
										<tbody>
											<tr>
												<th scope="row" style="border-style: none;">メールアドレス</th>
												<td id="modal_email" style="border-style: none;"></td>
											</tr>
										</tbody>
									</table>

								</div>
								<div class="modal-footer row justify-content-center">
									<button type="button" class="btn btn-secondary col-3 mx-2"
										data-bs-dismiss="modal">いいえ</button>
									<button type="submit" class="btn btn-primary col-3 mx-2">はい</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 5">
		<div id="errorToast" class="toast fade hide" role="alert"
			aria-live="assertive" aria-atomic="true">
			<div class="toast-header">
				<img src="" width="20" height="20" class="rounded me-2" alt="result" />
				<strong class="me-auto"> </strong> <small>たったいま</small>
				<button type="button" class="btn-close" data-bs-dismiss="toast"
					aria-label="Close"></button>
			</div>
		</div>
	</div>
	<jsp:include page="/common_js.jsp" />
	<script type="text/javascript" src="js/additional.js"></script>
	<script type="text/javascript" src="js/validation.js"></script>
	<script type="text/javascript" src="js/validation_forResetPassAuth1.js"></script>
	<script type="text/javascript" src="js/resetPassAuth1.js"></script>
</body>
</html>