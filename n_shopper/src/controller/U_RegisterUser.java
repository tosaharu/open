package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import model.GetList;
import model.U_LoginLogic;
import model.U_User;

/***
 * Servlet implementation class U_RegisterUser
 */
@WebServlet("/U_RegisterUser")
public class U_RegisterUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//エリアデータを取得してリクエストスコープに入れる
		GetList.AreaPrefectureRegion(request);

		//		フォームにフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/u_RegisterForm.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//エリアデータを取得してリクエストスコープに入れる
		GetList.AreaPrefectureRegion(request);

		request.setCharacterEncoding("UTF-8");

		//リクエストパラメーター取得
		String mail = request.getParameter("email");
		String pass = request.getParameter("password");
		String name = request.getParameter("name");
		int gender = 0;
		Date birthday = new Date();
		int area_id = 0;



		try {
			gender = Integer.parseInt(request.getParameter("gender"));

			SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
			String year = request.getParameter("year");
			String month = request.getParameter("month");
			String day = request.getParameter("day");
			String strBirthday = year + "/" + month + "/" + day + " 00:00:00";
			birthday = sdFormat.parse(strBirthday);

			area_id = Integer.parseInt(request.getParameter("area"));
		} catch (ParseException e) {
			e.printStackTrace();
		}

		if ("".equals(mail) || mail==null) {//mailが空白なら戻す
			System.out.println("エラー文：nullまたは @ 入ってないけど、、、");
			request.setAttribute("errorMessage", "適切なメールアドレスを入力してください。");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/u_RegisterForm.jsp");
			dispatcher.forward(request, response);
		}else {

			U_User user = new U_User(mail, pass, name, gender, birthday, area_id);
			UserDAO userDAO = new UserDAO();
			userDAO.userInsert(user);

			// ログイン処理
			U_LoginLogic loginLogic = new U_LoginLogic();
			U_User isLogin = loginLogic.execute(user);
			System.out.println(isLogin);

			// ログイン成功時の処理(-1のときは失敗）
			if (isLogin != null) {

				// ユーザー情報をセッションスコープに保存
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", user);

				// メイン画面（サーブレット）にフォワード
				RequestDispatcher dispatcher = request.getRequestDispatcher("/U_Main");
				dispatcher.forward(request, response);

			} else {
				// エラーメッセージをリクエストスコープに保存
				request.setAttribute("errorMessage", "ログインできません");

				//再度ログイン画面に遷移
				RequestDispatcher dispatcher = request.getRequestDispatcher("/u_Login.jsp");
				dispatcher.forward(request, response);
			}
		}
	}
}