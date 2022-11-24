/**
 *
 */

// toastクラスがついている要素にBootStrapのトーストを適用する
var toastElList = [].slice.call(document.querySelectorAll(".toast"));
var toastList = toastElList.map(function (toastEl) {
	return new bootstrap.Toast(toastEl, {
		// オプション
	});
});

// ボタンをクリックしたときに実行される関数
function showToast() {
	// トーストを表示する
	toastList[0].show();
}

function changeInfo() {
	$.ajax({
		url: "U_ChangeInfo",
		type: "POST",
		data: {
			email: $('input[name="email"]').val(),
			name: $('input[name="name"]').val(),
			gender: $('input[name="gender"]').val(),
			area: $('select[name="area"]').val(),
		}
	}).done(function (result) {
		let changeInfo = Number(result);
		console.log(changeInfo);
		if (changeInfo == 1) {
			console.log("通信成功");
			let src = "data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 8 8'%3e%3cpath fill='%23198754' d='M2.3 6.73.6 4.53c-.4-1.04.46-1.4 1.1-.8l1.1 1.4 3.4-3.8c.6-.63 1.6-.27 1.2.7l-4 4.6c-.43.5-.8.4-1.1.1z'/%3e%3c/svg%3e";
			let text = "基本情報を変更しました";
			$('#changeInfoToast > div > img').attr('src', src);
			$('#changeInfoToast > div > strong').text(text);
		} else {
			console.log("通信失敗");
			let src = "data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 12 12' width='12' height='12' fill='none' stroke='%23dc3545'%3e%3ccircle cx='6' cy='6' r='4.5'/%3e%3cpath stroke-linejoin='round' d='M5.8 3.6h.4L6 6.5z'/%3e%3ccircle cx='6' cy='8.2' r='.6' fill='%23dc3545' stroke='none'/%3e%3c/svg%3e";
			let text = "基本情報を変更できませんでした";
			$('#changeInfoToast > div > img').attr('src', src);
			$('#changeInfoToast > div > strong').text(text);
		}
	}).fail(function (result) {
		//通信失敗時のコールバック
		console.log("通信失敗");
		let src = "data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 12 12' width='12' height='12' fill='none' stroke='%23dc3545'%3e%3ccircle cx='6' cy='6' r='4.5'/%3e%3cpath stroke-linejoin='round' d='M5.8 3.6h.4L6 6.5z'/%3e%3ccircle cx='6' cy='8.2' r='.6' fill='%23dc3545' stroke='none'/%3e%3c/svg%3e";
		let text = "基本情報を変更できませんでした";
		$('#changeInfoToast > div > img').attr('src', src);
		$('#changeInfoToast > div > strong').text(text);
	}).always(function (result) {
		//常に実行する処理
		console.log("通信完了");
		showToast();
	})
}

function changePass() {
	$.ajax({
		url: "Ajax_ChangeUserPassword",
		type: "POST",
		data: {
			password: $('input[name="password"]').val(),
			newpassword: $('input[name="newpassword"]').val(),
		}
	}).done(function (result) {
		let changeInfo = Number(result);
		console.log(changeInfo);
		if (changeInfo == 1) {
			console.log("通信成功");
			let src = "data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 8 8'%3e%3cpath fill='%23198754' d='M2.3 6.73.6 4.53c-.4-1.04.46-1.4 1.1-.8l1.1 1.4 3.4-3.8c.6-.63 1.6-.27 1.2.7l-4 4.6c-.43.5-.8.4-1.1.1z'/%3e%3c/svg%3e";
			let text = "パスワードを変更しました";
			$('#changeInfoToast > div > img').attr('src', src);
			$('#changeInfoToast > div > strong').text(text);
		} else {
			console.log("通信失敗");
			let src = "data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 12 12' width='12' height='12' fill='none' stroke='%23dc3545'%3e%3ccircle cx='6' cy='6' r='4.5'/%3e%3cpath stroke-linejoin='round' d='M5.8 3.6h.4L6 6.5z'/%3e%3ccircle cx='6' cy='8.2' r='.6' fill='%23dc3545' stroke='none'/%3e%3c/svg%3e";
			let text = "パスワードを変更できませんでした";
			$('#changeInfoToast > div > img').attr('src', src);
			$('#changeInfoToast > div > strong').text(text);
			$('#password').empty();
			$('#newpassword1').empty();
			$('#newpassword2').empty();
		}
	}).fail(function (result) {
		//通信失敗時のコールバック
		console.log("通信失敗");
		let src = "data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 12 12' width='12' height='12' fill='none' stroke='%23dc3545'%3e%3ccircle cx='6' cy='6' r='4.5'/%3e%3cpath stroke-linejoin='round' d='M5.8 3.6h.4L6 6.5z'/%3e%3ccircle cx='6' cy='8.2' r='.6' fill='%23dc3545' stroke='none'/%3e%3c/svg%3e";
		let text = "パスワードを変更できませんでした";
		$('#changeInfoToast > div > img').attr('src', src);
		$('#changeInfoToast > div > strong').text(text);
	}).always(function (result) {
		//常に実行する処理
		console.log("通信完了");
		showToast();
	})
}