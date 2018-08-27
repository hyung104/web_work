package test.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/sessionScope/showInfo")
public class ShowInfoServlet extends HttpServlet  {
	@Override
	protected void service(HttpServletRequest request, 
							HttpServletResponse response) throws ServletException, IOException {
		//세션 영역(sessioin scope)에 정보 담기
		//세션 - 웹브라우저를 닫거나, 특정시간이(기본 30분) 지나거나, 세션 지워라 메소드 실행하면 지워짐.
		//세션 - 로그인, 로그아웃 처리시.  값을 담느냐 지우느냐.
		HttpSession session=request.getSession();
		//.setAttribute("키",value) - value : Object. 뭐든 담을 수 있음
		//"myName" 이라는 키값으로 Stirng type 담기
		session.setAttribute("myName", "김구라");
		
		String cPath=request.getContextPath();
		//리다이렉트 이동하라고 응답하기 - 요청을 다시 함. 
		response.sendRedirect(cPath+"/path2/result.jsp");
	}
}
