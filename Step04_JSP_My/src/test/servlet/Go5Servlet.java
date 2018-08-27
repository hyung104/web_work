package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/go5")
public class Go5Servlet extends HttpServlet   {
	@Override
	protected void service(HttpServletRequest request, 
							HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/go5 요청 처리중...");
		//요청 전달자 객체의 참조값 얻어와서
		RequestDispatcher rd=request.getRequestDispatcher("/gura.jsp");
		//forward 이동하기
		rd.forward(request, response);
	}
}
